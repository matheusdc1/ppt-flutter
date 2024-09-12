import 'package:flutter/material.dart';

class GameButton extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;
  final String label;

  const GameButton(
      {required this.imagePath, required this.onTap, required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/moldura.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Image.asset(imagePath, height: 100),
          ),
          SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
