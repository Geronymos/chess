# !/bin/bash

board=()
for i in {0..63}; do board[$i]=" "; done;
# ♔
# ♕
# ♖
# ♗
# ♘
# ♙
# ♚
# ♛
# ♜
# ♝
# ♞
# ♟

for i in {8..15}; do board[$i]="b"; done;
for i in 0 7; do board[$i]="t"; done;
for i in 1 6; do board[$i]="h"; done;
for i in 2 5; do board[$i]="n"; done;
board[3]="q"
board[4]="k"

for i in {48..55}; do board[$i]="B"; done;
for i in 56 63; do board[$i]="T"; done;
for i in 57 62; do board[$i]="H"; done;
for i in 58 61; do board[$i]="N"; done;
board[60]="Q"
board[59]="K"

for field in ${!board[@]}
do
    printf "\e[31;4$(( ( field + (field / 8 %2 == 0) ) % 2 *7))m ${board[$field]} $((((field+1) % 8 == 0)) && echo '\e[0:0m\n')" | 
    sed "s/b/♙/; s/h/♘/; s/n/♗/; s/t/♖/; s/q/♔/; s/k/♕/; s/B/♟/; s/H/♞/; s/N/♝/; s/T/♜/; s/Q/♚/; s/K/♛/;"
done