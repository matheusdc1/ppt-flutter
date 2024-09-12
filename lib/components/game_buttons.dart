import 'package:flutter/material.dart';
import 'game_button.dart';

class GameButtons extends StatelessWidget {
  final List<String> options;
  final Function(String) onTap;

  const GameButtons({required this.options, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: options.map((option) {
        return GameButton(
          imagePath: 'images/$option.png',
          onTap: () => onTap(option),
          label: option,
        );
      }).toList(),
    );
  }
}
