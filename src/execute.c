#ifndef bui
    #ifndef _main__
        #ifndef launch
            #ifndef loop
              #ifndef other
                #define execute
              #endif
            #endif
        #endif
    #endif
#endif

#ifdef execute
  #include "builtins.c"
  #include "launch.c"
  #include "otherFunctions.c"
  #include "loop.c"
  #include "includes.h"
#endif

// Execute
int krabbsh_execute(char **args)
{
  int i;

  if (args[0] == NULL) {
    // An empty command was entered.
    return 1;
  }

  for (i = 0; i < krabbsh_num_builtins(); i++) {
    if (strcmp(args[0], builtin_str[i]) == 0) {
      return (*builtin_func[i])(args);
    }
  }

  return krabbsh_launch(args);
}