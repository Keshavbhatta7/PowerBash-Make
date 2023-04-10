#!/bin/bash

if [ $# -eq 0 ]; then
    # If no arguments are passed, print usage message
    echo "Usage: make.sh file [-o output_file_name] [-m compiler_options]"
else
    filename=$1
    if [ ! -f $filename ]; then
        # If file does not exist, print error message and usage message
        echo "Error: File '$filename' does not exist."
        echo "Usage: make.sh file [-o output_file_name] [-m compiler_options]"
    else
        extension="${filename##*.}"
        if [ "$extension" = "c" ]; then
            compiler="clang"
        elif [ "$extension" = "cpp" ]; then
            compiler="clang++"
        else
            # If invalid file type, print error message and return
            echo "Error: Invalid file type. Only .c and .cpp files are supported."
            exit 1
        fi

        outputfile="${filename%.*}.exe"
        for (( i=2; i<=$#; i++ )); do
            if [ "${!i}" = "-o" ]; then
                if [ $((i+1)) -le $# ] && [[ "${!((i+1))}" =~ \.exe$ ]]; then
                    outputfile="${!((i+1))}"
                elif [ $((i+1)) -le $# ]; then
                    outputfile="${!((i+1))}.exe"
                else
                    # If output file name missing, print error message and usage message
                    echo "Error: Output file name missing after -o option"
                    echo "Usage: make.sh file [-o output_file_name] [-m compiler_options]"
                    exit 1
                fi
            fi
        done

        compilerArgs=""
        for (( i=2; i<=$#; i++ )); do
            if [ "${!i}" = "-m" ]; then
                if [ $((i+1)) -le $# ]; then
                    compilerArgs="${!((i+1))}"
                else
                    # If compiler options missing, print error message and usage message
                    echo "Error: Compiler options missing after -m option"
                    echo "Usage: make.sh file [-o output_file_name] [-m compiler_options]"
                    exit 1
                fi
            fi
        done

        compileCmd="$compiler $filename -o $outputfile $compilerArgs"
        echo "Command: $compileCmd"
        eval $compileCmd

        if [ -f $outputfile ]; then
            echo "Compilation successful."
        else
            echo "Compilation failed."
        fi
    fi
fi
