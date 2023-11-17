import 'package:flutter/material.dart';
import 'package:roller_dice_app/gradient_container.dart';

class RollerDiceApp extends StatelessWidget {
  const RollerDiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
          title: const Text('iCET Roller Dice App'),
        ),
        body: const GradientContainer(colors: [
          Color.fromARGB(255, 57, 43, 2),
          Color.fromARGB(255, 128, 97, 3)
        ]),
      ),
    );
  }
}
