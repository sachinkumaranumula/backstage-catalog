#!/bin/bash

# echo commands
set -x

usage() {
    echo "$0 usage:" && grep " .)\ #" $0
    exit 0
}

[ $# -eq 0 ] && usage
while getopts ":ht:w:d:" arg; do
    case $arg in
    t) # Specify Mustache Template Directory
        t=$OPTARG
        echo "Template Directory=$t"
        ;;
    w) # Specify Working Directory
        w=$OPTARG
        echo "Working Directory=$w"
        ;;
    d) # Specify API Definition
        d=$OPTARG
        echo "API Specification=$d"
        ;;
    h | *) # Display help.
        usage
        exit 0
        ;;
    esac
done

pwd
java -version 
java -jar $t/codegen.jar -definition $d -location $w

