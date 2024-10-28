#include <unistd.h>
#include <stdlib.h>

// size_t write(int fildes, const void *buf, size_t nbyte)

int main()
{
        if (write(1, "My first write\n", 15) != 15) {
                write(2, "A write error has occurred on file descriptor 1\n", 46);
        }

        exit(0);
}
