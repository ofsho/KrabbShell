#ifndef loop
    #ifndef _main__
        #ifndef launch
            #ifndef execute
              #ifndef other
                  #define bui
              #endif
            #endif
        #endif
    #endif
#endif

#ifdef bui
  #include "launch.c"
  #include "execute.c"
  #include "otherFunctions.c"
  #include "loop.c"
  #include "history.c"
  #include "includes.h"
#endif

/*
  * CD
  * HELP
  * EXIT
  * ESCAPE
  * DIR
  * WERROR
  * COUNTDOWN
*/

// CD 
int krabbsh_cd(char **args)
{
  if (args[1] == NULL) {
    fprintf(stderr, RED "krabbsh: expected argument to \"cd\"\n" NORMAL);
    errwrning = 'e';
  }
  else {
    if (chdir(args[1]) != 0) {
      perror(HYELLOW "WARNING:  " NORMAL  YELLOW"krabbsh" NORMAL);
      errwrning = 'w';
    }
    else{
      errwrning = 'n';
    }
  }
  return 1;
}

// HELP
int krabbsh_help(char **args)
{
  int i;
  printf(BLUE "Official KRABBSH\n");
  printf("Type program names and arguments, and hit enter.\n" );
  printf("The following are built in:\n" NORMAL);

  for (i = 0; i < krabbsh_num_builtins(); i++) {
    printf("  %s\n", builtin_str[i]);
  }

  printf("Use the man command for information on other programs.\n");
  return 1;
}

// EXIT
int krabbsh_exit(char **args)
{
  printf(BLACK "CLOSING\n" NORMAL);
  return 0;
}

// ESCAPE
int krabbsh_escape(char **args)
{
  printf(BLACK "CLOSING\n" NORMAL);
  exit(0);
  return 0;
}

// DIR
int krabbsh_dir(char **args)
{
    timesdir+=1;
    if (timesdir %2 == 0){
        directory = 0;
    }
    else{
        directory = 1;
    }
    return 1;
}

// WERROR
int krabbsh_werror(char **args)
{
    char code[] = "";
    printf(YELLOW" WARNING IS IN YELLOW " RED " ERROR IS IN RED\n" BLUE);
    printf("Get Code: "NORMAL);
    scanf("%s", code);
    if (strcmp(code, "KRABBSHELL340") == 0){
        printf(YELLOW"WARNING: "MAGENTA"  Return value not set");
        printf(BLUE"FIX:  "NORMAL"     `return value`");
    }
    return 1;
}

// HISTORY
int krabbsh_history(char **args){
  history_main();
  return 1;
}

// COUNTDOWN
/*
    TODO: COUNTDOWN
*/
int krabbsh_countdown(char **args)
{
    return 1;
}
