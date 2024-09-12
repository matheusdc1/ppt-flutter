import 'dart:math';
import 'package:flutter/material.dart';
import '../components/game_buttons.dart';
import '../game_logic.dart';
import '../components/result_message.dart';
import '../components/score_display.dart';

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

      // Usa a GameLogic para obter o resultado
      String result = GameLogic.getResult(choice, randomChoice);
      if (result == "Você ganhou!") {
        _message = result;
        _messageColor = const Color.fromARGB(255, 16, 117, 20);
        _playerScore++;
      } else if (result == "Você perdeu!") {
        _message = result;
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

                // Usa o componente GameButtons
                GameButtons(
                  options: options,
                  onTap: _play,
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

                // Usa o componente ResultMessage
                ResultMessage(
                  message: _message,
                  color: _messageColor,
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

                // Usa o componente ScoreDisplay
                ScoreDisplay(
                  playerScore: _playerScore,
                  computerScore: _computerScore,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
