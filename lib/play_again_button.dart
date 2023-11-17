import 'package:flutter/material.dart';

class PlayAgainButton extends StatefulWidget {
  final VoidCallback onPressed;
  const PlayAgainButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  State<PlayAgainButton> createState() => _PlayAgainButtonState();
}

class _PlayAgainButtonState extends State<PlayAgainButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: widget.onPressed,
        style: TextButton.styleFrom(
            backgroundColor: Colors.pink,
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 28)),
        child: const Text('Play Again'));
  }
}
