#include <assert.h>
#include <CoreText/CoreText.h>
#include <ctype.h>
#include <dirent.h>
#include <errno.h>
#include <fcntl.h>
#include <limits.h>
#include <readline/history.h>
#include <readline/readline.h>
#include <signal.h>
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/wait.h>
#include <time.h>
#include <unistd.h>

/* global variables */
const int key_up = 72;
const int key_down = 80;
const int key_left = 75;
const int key_right = 77;
bool bl = false;
char errwrning = 'n';
int iii = 0;
bool directory = false;
int timesdir = 0;
int timeis = 0;

/* colors */
#define NORMAL    "\x1B[0m"
#define BLACK     "\x1B[30m"
#define RED       "\x1B[31m"
#define GREEN     "\x1B[32m"
#define YELLOW    "\x1B[33m"
#define BLUE      "\x1B[34m"
#define MAGENTA   "\x1B[35m"
#define CYAN      "\x1B[36m"
#define WIGHT     "\x1B[37m"

#define HBLACK    "\x1B[40m"
#define HRED      "\x1B[41m"
#define HGREEN    "\x1B[42m"
#define HYELLOW   "\x1B[43m"
#define HBLUE     "\x1B[44m"
#define HMAGENTA  "\x1B[45m"
#define HCYAN     "\x1B[46m"
#define HWIGHT    "\x1B[47m"

/* builtins */
int krabbsh_cd(char **args);
int krabbsh_help(char **args);
int krabbsh_exit(char **args);
int krabbsh_escape(char **args);
int krabbsh_dir(char **args);
int krabbsh_werror(char **args);
int krabbsh_countdown(char **args);
int krabbsh_src(char **args);

// builtins to string
char *builtin_str[] = {
  "cd",
  "help",
  "exit",
  "escape",
  "dir",
  "werror",
  "countdown",
  "src",
};

// builtin functions
int (*builtin_func[]) (char **) = {
  &krabbsh_cd,
  &krabbsh_help,
  &krabbsh_exit,
  &krabbsh_escape,
  &krabbsh_dir,
  &krabbsh_werror,
  &krabbsh_countdown,
  &krabbsh_src,
};

// number of builtins
int krabbsh_num_builtins() {
  return sizeof(builtin_str) / sizeof(char *);
}