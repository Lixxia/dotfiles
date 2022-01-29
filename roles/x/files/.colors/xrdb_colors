#!/usr/bin/env bash

read -r -d '' -a colors \
    < <( xrdb -query | sed -n 's/.*color\([0-9]\)/\1/p' | sort -nu | cut -f2)

printf '\e[1;37m
 Black      Red        Green      Yellow     Blue       Magenta    Cyan       White
───────────────────────────────────────────────────────────────────────────────────────\e[0m\n'

for color in {0..7}; do
    printf "\e[$((30+color))m █ %s \e[0m" "${colors[color]}"
done
printf '\n'

for color in {8..15}; do
    printf "\e[1;$((22+color))m █ %s \e[0m" "${colors[color]}"
done
printf '\n'
