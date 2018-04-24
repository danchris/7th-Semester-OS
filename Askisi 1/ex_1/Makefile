.PHONY: all clean

all: main zing2

main: main.o zing.o
	gcc -o main main.o zing.o 

main.o: main.c zing.h 
	gcc -Wall -c main.c

zing2: main.o zing2.o
	gcc -o zing2 main.o zing2.o

zing2.o: zing2.c
	gcc -Wall -c zing2.c

clean: 
	rm main main.o zing2 zing2.o

