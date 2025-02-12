#!/bin/env bash

# help function: print usage message
function help()
{
cat << HELP_MSG

Usage: $(basename $0) -i <INPUT_FILE> [-i <INPUT_FILE>] -o <OUTPUT_FILE> | -h | -v

This script allows to merge multiple input PDF files into one output PDF file using 'qpdf' program.

Options:
    -i <INPUT_FILE>     Specify input PDF file. This argument can be specified multiple times.
    -o <OUTPUT_FILE>    Specify output PDF file. This argument must be specified one time.
    -h                  Print this help message.
    -v                  Print program version.

Example:
    $(basename $0) -i document_1.pdf -i document_2.pdf -o merged.pdf

HELP_MSG
}

# main function: use 'qpdf' command to merge PDF files
function main()
{
    printf -v INPUT_FILES_STRING "\'%s\' " "${INPUT_FILES[@]}"
    echo "INFO: Merging files ${INPUT_FILES_STRING}into '$OUTPUT_FILE'..."
    echo

    qpdf --empty --pages "${INPUT_FILES[@]}" -- "$OUTPUT_FILE"
}

# current program version
VERSION="1.0.0"

# check 'qpdf' command
if ! command -v qpdf 2>&1 >/dev/null
then
    echo "ERROR: 'qpdf' program not found"
    exit 1;
fi

# parse CLI arguments
while getopts :o:i:hv flag
do
    case "${flag}" in
        o) 
            OUTPUT_FILE="$OPTARG"
            ;;
        i) 
            INPUT_FILES+=("$OPTARG")
            ;;
        h) 
            help;
            exit 0;
            ;;
        v) 
            echo $VERSION
            exit 0;
            ;;
        :) 
            echo "ERROR: Option -$OPTARG requires an argument."
            exit 1;
            ;;
        ?) 
            echo "ERROR: Invalid Option: -$OPTARG."
            exit 1;
            ;;
    esac
done

# check required arguments must be not empty
if [[ "$OUTPUT_FILE" == "" ]]
then
    echo "ERROR: Missing output file."
    help;
    exit 1;
elif [[ "$INPUT_FILES" == "" ]]
then
    echo "ERROR: Missing input files."
    help;
    exit 1;
else
    main;
    exit 0;
fi
