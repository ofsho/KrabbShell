#include "cSource.h"

int main(){
    // get input to char
    char *userinput;

    while (1){
        input("%s", userinput);
        if (strstr(userinput, "q()")){
            exit(EXIT_SUCCESS);
        }
    }
}