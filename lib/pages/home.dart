import 'dart:math';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> options = ["pedra", "papel", "tesoura"];
  String _message = " ";
  String _imagePath = "images/default.png";
  int _playerScore = 0;
  int _computerScore = 0;
  Color _messageColor = Colors.black;
  String _computerChoice = " ";

  void _play(String choice) {
    int i = Random().nextInt(options.length);
    String randomChoice = options[i];
    setState(() {
      _imagePath = "images/" + randomChoice + ".png";
      _computerChoice = randomChoice;
      print("Click " + choice + " random " + randomChoice);

      if ((choice == "pedra" && randomChoice == "tesoura") ||
          (choice == "papel" && randomChoice == "pedra") ||
          (choice == "tesoura" && randomChoice == "papel")) {
        _message = "Você ganhou!";
        _messageColor = const Color.fromARGB(255, 16, 117, 20);
        _playerScore++;
      } else if ((choice == "tesoura" && randomChoice == "pedra") ||
          (choice == "pedra" && randomChoice == "papel") ||
          (choice == "papel" && randomChoice == "tesoura")) {
        _message = "Você perdeu!";
        _messageColor = const Color.fromARGB(255, 245, 29, 13);
        _computerScore++;
      } else {
        _message = "Empate!";
        _messageColor = const Color.fromARGB(255, 110, 209, 248);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pedra, Papel e Tesoura!"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.7,
            child: Image.asset(
              "images/background.png",
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Container(
            color: Colors.transparent,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 32, bottom: 16),
                  child: Text(
                    "Escolha sua jogada!",
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
                            child: Image.asset("images/pedra.png", height: 100),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Pedra",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _play("papel"),
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
                            child: Image.asset("images/papel.png", height: 100),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Papel",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _play("tesoura"),
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
                            child:
                                Image.asset("images/tesoura.png", height: 100),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Tesoura",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
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
                Column(
                  children: [
                    Image.asset(_imagePath, height: 130),
                    SizedBox(height: 8),
                    Text(
                      _computerChoice,
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
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
                      color: _messageColor,
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
        ],
      ),
    );
  }
}
