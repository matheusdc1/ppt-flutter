import 'package:flutter/material.dart';

class ScoreDisplay extends StatelessWidget {
  final int playerScore;
  final int computerScore;

  const ScoreDisplay({required this.playerScore, required this.computerScore});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text(
              "Jogador",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              playerScore.toString(),
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              "Computador",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              computerScore.toString(),
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
