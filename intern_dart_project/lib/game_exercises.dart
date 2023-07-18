import 'dart:math';

final random = Random();
List<int> playRockPaperScissorsGame(int userChoice) {
  int randomChoice = random.nextInt(3);
  final listReturn = [randomChoice];

  if (userChoice == randomChoice) {
    listReturn.add(0);
  } else if (userChoice == 0 && randomChoice == 1) {
    listReturn.add(-1);
  } else if (userChoice == 0 && randomChoice == 2) {
    listReturn.add(1);
  } else if (userChoice == 1 && randomChoice == 0) {
    listReturn.add(1);
  } else if (userChoice == 1 && randomChoice == 2) {
    listReturn.add(-1);
  } else if (userChoice == 2 && randomChoice == 0) {
    listReturn.add(-1);
  } else if (userChoice == 2 && randomChoice == 1) {
    listReturn.add(1);
  } else {
    listReturn.add(0);
  }

  return listReturn;
}