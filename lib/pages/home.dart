import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List options = ["pedra", "papel", "tesoura"];
  String _message = "Sua jogada!";

  void _play(String choice) {
    int i = Random().nextInt(options.length);
    String randomChoice = options[i];
    print("Click " + choice + " random " + randomChoice);

    if ((choice == "pedra" && randomChoice == "tesoura") ||
        (choice == "papel" && randomChoice == "pedra") ||
        (choice == "tesoura" && randomChoice == "papel")) {
      print("Jogador ganhou!");
    } else if ((choice == "tesoura" && randomChoice == "pedra") ||
        (choice == "pedra" && randomChoice == "papel") ||
        (choice == "papel" && randomChoice == "tesoura")) {
      print("Computador ganhou!");
    } else {
      print("Empate!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pedra, papel e tesoura"),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                _message,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => _play("pedra"),
                  child: Image.asset("images/pedra.png", height: 100),
                ),
                GestureDetector(
                  onTap: () => _play("papel"),
                  child: Image.asset("images/papel.png", height: 100),
                ),
                GestureDetector(
                  onTap: () => _play("tesoura"),
                  child: Image.asset("images/tesoura.png", height: 100),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                "Jogada do computador!",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Image.asset("images/default.png", height: 130),
          ],
        ),
      ),
    );
  }
}
