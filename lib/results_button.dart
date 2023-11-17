import 'package:flutter/material.dart';

class ResultsButton extends StatefulWidget {
  final VoidCallback onPressed;

  const ResultsButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<ResultsButton> createState() => _ResultsState();
}

class _ResultsState extends State<ResultsButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: widget.onPressed,
        style: TextButton.styleFrom(
            backgroundColor: Colors.pink,
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 28)),
        child: const Text('Results'));
    // const SizedBox(height: 20),
    // Text('${widget.playerOneNumbersList[0]}'),
  }
}
