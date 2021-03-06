#include <errno.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <signal.h>
#include <string.h>
#include <assert.h>

#include <sys/wait.h>
#include <sys/types.h>

#include "proc-common.h"
#include "request.h"


/* Compile-time parameters. */
#define SCHED_TQ_SEC 2                               /* time quantum */
#define TASK_NAME_SZ 60                              /* maximum size for a task's name */


/* Used simply linked list previous of head is NULL and next of last is head. Empty list head = NULL */
typedef struct node node_t;                          /* node struct */
node_t *insertToEmpty(node_t *current, pid_t p);     /* insert a node to empty list returns the node */
node_t *insertToList(node_t *current, pid_t p);      /* insert a node to the end of the list */
void deleteFromList(pid_t p);                        /* delete node from list via pid */

node_t *running=NULL, *head=NULL;

typedef struct node {
    pid_t p;
    struct node *next;
} node_t;


/*
 * SIGALRM handler
 */
    static void
sigalrm_handler(int signum)
{
    if (signum != SIGALRM) {
        fprintf(stderr, "Internal error: Called for signum %d, not SIGALRM\n",
                signum);
        exit(1);
    }

    /* Edw prepei na stamataw thn trexousa diergasia */
    printf("ALARM! %d seconds have passed.\n", SCHED_TQ_SEC);
    kill(running->p,SIGSTOP);

}


/*
 * SIGCHLD handler
 */
    static void
sigchld_handler(int signum)
{
    pid_t p;
    int status;

    if (signum != SIGCHLD) {
        fprintf(stderr, "Internal error: Called for signum %d, not SIGCHLD\n",
                signum);
        exit(1);
    }

    for (;;) {
        p = waitpid(-1, &status, WUNTRACED | WNOHANG);
        if (p < 0) {
            perror("waitpid");
            exit(1);
        }
        if (p == 0)
            break;

        explain_wait_status(p, status);

        if (WIFEXITED(status) || WIFSIGNALED(status)) {
            /* A child has died */
            printf("Parent: Received SIGCHLD, child is dead. Exiting.\n");
            deleteFromList(p);
            if(head==NULL){
                printf("All processe finished. Exiting...\n");
                exit(0);
            }
        }

        if (WIFSTOPPED(status)) {
            /* A child has stopped due to SIGSTOP/SIGTSTP, etc... */
            printf("Parent: Child has been stopped. Moving right along...\n");
        }
        /* Choose next process */
        running = running->next;
        if (running != running->next) alarm(SCHED_TQ_SEC); /* Doesn't need to set alarm if only one process */
        kill(running->p,SIGCONT);
    }
}

/* Install two signal handlers.
 * One for SIGCHLD, one for SIGALRM.
 * Make sure both signals are masked when one of them is running.
 */
    static void
install_signal_handlers(void)
{
    sigset_t sigset;
    struct sigaction sa;

    sa.sa_handler = sigchld_handler;
    sa.sa_flags = SA_RESTART;
    sigemptyset(&sigset);
    sigaddset(&sigset, SIGCHLD);
    sigaddset(&sigset, SIGALRM);
    sa.sa_mask = sigset;
    if (sigaction(SIGCHLD, &sa, NULL) < 0) {
        perror("sigaction: sigchld");
        exit(1);
    }

    sa.sa_handler = sigalrm_handler;
    if (sigaction(SIGALRM, &sa, NULL) < 0) {
        perror("sigaction: sigalrm");
        exit(1);
    }

    /*
     * Ignore SIGPIPE, so that write()s to pipes
     * with no reader do not result in us being killed,
     * and write() returns EPIPE instead.
     */
    if (signal(SIGPIPE, SIG_IGN) < 0) {
        perror("signal: sigpipe");
        exit(1);
    }
}

int main(int argc, char *argv[])
{
    int nproc, i;
    /*
     * For each of argv[1] to argv[argc - 1],
     * create a new child process, add it to the process list.
     */
    node_t *curr = NULL;
    char *executable = malloc(sizeof(char *));
    char *newargv[] = { executable, NULL, NULL, NULL };
    char *newenviron[] = { NULL };
    nproc = argc - 1; /* number of proccesses goes here */

    pid_t p;

    for( i = 1; i <= nproc; i++){

        p = fork();
        if (p < 0) {
            /* fork failed */
            perror("fork");
            exit(1);
        }

        if (p == 0) {
            raise(SIGSTOP);
            strcpy(executable,argv[i]);
            execve(executable, newargv, newenviron);
            /* execve() only returns on error */
            perror("execve");
            exit(1);
            assert(0);
        }
        else{
            if (i==1) {
                head = insertToEmpty(head,p);
                curr = head;
            }
            else {
                curr = insertToList(curr,p);
            }
        }
    }

    /* Wait for all children to raise SIGSTOP before exec()ing. */
    wait_for_ready_children(nproc);

    /* Install SIGALRM and SIGCHLD handlers. */
    install_signal_handlers();

    if (nproc == 0) {
        fprintf(stderr, "Scheduler: No tasks. Exiting...\n");
        exit(1);
    }


    running = head;
    if(running != running->next) alarm(SCHED_TQ_SEC);
    kill(running->p,SIGCONT);
    /* loop forever  until we exit from inside a signal handler. */
    while (pause())
        ;

    /* Unreachable */
    fprintf(stderr, "Internal error: Reached unreachable point\n");
    return 1;
}

node_t *insertToEmpty ( node_t *current, pid_t p) {
    if( current !=NULL )
        return current;
    node_t *c = (node_t*)malloc(sizeof(node_t));
    c->p = p;
    c->next = c;
    current = c;

    return current;
}

node_t *insertToList(node_t *current, pid_t p){
    if (current == NULL)
        return insertToEmpty(current, p);

    node_t *temp = (node_t *)malloc(sizeof(node_t));

    temp->p = p;

    temp -> next = current -> next;
    current -> next = temp;
    current = temp;

    return current;
}

void deleteFromList (pid_t p){
    if(head==NULL)
        return;

    node_t *curr = head, *prev=NULL;

    while (curr->p != p ) {
        if (curr->next == head)
            break;
        prev = curr;
        curr = curr->next;
    }
    if(prev==NULL && curr->next==head) {
        head = NULL;
        return ;
    }
    if (curr==head){
        prev = head;
        while(prev->next != head)
            prev = prev ->next;
        head = curr->next;
        prev->next = head;
        free(curr);
    }
    else if (curr->next == head){
        prev->next = head;
        free(curr);
    }
    else {
        prev->next = curr->next;
        free(curr);
    }
}
