// exercise 1
import 'dart:io';
import 'dart:math';

import 'package:intern_dart_project/exercise_1.dart';
import 'package:intern_dart_project/game_exercises.dart';
import 'package:intern_dart_project/unit_test_exercises.dart';
import 'package:test/test.dart';

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
      // print('divisor of $integer: ${intern_dart_project.findDivisorOf(integer)}');
      runUniTestCases(
        1,
        [1, 2, 3, 4, 5, 6, 10, 12, 15, 20, 25, 30, 50, 60, 75, 100, 150, 300],
        findDivisorOf(integer),
      );
      break;
    }
    case 3: {
      final list1 = [1, 1, 2, 3, 5, 8, 89, 13, 21, 34, 55];
      final list2 = [1, 2, 3, 4, 5, 6, 10, 7, 8, 9, 11, 12, 13];
      // for (var i = 0; i < 10; i++) {
      //   list1.add(-1000 + random.nextInt(4080));
      //   list2.add(-777 + random.nextInt(500));
      // }
      runUniTestCases(2, [1, 2, 3, 5, 8, 13], findCommonElements(list1, list2));
      break;
    }
    case 4: {
      stdout.write("Enter an positive integer: ");
      final integer = int.parse(stdin.readLineSync() ?? '0');
      stdout.write("Do you think your number is prime (y/n): ");
      final resultExpected = stdin.readLineSync() != 'y' ? false : true;

      runUniTestCases(3, resultExpected, checkPrimeNumber(integer));
      break;
    }
    case 5: {
      stdout.write("Enter your password: ");
      final password = stdin.readLineSync() ?? '';
      print('Your password is $password');
      runUniTestCases(4, true, checkPassword(password));
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
          }
        }
      } while(!result && yourChoice != 'exit');
      break;
    }
    case 8: {
      break;
    }
    case 9: {
      break;
    }
  }
}

void runUniTestCases(int testIndex, expectedValue, trueValue) {
  try {
    test('testForUnitTest$testIndex', () {
      expect(expectedValue, trueValue);
    });
  } catch(e) {
    print(e);
  }
}
