import 'package:flutter/material.dart';

class PlayNewGameButton extends StatefulWidget {
  final VoidCallback onPressed;
  const PlayNewGameButton({Key? key, required this.onPressed})
      : super(key: key);

  @override
  State<PlayNewGameButton> createState() => _PlayNewGameButtonState();
}

class _PlayNewGameButtonState extends State<PlayNewGameButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: widget.onPressed,
        style: TextButton.styleFrom(
            backgroundColor: Colors.pink,
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 28)),
        child: const Text('Play New Game'));
  }
}
