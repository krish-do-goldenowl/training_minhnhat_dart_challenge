import 'dart:math';

// game 1
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

// game 3
List<int> playCowsAndBullsGame(List<String> expectedNumberStrings, List<String> trueNumberStrings) {
  final result = <int>[0, 0];
  final length = trueNumberStrings.length;

  for (var i = 0; i < length; i++) {
    final currentNumber = trueNumberStrings[i];
    if (expectedNumberStrings.contains(currentNumber)) {
      if (expectedNumberStrings[i] == currentNumber) {
        result[0]++;
      } else {
        result[1]++;
      }
    }
  }

  return result;
}

// game 4
Map<String, List<int>> wordToWordsMap(String word) {
  final length = word.length;
  final wordsMap = <String, List<int>>{};
  for (var i = 0; i < length; i++) {
    if (wordsMap[word[i]] == null) {
      wordsMap[word[i]] = [i];
    } else {
      wordsMap[word[i]]!.add(i);
    }
  }
  return wordsMap;
}
bool characterIsFromAtoZ(String character) {
  final codeA = 'A'.codeUnitAt(0);
  final codeZ = 'Z'.codeUnitAt(0);
  final codeCharacter = character.toUpperCase().codeUnitAt(0);
  return codeCharacter >= codeA && codeCharacter <= codeZ;
}