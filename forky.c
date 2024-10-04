#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

// Implement three patterns of forking threads
// 1. Main calls all threads
// 2. Recursive call of threads
// 3. Heap-like call of threads

// Each process goals:
// Print process beginning
// Print process making a process(if it does)
// Print process exiting
// Try to add the PID in this calls

void makeProcess(int size, int count, int prevPid);

int main (int argc, char* argv[]) {
  int pattern;
  int size;
  srand(0);

  if(argc < 3
     || sscanf(argv[1], "%d", &size) == 0
     || sscanf(argv[2], "%d", &pattern) == 0) {
        printf("Invaild input: ./forky.exe <size> <patternNum>\n");
        return(1);
     }
  // pid_t p = fork();
  // if(p < 0) {
  //   perror("fork fail");
  //   exit(1);
  // }
  // for(int index = 0; index < size; index++) {
  //   fork();
  //   printf("Process %d starting", index + 1);
  // }
    if (pattern == 1) {
        for(int i = 0; i < size; i++) {
            if(fork() == 0) {
                // Begin child process
                printf("Process child process %d (%d)\n", i + 1, getpid());
                
                sleep(rand() % 8);
                // Exit child
                printf("Exiting child process %d (%d)\n", i + 1, getpid());
                exit(0);
            }
        }
        
        int status;
        for(int i = 0; i < size; i++) {
            wait(&status);
        }
    }
    // TODO - Recursively call the process to call a another process of process.
    if (pattern == 2) {
        printf("Pattern 2\n");
        makeProcess(size, 0, 0);
    }

    /* OPTIONAL */
    if (pattern == 3) {
        printf("Pattern 3\n");
    }

  return 0;
}

void makeProcess(int size, int count, int prevPid) {
    if(fork() == 0 && count < size) {
        if(prevPid != 0) {
            printf("Process %d (%d) started Process %d (%d)\n", count, prevPid, count + 1, getpid());
        }

        count += 1;
        prevPid = getpid();
        printf("Process %d beginning (%d)\n", count, prevPid);
        makeProcess(size, count, prevPid);
        sleep(rand() % 8);
        printf("Process %d exiting (%d)\n", count, prevPid);
        exit(0);
    }
}