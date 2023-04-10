#!/bin/bash

if [[ $# -eq 0 ]]; then
    # If no arguments are passed, print usage message
    echo "Usage: make.sh file [-o output_file_name] [-m compiler_options]"
else
    filename="$1"
    if [[ ! -f "$filename" ]]; then
        # If file does not exist, check if it exists with .c extension
        if [[ -f "$filename.c" ]]; then
            filename="$filename.c"
            echo "Note: Input file '$filename' found with .c extension."
        elif [[ -f "$filename.cpp" ]]; then
            filename="$filename.cpp"
            echo "Note: Input file '$filename' found with .cpp extension."
        else
            # If file not found, print error message and usage message
            echo "Error: File '$1' does not exist."
            echo "Usage: make.sh file [-o output_file_name] [-m compiler_options]"
            exit 1
        fi
    fi

    extension="${filename##*.}"
    if [[ "$extension" == "c" ]]; then
        compiler="clang"
    elif [[ "$extension" == "cpp" ]]; then
        compiler="clang++"
    else
        # If invalid file type, print error message and return
        echo "Error: Invalid file type. Only .c and .cpp files are supported."
        exit 1
    fi

    outputfile="${filename%.*}.exe"
    for i in "$@"; do
        if [[ "$i" == "-o" ]]; then
            outputfile="$2"
            shift 2
            break
        fi
    done

    compilerArgs=""
    for i in "$@"; do
        if [[ "$i" == "-m" ]]; then
            compilerArgs="$2"
            break
        fi
    done

    compileCmd="$compiler $filename -o $outputfile $compilerArgs"
    echo "Command: $compileCmd"
    eval $compileCmd

    if [[ -f "$outputfile" ]]; then
        echo "Compilation successful."
    else
        echo "Compilation failed."
    fi
fi
