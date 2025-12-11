import 'dart:io';
import 'dart:math';

enum Move { rock, paper, scissor }

Move computerMove(Random random) {
  return Move.values[random.nextInt(3)];
}

void main() {
  final rnd = Random();

  while (true) {
    final input = stdin.readLineSync();

    // EOF or Cmd + D
    if(input == null || input == 'q') {
      print('Thankyou for playing!');
      break;
    }

    // valid input
    if (input == 'r' || input == 'p' || input == 's') {

      var playerMove = Move.rock;

      // parse player input
      switch (input) {
        case 'p':
          playerMove = Move.paper;
          break;
        case 's':
          playerMove = Move.scissor;
          break;
      }

      print("Player's move: ${playerMove.name}");

      // get computer move
      var compMove = computerMove(rnd);
      print("Comp's move: ${compMove.name}");

      // draw
      if (playerMove == compMove) {
        print('Draw');
        continue;
      }

      bool compWon = true;

      switch (playerMove) {
        case Move.rock:
          if (compMove == Move.scissor)
            compWon = false;
            break;
        case Move.scissor:
          if (compMove == Move.paper)
            compWon = false;
            break;
        case Move.paper:
          if (compMove == Move.rock)
            compWon = false;
            break;
      }

      if (compWon) {
        print('Comp Won!');
      } else {
        print('Player Won!');
      }

    } else {
      print("Invalid Input");
    }
  }
}
