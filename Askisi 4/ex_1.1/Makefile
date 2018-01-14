#
# Makefile
#
# Operating Systems, Exercise 4
#

CC = gcc
#CFLAGS = -Wall -g
CFLAGS = -Wall -O2 -g

all: scheduler prog execve-example sigchld-example

scheduler: scheduler.o proc-common.o
	$(CC) -o scheduler scheduler.o proc-common.o

prog: prog.o proc-common.o
	$(CC) -o prog prog.o proc-common.o

execve-example: execve-example.o 
	$(CC) -o execve-example execve-example.o

sigchld-example: sigchld-example.o proc-common.o
	$(CC) -o sigchld-example sigchld-example.o proc-common.o

sigchld-example.o: sigchld-example.c
	$(CC) $(CFLAGS) -o sigchld-example.o -c sigchld-example.c

proc-common.o: proc-common.c proc-common.h
	$(CC) $(CFLAGS) -o proc-common.o -c proc-common.c

scheduler.o: scheduler.c proc-common.h request.h
	$(CC) $(CFLAGS) -o scheduler.o -c scheduler.c

prog.o: prog.c
	$(CC) $(CFLAGS) -o prog.o -c prog.c

execve-example.o: execve-example.c
	$(CC) $(CFLAGS) -o execve-example.o -c execve-example.c

clean:
	rm -f scheduler sigchld-example prog execve-example *.o
