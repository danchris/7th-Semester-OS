#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <string.h>
#include "tree.h"
#include "proc-common.h"

#define SLEEP_PROC_SEC 10
#define SLEEP_TREE_SEC 3

void fork_procs(struct tree_node *root, int fd){

    /*
     * Start
     */
    pid_t pid[root->nr_children];
    int i;
    int pfd[2];
    char name[NODE_NAME_SIZE];
    int res = 0;

    printf("PID = %ld, name %s, starting...\n", (long)getpid(), root->name);
    change_pname(root->name);

    printf("Parent: Creating pipe...\n");
    if (pipe(pfd) < 0) {
        perror("pipe");
        exit(1);
    }
    for (i=0; i < (root->nr_children); i++) {


        pid[i] = fork();

        printf("Parent: Creating child...\n");
        if (pid[i] < 0){
            perror("fork_procs: fork");
            exit(1);
        }
        if (pid[i] == 0) {
            /* Child */
            fork_procs(((root->children)+i),pfd[1]);
            assert(0);
        }
    }


    if (root->nr_children != 0){

        /* Code of Parent*/

        /* Need to close the write pipe Parent to his Child */

        close(pfd[1]);

        sleep(SLEEP_TREE_SEC);
        int flag=0;

        /* Check if compute addition(0) or
         * multiplication(1)
         */

        if(!strcmp(root->name,"*")) {
            flag=1;
            res=1;
        }

        /* Parent starts to read from pipe*/

        for (i=0; i<root->nr_children; i++){

            if (read(pfd[0], &name, sizeof(name)) < 0) {
                perror("parent: read from pipe");
                exit(1);
            }
            if (flag) res = res*atoi(name);
            else res = res + atoi(name);

        }

        char tmp[NODE_NAME_SIZE];
        sprintf(tmp,"%d",res);

        /* Parent writes to his parent */

        if (write(fd, &tmp, sizeof(tmp)) != sizeof(tmp)) {
            perror("parent: write to pipe fork_procs");
            exit(1);
        }

        /*Finish read. Close read pipe*/
        close(pfd[0]);
    }
    else {

        /* Code of node without childrens
         * Need to close the pipe of read
         */

        close(pfd[0]);

        sleep(SLEEP_PROC_SEC);

        /*The child writes to his Parent */

        if (write(fd, &root->name, sizeof(root->name)) != sizeof(root->name)) {
            perror("parent: write to pipe fork_procs");
            exit(1);
        }
    }

    /*Finish write. Close write pipe*/
    close(fd);

    /*
     * Exit
     */
    exit(0);
}


int main (int argc, char *argv[]) {

    pid_t p;
    int pfd[2], status, final;
    char result[16];
    struct tree_node *root;


    if (argc < 2){
        fprintf(stderr, "Usage: %s <tree_file>\n", argv[0]);
        exit(1);
    }

    /* Read tree into memory */
    root = get_tree_from_file(argv[1]);

    printf("Parent: Creating pipe...\n");
    if (pipe(pfd) < 0) {
        perror("pipe");
        exit(1);
    }

    printf("Parent: Creating child...\n");
    p = fork();
    if (p < 0) {
        /* fork failed */
        perror("fork");
        exit(1);
    }
    if (p == 0) {
        /* In child process */
        fork_procs(root,pfd[1]);
        /*
         * Should never reach this point,
         * child() does not return
         */
        assert(0);
    }

    sleep(SLEEP_TREE_SEC);

    /*Close write pipe. Don't need.*/
    close(pfd[1]);

    printf("Parent: Created child with PID = %ld, waiting for it to terminate...\n", (long)p);

    show_pstree(p);

    if (read(pfd[0], &result, sizeof(result)) < 0) {
        perror("parent: write to pipe");
        exit(1);
    }

    p = wait(&status);
    explain_wait_status(p, status);

    final = atoi(result);

    printf("Parent: All done, exiting...\n");
    printf("Result = %d\n", final);

    /* Close read pipe */
    close(pfd[0]);

    return 0;
}
