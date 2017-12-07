.PHONY = all clean

all = ex_1.4

CC = gcc
CFLAGS = -g -Wall -O2
SHELL= /bin/bash

ex_1.4: ex_1.4.o proc-common.o tree.o
	$(CC) $(CFLAGS) $^ -o $@

%.s: %.c
	$(CC) $(CFLAGS) -S -fverbose-asm $<

%.o: %.c
	$(CC) $(CFLAGS) -c $<

%.i: %.c
	gcc -Wall -E $< | indent -kr > $@

clean:
	rm -f pipe-example pipe-example.o
