# file
FILE=$@

# settings
SHELL="false"

# count
declare -i TRUCOUNT=0
declare -i WRNCOUNT=0
declare -i ERRCOUNT=0
declare -i TSKCOUNT=0
declare -i LSTCOUNT=0
declare -i COMCOUNT=0
declare -i STSCOUNT=0
declare -i SKLCOUNT=0
declare -i CMDCOUNT=0

# commands
declare -a COMMAND

#PP
ERPP="N"
WRPP="N"
CRPP="N"
HIPP="N"

# colors
RED='\033[0;31m'
GRN='\033[0;32m'
YLO='\033[1;33m'
CYN='\033[0;36m'
BLU='\033[0;34m'
GRA='\033[1;30m'
PRP='\033[0;35m'
NC='\033[0m'

if [[ $FILE == *".dsc"* ]]
then
while read line; do
    if [[ $nc == "true" ]]
    then
        CMDCOUNT+=1
        if [[ $line == ";" ]]
        then
            export nc="false"
        else
            ncline=$line
            line=""
        fi
    fi

    if [ $SHELL == "TRUE" ]
    then
        if [[ $line == ";" ]]
        then
            line=";"
        else
            line=${line/- /}
            $line
            line=""
        fi
    elif [[ $PYTHON == "TRUE" ]]
    then
        if [[ $line == ";" ]]
        then
            numba newfile.rand.useless.python.msd.dcd.nvmsx.py
            rm newfile.rand.useless.python.msd.dcd.nvmsx.py
            line=";"
        else
            line=${line/- /}
            echo "$line" >> newfile.rand.useless.python.msd.dcd.nvmsx.py
            line=""
        fi
    elif [[ $CPP == "TRUE" ]]
    then
        if [[ $line == ";" ]]
        then
            clang++ -o out newfile.rand.useless.cpp.msd.dcd.nvmsx.cpp
            ./out
            rm out
            rm newfile.rand.useless.cpp.msd.dcd.nvmsx.cpp
            line=";"
        else
            nvms newfile.rand.useless.cpp.msd.dcd.nvmsx.cpp
            line=${line/- /}
            if [[ $line == *"!include"* ]]
            then
                line=${line/include /}
                line=${line/ /}
                line=${line//!}
                echo "#include <$line>" | cat - newfile.rand.useless.cpp.msd.dcd.nvmsx.cpp > temp && mv temp newfile.rand.useless.cpp.msd.dcd.nvmsx.cpp
                export line=""
            elif [[ $line == *"!!include"* ]]
            then
                line=${line/include /}
                line-${line/ /}
                line=${line//!}
                if [[ $line == *".h"* ]]
                then
                    echo "#include \"$line\";" | cat - newfile.rand.useless.cpp.msd.dcd.nvmsx.cpp > temp && mv  newfile.rand.useless.cpp.msd.dcd.nvmsx.cpp
                elif [[ $line == *".hpp"* ]]
                then
                    echo "#include \"$line\";" | cat - newfile.rand.useless.cpp.msd.dcd.nvmsx.cpp > temp && mv newfile.rand.useless.cpp.msd.dcd.nvmsx.cpp temp newfile.rand.useless.cpp.msd.dcd.nvmsx.cpp
                elif [[ $line == *".cpp"* ]]
                then
                    echo "#include \"$line\";" | cat - newfile.rand.useless.cpp.msd.dcd.nvmsx.cpp > temp && mv newfile.rand.useless.cpp.msd.dcd.nvmsx.cpp newfile.rand.useless.cpp.msd.dcd.nvmsx.cpp
                elif [[ $line == *".c"* ]]
                then
                    echo "#include \"$line\";" | cat - newfile.rand.useless.cpp.msd.dcd.nvmsx.cpp > temp && mv newfile.rand.useless.cpp.msd.dcd.nvmsx.cpp newfile.rand.useless.cpp.msd.dcd.nvmsx.cpp
                else
                    echo "#include \"$line.h\";" | cat - newfile.rand.useless.cpp.msd.dcd.nvmsx.cpp > temp && mv newfile.rand.useless.cpp.msd.dcd.nvmsx.cpp newfile.rand.useless.cpp.msd.dcd.nvmsx.cpp
                fi
                export line=""
            fi
            echo "$line" >> newfile.rand.useless.cpp.msd.dcd.nvmsx.cpp
            line=""
        fi
    fi

    if [[ $line == *"\\"* ]]
    then
        if [[ $line == *"- write"* ]]
        then
            export newlinewr="true"
        else
            export newlinewr="false"
        fi
    fi

    if [[ $newlinewr == "true" ]]
    then
        line=${line//\\}
        echo $line >> $file
    fi

    if [[ $yedit == "true" ]]
    then
        echo $line >> $file.mdx
        line=""
        yedit="false"
    fi

    if [[ $line == "build:" ]]
    then
        LSTCOUNT+=1
        CRPP="Y"
    elif [[ $line == *":"* ]]
    then
        if [[ $line == *"shell"* ]]
        then
            SHELL="TRUE"
        elif [[ $line == *"python"* ]]
        then
            export PYTHON="TRUE"
        elif [[ $line == *"cpp"* ]]
        then
            export CPP="TRUE"
        fi
        if [[ $line == *"-"* ]]
        then
            echo "${RED}ERR${NC} - ${RED}Cant have a task and a list in the same line${NC}"
            ERRCOUNT+=1
            ERPP="Y" 
        elif [[ $line == *"  "* ]]
        then
            echo "${RED}ERR${NC} - ${RED}Cant have a tab and a list in the same line${NC}"
            ERRCOUNT+=1
            ERPP="Y" 
        else
            LSTCOUNT+=1
            CRPP="Y" 
        fi
    elif [[ $line == *"-"* ]]
    then
        TSKCOUNT+=1
        CRPP="Y" 
        if [[ $line == *"- run"* ]]
        then
            if [[ $line == *".java"* ]]
            then
                line=${line/- run/}
                line=${line/ /}
                java -jar $line
            elif [[ $line == *".dsc"* ]]
            then
                line=${line/- run/}
                line=${line/ /}
                dsc $line
            elif [[ $line == *".sh"* ]]
            then
                line=${line/- run/}
                line=${line/ /}
                chmod +x $line
                ./$line
            elif [[ $line == *".zsh"* ]]
            then
                line=${line/- run/}
                line=${line/ /}
                chmod +x $line
                ./$line
            elif [[ $line == *".bash"* ]]
            then
                line=${line/- run/}
                line=${line/ /}
                chmod +x $line
                ./$line
            elif [[ $line == *".ps1"* ]]
            then
                line=${line/- run/}
                line=${line/ /}
                chmod +x $line
                ./$line
            elif [[ $line == *".py"* ]]
            then
                line=${line/- run/}
                line=${line/ /}
                numba $line
            elif [[ $line == *".cs"* ]]
            then
                line=${line/- run/}
                line=${line/ /}
                mcs $line
                line=${line/.cs/.exe}
                mono $line
            elif [[ $line == *".dec"* ]]
            then
                line=${line/- run/}
                line=${line/ /}
                dec $line
            elif [[ $line == *".mdx"* ]]
            then
                line=${line/- run/}
                line=${line/ /}
                lf=$line
                echo "\n------------------------------\n"
                while read line; do
                    if [[ $line == "%now" ]]
                    then
                        export now="true"
                        export one="true"
                    fi
                    if [ $now == "true" ]
                    then
                        if [ $one == "true" ]
                        then
                            export one="false"
                        else
                            echo "${PRP}$line${NC}"
                        fi
                    else
                        echo ""
                    fi
                done <$lf
                echo "\n------------------------------\n"
            fi
        elif [[ $line == *"- compile"* ]]
        then
            if [[ $line == *".sh"* ]]
            then
                line=${line/- compile/}
                line=${line/ /}
                chmod +x $line
                line2=${line/.sh/}
                mv $line $line2
            elif [[ $line == *".zsh"* ]]
            then
                line=${line/- compile/}
                line=${line/ /}
                chmod +x $line
                line2=${line/.zsh/}
                mv $line $line2
            elif [[ $line == *".bash"* ]]
            then
                line=${line/- compile/}
                line=${line/ /}
                chmod +x $line
                line2=${line/.bash/}
                mv $line $line2
            elif [[ $line == *".java"* ]]
            then
                line=${line/- compile/}
                line=${line/ /}
                java -jar $line
            elif [[ $line == *".py"* ]]
            then
                line=${line/- compile/}
                line=${line/ /}
                pyinstaller --clean $line
            elif [[ $line == *".cs"* ]]
            then
                line=${line/- compile/}
                line=${line/ /}
                mcs $line
            elif [[ $line == *".cpp"* ]]
            then
                line=${line/- compile/}
                line=${line/ /}
                clang++ $line
            elif [[ $line == *".c"* ]]
            then
                line=${line/- compile/}
                line=${line/ /}
                gcc $line
            elif [[ $line == *".kt"* ]]
            then
                line=${line/- compile/}
                line=${line/ /}
                kotlinc $line
            elif [[ $line == *".go"* ]]
            then
                line=${line/- compile/}
                line=${line/ /}
                go tool compile $line
            elif [[ $line == *".rs"* ]]
            then
                line=${line/- compile/}
                line=${line/ /}
                rustc $line
            fi
        elif [[ $line == *"- runcompiled"* ]]
        then 
            line=${line/- run compiled/}
            line=${line/ /}
            if [[ $line == *".py"* ]]
            then
                cd build
                line=${line/.py/}
                cd $line
                ./$line
            elif [[ $line == *".cs"* ]]
            then
                line=${line/.cs/}
                mono $line
            elif [[ $line == *".rs"* ]]
            then
                line=${line/.rs/}
                ./$line
            fi
        elif [[ $line == *"chars = all => pull => random("* ]]
        then
            line=${line/chars = all => pull => random(\{/}
            line=${line/-/}
            line=${line/\}/}
            line=${line/\)/}
            openssl rand -base64 $line
        elif [[ $line == *"- newfile"* ]]
        then
            line=${line/- newfile }
            if [[ $line == *"- full"* ]]
            then
                STSCOUNT+=1
                line = ${line/- full /}
                nvm $line
            else
                nvms $line
            fi
        elif [[ $line == *"- write"* ]]
        then
            line=${line/- write/}
            line=${line//\\}
            if [[ $line == *"!!clear!!"* ]]
            then
                line=${line/clear/}
                line=${line//!!}
                echo "" > $file
            fi
            echo $line >> $file
        elif [[ $line == *"- yedit @message"* ]]
        then
            line=${line/- yedit /}
            line=${line//@}
            line=${line/message /}
            export yedit="true"
            export file=$line
        elif [[ $line == *"- forever+read"* ]]
        then
            while true; do
                read
            done
        elif [[ $line == *"- read"* ]]
        then
            read
        elif [[ $line == *"- findex"* ]]
        then
            line=${line/- findex /}
            ls *.${line}
        elif [[ $line == *"- findfl"* ]]
        then
            line=${line/- findfl /}
            ls ${line}
        elif [[ $line == *"- remove"* ]]
        then
            line=${line/- remove /}
            rm $line
        elif [[ $line == *"--newcommand="* ]]
        then
            line=${line/--newcommand=/}
            line=${line/ /}
            line=${line//:}
            export nc="true"
            export newcommand=$line
        elif [[ $line == *"- $newcommand"* ]]
        then
            for value in "${COMMAND[@]}"
            do
                $value
            done
        else
            echo "${RED}ERR${NC} - ${RED}Command not found${NC}"
            ERRCOUNT+=1
            ERPP="Y" 
        fi
    elif [[ $line == "" ]]
    then
        SKLCOUNT+=1
        i=1
    elif [[ $line == *".find"* ]]
    then
        if [[ $line == *"= compiler"* ]]
        then
            if [[ "$OSTYPE" == "darwin"* ]]; then
                line=${line/.find = compiler /}
                if [[ -f "/usr/local/bin/$line" ]]
                then
                    echo "TRUE"
                else
                    echo "FALSE"
                fi
            fi
        fi
        CRPP="Y"
    elif [[ $line == *"#"* ]]
    then
        HIPP="Y"
        COMCOUNT+=1
        if [[ $line == *@brief=* ]]
        then
            line=${line/brief= /}
            line=${line//# @}
            echo "${CYN}breif: ${BLU}$line${NC}"
        elif [[ $line == *@desc=* ]]
        then
            line=${line/desc= /}
            line=${line//# @}
            echo "${CYN}description: ${BLU}$line${NC}"
        elif [[ $line == *@command=* ]]
        then
            line=${line/command= /}
            line=${line//# @}
            echo "${CYN}command: ${BLU}$line${NC}"
        fi
    elif [[ $line == *".gtw"* ]]
    then
        line=${line/.gtw = }
        sig $line
    elif [[ $line == *".def"* ]]
    then
        line=${line/.def = }
        def $line
    elif [[ $line == *";"* ]]
    then
        SHELL="false"
        export PYTHON="false"
        export CPP="false"
    elif [[ $line == *"file="* ]]
    then
        line=${line/file= /}
        export file=$line
    else
        echo "${RED}ERR${NC} - ${RED}Command not found${NC}"
        ERRCOUNT+=1
        ERPP="Y" 
    fi

    if [[ $nc == "true" ]]
    then
        COMMAND+=("$ncline")
    fi

    if [ $ERPP == "Y" ]
    then
        echo "${RED}$line${NC}"
    elif [ $WRPP == "Y" ]
    then
        echo "${YLO}$line${NC}"
        WRPP="N"
    elif [ $HIPP == "Y" ]
    then
        HIPP="N"
    else
        echo "${GRN}$line${NC}"
    fi
done <$FILE

TRUCOUNT=$LSTCOUNT+$TSKCOUNT
echo "\n\n--------------------------------------------------------------------------------\n\nYou have:\n ${TRUCOUNT} ${GRN}Completed${NC}\n ${WRNCOUNT} ${YLO}Warnings${NC}\n ${ERRCOUNT} ${RED}Errors${NC}\nYou have overall:\n ${TSKCOUNT} ${CYN}Tasks${NC}\n ${LSTCOUNT} ${BLU}Lists${NC}\n ${COMCOUNT} ${BLU}Comments${NC}\n ${STSCOUNT} ${CYN}Subtasks${NC}\n ${SKLCOUNT} ${GRA}Skipped Lines${NC}"


elif [[ $FILE == *".mdx"* ]]
then
while read line; do
    if [[ $line == "%now" ]]
    then
        export now="true"
    else
        echo "${RED}error in file${RED}"
    fi
    if [ $now == "true" ]
    then
        echo "${PRP}$line${NC}"
    fi
done <$FILE
fi