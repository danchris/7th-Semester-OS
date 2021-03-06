#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <sys/types.h>
#include <sys/wait.h>

#include "proc-common.h"

#define SLEEP_PROC_SEC  10
#define SLEEP_TREE_SEC  3

/*
 * Create this process tree:
 * A-+-B---D
 *   `-C
 */
void fork_procs(void)
{
	/*
	 * initial process is A.
	 */
    pid_t pB, pC, pD;
    int status;

	change_pname("A");
    printf("A: Starting...\n");
    fprintf(stderr, "Parent, PID = %ld: Creating child...\n", (long)getpid());
    pC = fork();

    if ( pC < 0) {
        perror("fork");
        exit(1);
    }

    if ( pC == 0 ) {
        change_pname("C");
        printf("C: Starting...\n");
        printf("C: Sleeping...\n");
        sleep(SLEEP_PROC_SEC);
        printf("C: Exiting...\n");
        exit(17);
    }

    fprintf(stderr, "Parent, PID = %ld: Creating child...\n", (long)getpid());
    pB = fork();

    if ( pB < 0 ) {
        perror("fork");
        exit(1);
    }

    if ( pB == 0) {
        change_pname("B");
        printf("B: Starting...\n");
        fprintf(stderr, "Parent, PID = %ld: Creating child...\n", (long)getpid());
        pD = fork();

        if ( pD < 0) {
            perror("fork");
            exit(1);
        }

        if ( pD == 0) {
            change_pname("D");
            printf("D: Starting...\n");
            printf("D: Sleeping...\n");
            sleep(SLEEP_PROC_SEC);
            printf("D: Exiting...\n");
            exit(13);
        }
        printf("B: Sleeping...\n");
        sleep(SLEEP_PROC_SEC);
        pD  = wait(&status);
        explain_wait_status(pD , status);

        printf("B: Exiting...\n");
        exit(19);

    }

	printf("A: Sleeping...\n");
	sleep(SLEEP_PROC_SEC);
    pB  = wait(&status);
	explain_wait_status(pB , status);

    pC  = wait(&status);
	explain_wait_status(pC, status);

    printf("A: Exiting...\n");
	exit(16);
}

/*
 * The initial process forks the root of the process tree,
 * waits for the process tree to be completely created,
 * then takes a photo of it using show_pstree().
 *
 * How to wait for the process tree to be ready?
 * In ask2-{fork, tree}:
 *      wait for a few seconds, hope for the best.
 * In ask2-signals:
 *      use wait_for_ready_children() to wait until
 *      the first process raises SIGSTOP.
 */
int main(void)
{
	pid_t pid;
	int status;

	/* Fork root of process tree */
	pid = fork();
	if (pid < 0) {
		perror("main: fork");
		exit(1);
	}
	if (pid == 0) {
		/* Child */
		fork_procs();
		exit(1);
	}

	/*
	 * Father
	 */

	/* for ask2-{fork, tree} */
    sleep(SLEEP_TREE_SEC);

	/* Print the process tree root at pid */
	show_pstree(pid);


	/* Wait for the root of the process tree to terminate */
	pid = wait(&status);
	explain_wait_status(pid, status);

	return 0;
}
