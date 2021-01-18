#ifndef loop
    #ifndef _main__
        #ifndef launch
            #ifndef execute
              #ifndef other
                  #ifndef bui
                    #define hs
                  #endif
              #endif
            #endif
        #endif
    #endif
#endif

#ifdef hs
  #include "includes.h"
#endif

#define MAX_LINE_LENGTH 180000
void history_main(){
  // set path, like and linecount
  char fullpath[256];
  char line[MAX_LINE_LENGTH] = {0};
  unsigned int line_count = 0;

  strcat(strcpy(fullpath, getenv("HOME")), "/.history.krabb");

  // Open file
  FILE *file = fopen(fullpath, "r");

  if (!file)
  {
    perror(fullpath);
    exit(0);
  }

  // Get each line until there are none left
  while (fgets(line, MAX_LINE_LENGTH, file))
  {
    line_count++;
    // Print each line
    printf("  %d %s", line_count, line);

    // Add a trailing newline to lines that don't already have one
    if (line[strlen(line) - 1] != '\n')
      printf("\n");
  }

  // Close file
  if (fclose(file))
  {
    exit(0);
    perror(fullpath);
  }
}

void write_to_history(char *line)
{
  char fullpath[256];

  strcat(strcpy(fullpath, getenv("HOME")), "/.history.krabb");
  FILE *file = fopen(fullpath, "a");
  fprintf(file, "%s\n", line);
  fclose(file);
}