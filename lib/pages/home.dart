import 'dart:math';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List options = ["pedra", "papel", "tesoura"];
  String _message = " ";
  String _imagePath = "images/default.png";
  int _playerScore = 0;
  int _computerScore = 0;

  void _play(String choice) {
    int i = Random().nextInt(options.length);
    String randomChoice = options[i];
    this._imagePath = "images/" + randomChoice + ".png";
    print("Click " + choice + " random " + randomChoice);

    if ((choice == "pedra" && randomChoice == "tesoura") ||
        (choice == "papel" && randomChoice == "pedra") ||
        (choice == "tesoura" && randomChoice == "papel")) {
      setState(() {
        _message = "Você ganhou!";
        _playerScore++;
      });
    } else if ((choice == "tesoura" && randomChoice == "pedra") ||
        (choice == "pedra" && randomChoice == "papel") ||
        (choice == "papel" && randomChoice == "tesoura")) {
      setState(() {
        _message = "Você perdeu!";
        _computerScore++;
      });
    } else {
      setState(() {
        _message = "Empate!";
      });
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
                "Sua jogada!",
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
            Image.asset(_imagePath, height: 130),
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                "Resultado: ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16, bottom: 16),
              child: Text(
                _message,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                "Placar",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
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
                      _playerScore.toString(),
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
                      _computerScore.toString(),
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
