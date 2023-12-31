// exercise 1
import 'dart:io';
import 'dart:math';

import 'package:intern_dart_project/exercise_1.dart';
import 'package:intern_dart_project/game_exercises.dart';
import 'package:intern_dart_project/unit_test_exercises.dart';
import 'package:collection/collection.dart';

void executeOption(int option) {
  switch(option) {
    case 0: {
      print('Goodbye');
      break;
    }
    case 1: {
      stdout.write("Enter square size (must > 0): ");
      final squareSize = int.parse(stdin.readLineSync() ?? '0');
      printSquare(max(0, squareSize));
      break;
    }
    case 2: {
      stdout.write("Enter an integer: ");
      final integer = int.parse(stdin.readLineSync() ?? '0');
      print('Divisor of $integer: ${findDivisorOf(integer)}');
      break;
    }
    case 3: {
      final list1 = [1, 1, 2, 3, 5, 8, 89, 13, 21, 34, 55];
      final list2 = [1, 2, 3, 4, 5, 6, 10, 7, 8, 9, 11, 12, 13];
      print('list1: $list1');
      print('list2: $list2');
      print('common elements: ${findCommonElements(list1, list2)}');
      break;
    }
    case 4: {
      stdout.write("Enter an positive integer: ");
      final integer = int.parse(stdin.readLineSync() ?? '0');
      stdout.write("Do you think your number is prime (y/n): ");
      print('Your number is ${checkPrimeNumber(integer) ? '' : 'not '}prime');
      break;
    }
    case 5: {
      stdout.write("Enter your password: ");
      final password = stdin.readLineSync() ?? '';
      print('Your password is $password and it is ${checkPassword(password) ? '' : 'not '}valid');
      break;
    }
    case 6: {
      String? yourChoice;
      var score = 0;
      do {
        print('\n\nWelcome to Rock, Paper, Scissors. \nType "exit" to stop the game');
        stdout.write("Please choose Rock(0), Paper(1) or Scissors(2): ");
        yourChoice = stdin.readLineSync();
        if (yourChoice == 'exit') {
          print('Your score is $score');
        } else {
          try {
            final userChoice = int.parse(yourChoice!);
            final realChoice = userChoice < 0 ? 0 : (userChoice > 2 ? 2 : userChoice);
            final matchResult = playRockPaperScissorsGame(realChoice);
            print('Your choice is $realChoice');
            print('Computer choice is ${matchResult[0]}');
            if (matchResult[1] == 0) {
              print('Match draw');
            } else if (matchResult[1] == 1) {
              print('Match win');
            } else {
              print('Match lose');
            }
            print('Score ${matchResult[1] >= 0 ? '+' : ''}${matchResult[1]}');
            score += matchResult[1];
          } catch(e) {
            print('Invalid input.\nPlease input again.');
          }
        }
      } while(yourChoice != 'exit');
      break;
    }
    case 7: {
      var result = false, tryCounts = 0;
      String? yourChoice;
      final randomNumber = Random().nextInt(101);
      do {
        tryCounts++;
        print('\n\nType exit to quit the game');
        stdout.write("Please choose a number between 0 and 100: ");
        yourChoice = stdin.readLineSync();
        if (yourChoice != 'exit') {
          try {
            final userChoice = int.parse(yourChoice!);
            if (userChoice < randomNumber) {
              print('You are lower');
            } else if (userChoice > randomNumber) {
              print('You are higher');
            } else {
              result = true;
              print('Bingo! You tried $tryCounts times\n');
            }
          } catch(e) {
            print('Invalid input.\nPlease input again.');
            tryCounts--;
          }
        }
      } while(!result && yourChoice != 'exit');
      break;
    }
    case 8: {
      var result = false;
      var attempts = 0;
      String? yourChoice;
      final random4DigitsNumber = Random().nextInt(10000) + 1000;
      final random4DigitsNumberString = random4DigitsNumber.toString().split('');
      print('Random number: $random4DigitsNumberString');
      do {
        attempts++;
        print('\n\nWelcome to Cows and Bulls\nType "exit" to stop the game');
        stdout.write("Please choose a four digits number: ");
        yourChoice = stdin.readLineSync();
        if (yourChoice != 'exit') {
          try {
            final userChoice = int.parse(yourChoice!);
            final cowsAndBullsResult = playCowsAndBullsGame(
              random4DigitsNumberString, userChoice.toString().split(''),
            );
            if (cowsAndBullsResult[0] == random4DigitsNumberString.length) {
              print('Congratulations! You tried $attempts times');
              result = true;
            } else {
              print('Incorrect number. Make sure to give 4 digit number');
              print('Attempts: $attempts \nCows: ${cowsAndBullsResult[0]}, Bulls: ${cowsAndBullsResult[1]}');
            }
          } catch(e) {
            print('Invalid input.\nPlease input again.');
            attempts--;
          }
        }
      } while(!result && yourChoice != 'exit');
      break;
    }
    case 9: {
      final word = 'GOLDENOWL';
      final length = word.length;
      final wordsList = word.split('');
      final wordsMap = wordToWordsMap(word);
      final userAnswer = List<String>.generate(length, (index) => '_');
      String? currentChoice = '';
      var result = false;
      do {
        print('\n${userAnswer.join(' ')}');
        stdout.write('Please guess a letter: ');
        currentChoice = stdin.readLineSync();
        if (currentChoice == null || characterIsFromAtoZ(currentChoice) == false) {
          print('Invalid input.\nPlease input again.');
        } else {
          final trueChoice = currentChoice.toUpperCase();
          final listIndexes = wordsMap[trueChoice] ?? [];
          final listIndexesLength = listIndexes.length;
          if (listIndexesLength == 0) {
            print('No $trueChoice in the word');
          } else {
            print('There are $listIndexesLength $trueChoice in the word');
            for (var j = 0; j < listIndexesLength; j++) {
              userAnswer[listIndexes[j]] = trueChoice;
            }
          }
        }
        result = ListEquality().equals(wordsList, userAnswer);
        if (result) {
          print('Congratulations! You guessed the word: $word');
        }
      } while(!result);
      break;
    }
  }
}
