#!/bin/bash

SRC_DIR=$1
DST_DIR=$2
DAYS=${3:-14}

TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)

USAGE(){
    echo "USAGE:: <SCRIPT NAME> <Source directory> <Destination directory>"
    exit 1
}

if [ $# -lt 2 ]
then
    USAGE
fi

# checking source and destionation directories are exists or not
if [ ! -d "$SRC_DIR" ]
then
    echo "Source directory does not exists.."
    exit 1
else
    echo "Source directory exists.."
fi

if [ ! -d "$DST_DIR" ]
then
    echo "Destination directory does not exists.."
    exit 1
else
    echo "Destination directory exists.."
fi

FILES=$(find "$SRC_DIR" -name "*.log" -mtime +$DAYS)

echo "files:: $FILES"

if [ ! -z "$FILES" ]
then
    echo "files are found..Going zip the files"
    ZIP_FILES="$DST_DIR/app-logs-$TIMESTAMP.zip"
    find "$SRC_DIR" -name "*.log" -mtime +$DAYS | zip "$ZIP_FILES" -@

    if [ -f "$ZIP_FILES" ]
    then
        echo "Successfully zipped the files older thane $DAYS-days"
        #remove the files after zipping
        while IFS= read -r file
        do
            echo "deleting files:: $file"
            rm -rf $file
        done <<< $FILES
    else
        echo "zip files are failed"
        exit 1
    fi
else
    echo "files are not found older than $DAYS-days"
fi