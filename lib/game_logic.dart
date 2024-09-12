class GameLogic {
  static String getResult(String playerChoice, String computerChoice) {
    if ((playerChoice == "pedra" && computerChoice == "tesoura") ||
        (playerChoice == "papel" && computerChoice == "pedra") ||
        (playerChoice == "tesoura" && computerChoice == "papel")) {
      return "Você ganhou!";
    } else if ((playerChoice == "tesoura" && computerChoice == "pedra") ||
        (playerChoice == "pedra" && computerChoice == "papel") ||
        (playerChoice == "papel" && computerChoice == "tesoura")) {
      return "Você perdeu!";
    } else {
      return "Empate!";
    }
  }
}
