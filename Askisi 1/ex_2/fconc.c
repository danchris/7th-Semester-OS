#include <stdio.h>
#include <unistd.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdlib.h>
#include <string.h>


void doWrite(int fd, const char *buff, int len);
void write_file(int fd, const char *infile);

int main (int argc, char **argv){

    if(argc < 3){
        printf("Usage: ./.fconc infile1 infile2 [outfile (default:fconc.out)]\n");
        return -1;
    }

    int fd;
    mode_t mode = S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP | S_IROTH | S_IWOTH;

    if (argc==4) {
        fd = open(argv[3], O_CREAT| O_WRONLY | O_TRUNC, mode);
    }
    else {
        fd = open("fconc.out", O_CREAT| O_WRONLY | O_TRUNC, mode);
    }

    write_file(fd, argv[1]);
    write_file(fd, argv[2]);

    if(close(fd) < 0){
        perror("close");
        exit(1);
    }

    return 0;
}


void write_file(int fd, const char *infile){

    char buff[1024];
    int temp;
    ssize_t ret;

  //  memset(&buff[0],0,sizeof(buff));
    temp = open(infile, O_RDONLY);

    if (temp < 0){
        perror(infile);
        exit(1);
    }

    while(1){
        ret = read(temp, buff, 1024);

        if ( ret == -1 ) {
            perror("read");
            exit(1);
        }

        doWrite(fd,buff,ret);

        if (ret < 1024) break;
	buff[ret]='\0';
       // else memset(&buff[0],0,sizeof(buff));
    }

    if(close(temp) < 0 ){
        perror("close");
        exit(1);
    }

}

void doWrite(int fd, const char *buff, int len){
	size_t idx;
	ssize_t wcnt;
	idx=0;
	do {
		wcnt = write(fd,buff+idx,len-idx);
		if (wcnt == -1) {
			perror("write");
			exit(1);
		}
		idx +=wcnt;
	} while(idx<len);
}

