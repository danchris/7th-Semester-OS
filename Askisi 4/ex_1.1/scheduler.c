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
#define SCHED_TQ_SEC 2                /* time quantum */
#define TASK_NAME_SZ 60               /* maximum size for a task's name */

typedef struct node {
    pid_t p;
    struct node *prev;
    struct node *next;
} node_t;

node_t *running=NULL;
void insertToList (node_t *current, node_t *new) {
    if(current==NULL) {
        new->next = new;
        new->prev = current;
    }
    else {
        new->next = current->next;
        current->next = new;
        new->prev = current;
    }
}

void deleteFromList (node_t *deleted) {

    if((deleted->next)->next == deleted) {
        (deleted->next)->next = deleted->next;
        deleted->next->prev = NULL;
    }
    else {
        (deleted->prev)->next = deleted->next;
        (deleted->next)->prev = deleted->prev;
    }
    free(deleted);
}

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

        node_t *temp = running;
        running = temp->next;

        if (WIFEXITED(status) || WIFSIGNALED(status)) {
			/* A child has died */
			printf("Parent: Received SIGCHLD, child is dead. Exiting.\n");
            deleteFromList(temp);
		}

		if (WIFSTOPPED(status)) {
			/* A child has stopped due to SIGSTOP/SIGTSTP, etc... */
			printf("Parent: Child has been stopped. Moving right along...\n");
		}
        alarm(SCHED_TQ_SEC);
        if(running->p == 0) running = running->next;
        printf("Child with pid = %d will continue\n", running->p);
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
	int nproc;
	/*
	 * For each of argv[1] to argv[argc - 1],
	 * create a new child process, add it to the process list.
	 */
    node_t *head = NULL, *curr = NULL;
	char *executable = malloc(sizeof(char *));
	char *newargv[] = { executable, NULL, NULL, NULL };
	char *newenviron[] = { NULL };
	nproc = argc - 1; /* number of proccesses goes here */

    pid_t p;

    for(int i = 1; i <= nproc; i++){

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
            node_t *new = malloc(sizeof(node_t));
            new->p = p;
            if (i==1) {
                head = new;
                head->prev = NULL;
                curr = head;
                insertToList(head,head);
            }
            else {
                insertToList(curr,new);
                curr = new;
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



  //  running = malloc(sizeof(node_t));
    running = head;
    alarm(SCHED_TQ_SEC);
    kill(running->p,SIGCONT);
	/* loop forever  until we exit from inside a signal handler. */
	while (pause())
		;

	/* Unreachable */
	fprintf(stderr, "Internal error: Reached unreachable point\n");
	return 1;
}
