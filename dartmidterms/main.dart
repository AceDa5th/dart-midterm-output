
import 'dart:io';
import 'package:emojis/emojis.dart'; // to use Emoji collection
import 'package:emojis/emoji.dart'; // to use Emoji utilities
import "dart:math";

Emoji scissors = Emoji.byChar(Emojis.scissors);
Emoji paper = Emoji.byChar(Emojis.rollOfPaper);
Emoji rock = Emoji.byChar(Emojis.rock);
int wins = 0;
int loss = 0;
int draws = 0;

String player() {
  print('Papel, Gunting, Bato! Whats your Pick?');
  var a = new Map();
  a['1'] = paper;
  a['2'] = scissors;
  a['3'] = rock;
  print(a);
  String ans = stdin.readLineSync().toUpperCase();

  switch (ans) {
    case "PAPEL":
      return "Papel!";
      break;
    case "1":
      return "Papel!";
      break;
    case "GUNTING":
      return "Gunting!";
      break;
    case "2":
      return "Gunting!";
      break;
    case "BATO":
      return "Bato!";
      break;
    case "3":
      return "Bato!";
      break;
    default:
      return "Quit";
      break;
  }
}
String bot() {
  Random rand = new Random();
  int move = rand.nextInt(3);

  switch (move) {
    case 0:
      return "Papel!";
      break;
    case 1:
      return "Gunting!";
      break;
    case 2:
      return "Bato!";
      break;
    default:
      break;
  }
}
String whoWon(String playerMove, String botMove) {
  if (playerMove == botMove) {
    draws++;
    return "Draw!";
  } else if (playerMove == "Bato!" && botMove == "Gunting!") {
    print('$rock vs $scissors');
    wins++;
    return "You Win!";
  } else if (playerMove == "Gunting!" && botMove == "Papel!") {
    print('$scissors vs $paper');
    wins++;
    return "You Win!";
  } else if (playerMove == "Papel!" && botMove == "Bato!") {
    print('$paper vs $rock');
    wins++;
    return "You Win!";
  } else if (playerMove == "Gunting!" && botMove == "Bato!") {
    print('$scissors vs $rock');
    loss++;
    return "Bot Wins!";
  } else if (playerMove == "Papel!" && botMove == "Gunting!") {
    print('$paper vs $scissors');
    loss++;
    return "Bot Wins!";
  } else if (playerMove == "Bato!" && botMove == "Papel!") {
    print('$rock vs $paper');
    loss++;
    return "Bot Wins!";
  } else {
    loss++;
  return "Bot Wins!";
  }
}
void main() {
  while(true) {
    print("+++++++++++++SCORE BOARD+++++++++++++");
    print('SCORE: Wins: $wins Loss: $loss Draws: $draws');
    print("==========NEW GAME============");
    String playerMove = player();
    if (playerMove == "Quit") {
      return;
    }
    print('------------------------------------------');
    print("Pinili mo ang $playerMove");
    String botMove = bot();
    print("Pinili ng kalaban ang $botMove");
    print(whoWon(playerMove, botMove));
  }
}