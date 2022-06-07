#!/bin/bash
# src: https://stackoverflow.com/a/56146249

OFFSET_OF_WORD="$1"
SEARCH_FILE="$2"

lastNewLinePos=0
lineNumber=0
for newLinePos in $(grep -b '$' $SEARCH_FILE | cut -d':' -f1)
do
    if (( $OFFSET_OF_WORD >= lastNewLinePos && $OFFSET_OF_WORD < $newLinePos )); then
        echo "Offset: $OFFSET_OF_WORD"
        echo "Line: `sed -n ${lineNumber}p $SEARCH_FILE`"
        break
    fi
    lastNewLinePos=$newLinePos
    let lineNumber++
done
