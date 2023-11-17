import 'package:flutter/material.dart';

class RollButton extends StatefulWidget {
  final VoidCallback onPressed;
  final dynamic playerBtnTxt;

  const RollButton({Key? key, required this.onPressed, this.playerBtnTxt})
      : super(key: key);

  @override
  State<RollButton> createState() => _RollButtonState();
}

class _RollButtonState extends State<RollButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: widget.onPressed,
        style: TextButton.styleFrom(
            backgroundColor: Colors.pink,
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 28)),
        child: Text('${widget.playerBtnTxt}'));
  }
}
