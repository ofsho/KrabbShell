#ifndef bui
    #ifndef _main__
        #ifndef launch
            #ifndef execute
              #ifndef other
                #define loop
              #endif
            #endif
        #endif
    #endif
#endif

#ifdef loop
    #include "builtins.c"
    #include "execute.c"
    #include "otherFunctions.c"
    #include "launch.c"
    #include "includes.h"
#endif

// Loop
void krabbsh_loop(void)
{
  char *line;
  char **args;
  int status = 0;

  do {
    timeis++;
    if(directory == true){
        char cwd[PATH_MAX];
        if (getcwd(cwd, sizeof(cwd)) != NULL) {
            printf("%s ", cwd);
        } else {
            perror(YELLOW "getcwd() error : Tagged as warning\n" NORMAL MAGENTA);
            errwrning = 'w';
            printf(NORMAL);
        }
    }
    if (access( ".git", F_OK ) != -1 ){
        if (errwrning == 'e'){
             printf(CYAN " { git } "RED" -> " NORMAL);
         }
         else if (errwrning == 'w'){
         printf( CYAN " { git } " YELLOW " -> " NORMAL);
         }
         else if (errwrning == 'n'){
             printf( CYAN " { git } " GREEN " -> " NORMAL);
         }else{
             printf(" {} -> ");
         }
    }
    else{
       if (errwrning == 'e'){
            printf(RED " {} -> " NORMAL);
        }
        else if (errwrning == 'w'){
        printf(YELLOW " {} -> " NORMAL);
        }
        else if (errwrning == 'n'){
            printf(GREEN " {} -> " NORMAL);
        }else{
            printf(" {} -> ");
        }
    }
    line = krabbsh_read_line();
    args = krabbsh_split_line(line);
    
    if (bl == false){
        if (strchr(line, '#') == NULL){
            status = krabbsh_execute(args);
        }
    }
    free(line);
    free(args);
  } while (status);
}