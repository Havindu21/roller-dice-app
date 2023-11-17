import 'package:flutter/material.dart';
import 'package:roller_dice_app/roller_dice.dart';

const beginAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  final List<Color> colors;
  const GradientContainer({super.key, required this.colors});

  // get onPressed => null;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: colors,
        begin: beginAlignment,
        end: endAlignment,
      )),
      child: const Center(child: RollerDice()),
    );
  }
}
