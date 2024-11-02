#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <stdlib.h>
#include <stdio.h>

int main()
{
        struct stat statbuf;
        mode_t modes;

        stat("filename", &statbuf);
        modes = statbuf.st_mode;

        if(!S_ISDIR(modes) && (modes & S_IRWXU) == S_IXUSR) {
                printf("Is file and it's executble\n");
        } else {
                printf("Somthing wrong");
        }

        exit(0);
}
