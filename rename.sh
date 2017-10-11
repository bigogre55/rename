#!/bin/bash

read -i 'mp4' -p "what file type are you renaming?(mp4,avi,txt,img) " ext
ext=$(echo $ext|tr -d '\n')

ls *.$ext > list.txt

FILE="list.txt"
read -p "what is the string you are replacing? " str
read -p "what do you want to replace it with? " rep
str=$(echo $str|tr -d '\n')
rep=$(echo $rep|tr -d '\n')

for line in $(cat $FILE)
do
 echo "$line"
 sline=$(echo $line | sed "s/$str/$rep/g")
 read -e -i "$sline" -p "what should the new name be? " new_line
 mv $line $new_line
done

rm list.txt
