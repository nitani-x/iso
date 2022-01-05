#!/bin/bash
IFS=$'\n'
set -- $(<"$HOME/.zsh/quotes.txt")
len=${#@}
rand=$((RANDOM%len+1))
linenum=0
while read -r myline
do
  (( linenum++ ))
  case "$linenum" in
   $rand) echo "$myline";;
  esac
done <"$HOME/.zsh/quotes.txt"