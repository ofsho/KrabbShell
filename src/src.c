#ifndef bui
    #ifndef _main__
        #ifndef loop
            #ifndef execute
              #ifndef other
                #ifndef launch
                    #define src
                #endif
              #endif
            #endif
        #endif
    #endif
#endif

#ifdef src
  #include "builtins.c"
  #include "execute.c"
  #include "otherFunctions.c"
  #include "loop.c"
  #include "launch.c"
  #include "includes.h"
#endif

int krabbsh_src(char **args)
{
    FILE * fp;
    char * line = NULL;
    size_t len = 0;
    ssize_t read;

    fp = fopen(args[1], "r");
        if (fp == NULL){
            printf("ap");
            printf(RED "krabbsh: error source file not found (%s)\n" NORMAL, args[1]);
            return 1;
        }

        while ((read = getline(&line, &len, fp)) != -1)
        {
            args = krabbsh_split_line(line);
            if (strcmp("exit", line) == 0 || strcmp("exit\n", line) == 0)
            {
                return 1;
            }
            else if (strcmp("escape", line) == 0 || strcmp("escape\n", line) == 0)
            {
                exit(0);
            }
            krabbsh_execute(args);
    }

    fclose(fp);
    if (line)
        free(line);

    return 1;
}