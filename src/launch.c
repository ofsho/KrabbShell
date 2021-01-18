#ifndef bui
    #ifndef _main__
        #ifndef loop
            #ifndef execute
              #ifndef other
                #define launch
              #endif
            #endif
        #endif
    #endif
#endif

#ifdef launch
  #include "builtins.c"
  #include "execute.c"
  #include "otherFunctions.c"
  #include "loop.c"
  #include "includes.h"
#endif

// Launch
int krabbsh_launch(char **args)
{
  pid_t pid, wpid;
  int status;

  pid = fork();
  if (pid == 0) {
    // Child process
    if (execvp(args[0], args) == -1) {
      perror("krabbsh");
      errwrning = 'e';
    }
    exit(EXIT_FAILURE);
  } else if (pid < 0) {
    // Error forking
    perror("krabbsh");
    errwrning = 'e';
  } else {
    // Parent process
    do {
      wpid = waitpid(pid, &status, WUNTRACED);
    } while (!WIFEXITED(status) && !WIFSIGNALED(status));
  }

  return 1;
}