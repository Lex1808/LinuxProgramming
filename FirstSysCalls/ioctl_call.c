#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include <linux/kd.h>

int main() {
        int tty_fd = open("/path/to/device", O_WRONLY);
        if (tty_fd == -1) {
                perror("open");
                return 1;
        }

        ioctl(tty_fd, KDSETLED, LED_NUM|LED_CAP|LED_SCR);
        close(tty_fd);

        return 0;
}
