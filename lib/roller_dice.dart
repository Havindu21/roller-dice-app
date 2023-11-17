import 'dart:math';

import 'package:flutter/material.dart';
import 'package:roller_dice_app/play_again_button.dart';
import 'package:roller_dice_app/play_new_game_button.dart';
import 'package:roller_dice_app/result_summary.dart';
import 'package:roller_dice_app/results_button.dart';
import 'package:roller_dice_app/roll_button.dart';

class RollerDice extends StatefulWidget {
  const RollerDice({super.key});

  @override
  State<RollerDice> createState() => _RollerDiceState();
}

class _RollerDiceState extends State<RollerDice> {
  var count = 1;
  var diceOneNumber = 0;
  var diceTwoNumber = 0;
  var diceNumber = 1;
  var playerOnePoints = 0;
  var playerTwoPoints = 0;
  var winner = '';
  bool buttonOnePressed = false;
  bool buttonTwoPressed = false;

  List<int> playerOneNumbersList = [];
  List<int> playerTwoNumbersList = [];

  void roll1() {
    setState(() {
      diceNumber = Random().nextInt(6) + 1;
      diceOneNumber = diceNumber;
      playerOneNumbersList.add(diceNumber);
      buttonOnePressed = true;
    });
  }

  void roll2() {
    setState(() {
      diceNumber = Random().nextInt(6) + 1;
      diceTwoNumber = diceNumber;
      playerTwoNumbersList.add(diceNumber);
      buttonTwoPressed = true;
    });
  }

  void reset() {
    setState(() {
      calculatingWinner();
      diceOneNumber = 0;
      diceTwoNumber = 0;
      diceNumber = 1;
      buttonOnePressed = false;
      buttonTwoPressed = false;
      count++;
    });
  }

  void calculatingWinner() {
    setState(() {
      if (diceOneNumber > diceTwoNumber) playerOnePoints += 2;
      if (diceOneNumber < diceTwoNumber) playerTwoPoints += 2;
      if (diceOneNumber == diceTwoNumber) {
        playerOnePoints += 1;
        playerTwoPoints += 1;
      }
    });
  }

  newGame() {
    setState(() {
      diceOneNumber = 0;
      diceTwoNumber = 0;
      diceNumber = 1;
      buttonOnePressed = false;
      buttonTwoPressed = false;
      count = 1;
      playerOnePoints = 0;
      playerTwoPoints = 0;
      playerOneNumbersList.clear();
      playerTwoNumbersList.clear();
    });
  }

  gameOver() {
    setState(() {
      buttonOnePressed = true;
      buttonTwoPressed = true;
      count++;
      calculatingWinner();
      selectingWinner();
    });
  }

  void selectingWinner() {
    if (playerOnePoints > playerTwoPoints) winner = 'Player One';
    if (playerOnePoints < playerTwoPoints) winner = 'Player Two';
    if (playerOnePoints == playerTwoPoints) winner = 'Player One & Player Two';
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Image.asset('assets/images/dice-$diceNumber.jpg', width: 200),
      const SizedBox(height: 20),
      if (!buttonOnePressed)
        RollButton(onPressed: roll1, playerBtnTxt: 'Player 1 Roll'),
      const SizedBox(height: 20),
      if (!buttonTwoPressed)
        RollButton(onPressed: roll2, playerBtnTxt: 'Player 2 Roll'),
      const SizedBox(height: 20),
      if (buttonOnePressed && buttonTwoPressed && count < 5)
        PlayAgainButton(onPressed: reset),
      const SizedBox(height: 20),
      Text('Player One : $diceOneNumber'),
      Text('Player Two : $diceTwoNumber'),
      if (buttonOnePressed && buttonTwoPressed && count < 6)
        Text(diceOneNumber > diceTwoNumber
            ? 'player One Won this Round'
            : diceOneNumber < diceTwoNumber
                ? 'player Two Won this Round'
                : 'Round Draw'),
      const SizedBox(height: 20),
      if (count == 5 && buttonOnePressed && buttonTwoPressed)
        ResultsButton(
          onPressed: gameOver,
        ),
      const SizedBox(height: 20),
      if (count == 6 && buttonOnePressed && buttonTwoPressed)
        ResultSummary(
          playerOneNumbersList: playerOneNumbersList,
          playerTwoNumbersList: playerTwoNumbersList,
          winner: winner,
        ),
      const SizedBox(height: 20),
      if (count == 6) PlayNewGameButton(onPressed: newGame),
    ]);
  }
}
