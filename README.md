# chess.sh

> chess game written in shell-script. 

## About

chess.sh is a small chess game that runs in your terminal. It uses ascii characters and color codes to render the chess board and figures. 


```tex
  A B C D E F G H
1[♖]♘[♗]♔[♕]♗[♘]♖  
2 ♙[♙]♙[♙]♙[♙]♙[♙]
3[ ] [ ] [ ] [ ] 
4  [ ] [ ] [ ] [ ]
5[ ] [ ] [ ] [ ] 
6  [ ] [ ] [ ] [ ]
7[♟]♟[♟]♟[♟][♟]♟
8 ♜[♞]♝[♚]♛[♝]♞[♜] 
```

## Features

- [X] show board and figures 
- [X] use color 🌈
- [X] move figures 🏃
- [X] list captured/taken figures 
- [ ] highlight column and rows
- [ ] show possible moves
- [ ] history

## Usage

```sh
./chess.sh
```

Move a figure in the form of `[from column][from row]:[to column][to row]`. 
Columns are specified with a letter from `A` to `H`. 
Rows are specified with a number from `1` to `8`. 

## Inspiration ✨

- [GNU Chess](https://www.gnu.org/software/chess/) _- Play chess against the computer in a terminal and an engine for graphical chess frontends_

## Authors

- **Gero Beckmann** - *Initial work* - [Geronymos](https://github.com/Geronymos)

## License

This project is licensed under the GPT-3 License - see the `LICENSE` file for details