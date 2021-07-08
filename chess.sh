# !/bin/bash

board=()
for i in {0..63}; do board[$i]=" "; done;

rowname="ABCDEFGH"
captured_white=()
captured_black=()

# ♔♕♖♗♘♙♚♛♜♝♞♟

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
board[59]="Q"
board[60]="K"

function decode_figures() {
    sed "s/b/♙/; s/h/♘/; s/n/♗/; s/t/♖/; s/q/♔/; s/k/♕/; s/B/♟/; s/H/♞/; s/N/♝/; s/T/♜/; s/Q/♚/; s/K/♛/;" /dev/stdin
}

function render() {
    echo {A..H} | sed "s/^/  /" 
    for field in ${!board[@]}
    do
        # printf "$((((field) % 8 == 0)) && echo ${rowname:(((field+1)/8)):1]})"
        ((field %8 == 0)) && printf "$(((field)/8+1)) "
        printf "\e[31;4$(( ( field + (field / 8 %2 == 0) ) % 2 *7))m"
        printf "${board[$field]} " | decode_figures
        (((field+1) % 8 == 0)) && printf "\e[0:0m\n"
        
    done
}

while true
do
    # clear
    code=""
    render
    while [[ ! "$code" =~ ^[A-Z][0-9]:[A-Z][0-9]$ ]]
    do
        read -p "[from letter][from number]:[to letter][to number]" code
    done
    from_x=$(echo "ABCDEFGH" | grep -aob "${code:0:1}")
    from_x=${from_x:0:1}
    from_y=${code:1:1}
    to_x=$(echo "ABCDEFGH" | grep -aob "${code:3:1}")
    to_x=${to_x:0:1}
    to_y=${code:4:1}
    echo "$from_x $from_y $to_x $to_y"
    [[ ${board[(((to_y-1)*8-1+to_x+1))]} =~ [a-z] ]] && captured_white+=${board[(((to_y-1)*8-1+to_x+1))]}
    [[ ${board[(((to_y-1)*8-1+to_x+1))]} =~ [A-Z] ]] && captured_black+=${board[(((to_y-1)*8-1+to_x+1))]}
    board[(((to_y-1)*8-1+to_x+1))]=${board[(((from_y-1)*8-1+from_x+1))]}
    board[(((from_y-1)*8-1+from_x+1))]=" "
    echo ${captured_black[@]} | decode_figures
    echo ${captured_white[@]} | decode_figures
done

