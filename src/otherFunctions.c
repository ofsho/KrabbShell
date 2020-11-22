#ifndef bui
    #ifndef _main__
        #ifndef launch
            #ifndef execute
              #ifndef loop
                #define other
              #endif
            #endif
        #endif
    #endif
#endif

#ifdef other
  #include "builtins.c"
  #include "execute.c"
  #include "launch.c"
  #include "loop.c"
  #include "includes.h"
#endif

/*
    * read line
    * split line
*/

#define KRABBSH_RL_BUFSIZE 1024
#define KRABBSH_TOK_BUFSIZE 64
#define KRABBSH_TOK_DELIM " \t\r\n\a"

// read line
char *krabbsh_read_line(void)
{
  int bufsize = KRABBSH_RL_BUFSIZE;
  int position = 0;
  char *buffer = malloc(sizeof(char) * bufsize);
  int c;

  if (!buffer) {
    fprintf(stderr, RED "krabbsh: allocation error\n" NORMAL);
    errwrning = 'e';
    exit(EXIT_FAILURE);
  }

  while (1) {
    // Read a character
    c = getchar();

    // If we hit EOF, replace it with a null character and return.
    if (c == EOF || c == '\n') {
      buffer[position] = '\0';
      return buffer;
    } else {
      buffer[position] = c;
    }
    position++;

    // If we have exceeded the buffer, reallocate.
    if (position >= bufsize) {
      bufsize += KRABBSH_RL_BUFSIZE;
      buffer = realloc(buffer, bufsize);
      if (!buffer) {
        fprintf(stderr, RED "krabbsh: allocation error\n" NORMAL);
        errwrning = 'e';
        exit(EXIT_FAILURE);
      }
    }
  }
}

// split line
char **krabbsh_split_line(char *line)
{
  int bufsize = KRABBSH_TOK_BUFSIZE, position = 0;
  char **tokens = malloc(bufsize * sizeof(char*));
  char *token;

  if (!tokens) {
    fprintf(stderr, RED "krabbsh: allocation error\n" NORMAL);
    errwrning = 'e';
    exit(EXIT_FAILURE);
  }

  token = strtok(line, KRABBSH_TOK_DELIM);
  while (token != NULL) {
    tokens[position] = token;
    position++;

    if (position >= bufsize) {
      bufsize += KRABBSH_TOK_BUFSIZE;
      tokens = realloc(tokens, bufsize * sizeof(char*));
      if (!tokens) {
        fprintf(stderr, RED "krabbsh: allocation error\n" NORMAL);
        errwrning = 'e';
        exit(EXIT_FAILURE);
      }
    }

    token = strtok(NULL, KRABBSH_TOK_DELIM);
  }
  tokens[position] = NULL;
  return tokens;
}