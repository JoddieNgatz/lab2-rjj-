#!/bin/bash

#searches through all .java files in the directory and sub-directories and count the number of comments, lines of code, and vocab in the system

let TOTALCOMMENTS=0
let TOTALLOC=0
let TOTALVOCAB=0

for file in `find . -name '*.java'`
	do
    total=$(grep "\/\*" $file | wc -l)
    totalwc=$(wc -l < $file)
    totalv=$(grep -roE '\w+' $file | sort -u -f | wc -l)	
    
    echo "$file,$total,$totalwc,$totalv"
  	
    TOTALCOMMENTS=$((TOTALCOMMENTS + $total))-	
    TOTALLOC=$((TOTALLOC + $totalwc))
    TOTALVOCAB=$((TOTALVOCAB + $totalv))	
done


echo "TOTAL COMMENTS = " $TOTALCOMMENTS
echo "TOTAL LOC = " $TOTALLOC
echo "TOTAL VOCAB = " $TOTALVOCAB

