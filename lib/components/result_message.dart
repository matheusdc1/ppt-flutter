import 'package:flutter/material.dart';

class ResultMessage extends StatelessWidget {
  final String message;
  final Color color;

  const ResultMessage({required this.message, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}
