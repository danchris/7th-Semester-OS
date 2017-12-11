/*
 * mandel.c
 *
 * A program to draw the Mandelbrot Set on a 256-color xterm.
 *
 */
#include <stdio.h>
#include <unistd.h>
#include <assert.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>
#include <pthread.h>
#include <semaphore.h>
#include <errno.h>
#include <signal.h>

#include "mandel-lib.h"

#define MANDEL_MAX_ITERATION 100000
#define perror_pthread(ret, msg) \
	do { errno = ret; perror(msg); } while (0)

/***************************
 * Compile-time parameters *
 ***************************/
struct thread_args {
    int fd;
    int line;
};

/*
 * Output at the terminal is is x_chars wide by y_chars long
*/
int y_chars = 50;
int x_chars = 90;

/*
 * The part of the complex plane to be drawn:
 * upper left corner is (xmin, ymax), lower right corner is (xmax, ymin)
*/
double xmin = -1.8, xmax = 1.0;
double ymin = -1.0, ymax = 1.0;

/*
 * Every character in the final output is
 * xstep x ystep units wide on the complex plane.
 */
double xstep;
double ystep;

/*
 * This function computes a line of output
 * as an array of x_char color values.
 */
void compute_mandel_line(int line, int color_val[])
{
	/*
	 * x and y traverse the complex plane.
	 */
	double x, y;

	int n;
	int val;

	/* Find out the y value corresponding to this line */
	y = ymax - ystep * line;

	/* and iterate for all points on this line */
	for (x = xmin, n = 0; n < x_chars; x+= xstep, n++) {

		/* Compute the point's color value */
		val = mandel_iterations_at_point(x, y, MANDEL_MAX_ITERATION);
		if (val > 255)
			val = 255;

		/* And store it in the color_val[] array */
		val = xterm_color(val);
		color_val[n] = val;
	}
}

/*
 * This function outputs an array of x_char color values
 * to a 256-color xterm.
 */
void output_mandel_line(int fd, int color_val[])
{
	int i;

	char point ='@';
	char newline='\n';

	for (i = 0; i < x_chars; i++) {
		/* Set the current color, then output the point */
		set_xterm_color(fd, color_val[i]);
		if (write(fd, &point, 1) != 1) {
			perror("compute_and_output_mandel_line: write point");
			exit(1);
		}
	}

	/* Now that the line is done, output a newline character */
	if (write(fd, &newline, 1) != 1) {
		perror("compute_and_output_mandel_line: write newline");
		exit(1);
	}
}

void *compute_and_output_mandel_line(void *data)
{
	/*
	 * A temporary array, used to hold color values for the line being drawn
	 */
    struct thread_args *args = (struct thread_args *) data;
	int color_val[x_chars];
    int fd = args->fd;
    int line = args->line;

	compute_mandel_line(line, color_val);
	output_mandel_line(fd, color_val);

  //  free(args);

    return NULL;
}

int main(int argc, char** argv) {

    if (argc < 2) {
        fprintf(stderr,"Usage %s <NTHREADS>\n",argv[0]);
        exit(1);
    }
    int N = atoi(argv[1]);
    int line, ret;
    pthread_t t[N][y_chars];

  //  sem_t sem[y_chars];
   sem_t s1,s2;


	xstep = (xmax - xmin) / x_chars;
	ystep = (ymax - ymin) / y_chars;

	/*
	 * draw the Mandelbrot Set, one line at a time.
	 * Output is sent to file descriptor '1', i.e., standard output.
	 */
    sem_init(&s1, 0, 1);
    for(int i = 0; i < N; i++) {
        sem_init(&s2,0,1);
        sem_wait(&s1);
        for(line = 0; line < y_chars; line++) {
            struct thread_args *arguments = malloc(sizeof(struct thread_args));
            arguments->fd = 1;
            arguments->line = line;
            sem_wait(&s2);
            ret = pthread_create(&t[i][line], NULL, compute_and_output_mandel_line, arguments);
            if(ret) {
                perror_pthread(ret, "pthread_create");
                exit(1);
            }
            sem_post(&s2);
            sem_destroy(&s2);
        }
        sem_post(&s1);
        sem_destroy(&s1);
    }
    for( int i = 0; i < N; i++) {
        for(line = 0; line < y_chars; line++) {
            ret = pthread_join(t[i][line], NULL);
            if (ret)
                perror_pthread(ret, "pthread_join");
        }
    }
	reset_xterm_color(1);
	return 0;
}
