import 'package:flutter/material.dart';

class ResultSummary extends StatefulWidget {
  final List<int> playerOneNumbersList;
  final List<int> playerTwoNumbersList;
  var winner;

  ResultSummary({
    Key? key,
    required this.playerOneNumbersList,
    required this.playerTwoNumbersList,
    required this.winner,
  }) : super(key: key);

  @override
  State<ResultSummary> createState() => _ResultSummaryState();
}

class _ResultSummaryState extends State<ResultSummary> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      ...List.generate(
        widget.playerOneNumbersList.length,
        (index) => Text(
          'Round ${index + 1}: Player 1 - ${widget.playerOneNumbersList[index]} Player 2 - ${widget.playerTwoNumbersList[index]}',
          style: const TextStyle(fontSize: 16),
        ),
      ),
      const SizedBox(height: 10),
      Text(
        'Winner is ${widget.winner}',
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    ]);
  }
}
