import 'dart:io';
import 'dart:math';

import 'package:intern_dart_project/intern_dart_project.dart' as intern_dart_project;
import 'package:test/test.dart';

const listText = [
  '0. Exit',
  '1. Exercise 1 (Print a square with an input size).',
  '2. Unit test 1',
  '3. Unit test 2',
  '4. Unit test 3',
  '5. Unit test 4',
  '6. Play rock paper scissors game',
  '7. Game 2',
  '8. Game 3',
  '9. Game 4',
];

void main() {
  final random = Random();
  var yourChoice = 0;
  print('Welcome to dart challenge project');
  print('These are options for you to choose:');
  for (var i = 0; i < listText.length; i++) {
    print(listText[i]);
  }
  stdout.write("Your choice: ");
  yourChoice = int.parse(stdin.readLineSync() ?? '0');
  print('Your choice is ${listText[yourChoice]}');

  switch(yourChoice) {
    case 0: {
      print('Goodbye');
      break;
    }
    case 1: {
      stdout.write("Enter square size (must > 0): ");
      final squareSize = int.parse(stdin.readLineSync() ?? '0');
      intern_dart_project.printSquare(max(0, squareSize));
      break;
    }
    case 2: {
      stdout.write("Enter an integer: ");
      final integer = int.parse(stdin.readLineSync() ?? '0');
      // print('divisor of $integer: ${intern_dart_project.findDivisorOf(integer)}');
      runUniTestCases(1, () {
        final expectedList = [1, 2, 3, 4, 5, 6, 10, 12, 15, 20, 25, 30, 50, 60, 75, 100, 150, 300];
        expect(expectedList, intern_dart_project.findDivisorOf(integer));
      });
      break;
    }
    case 3: {
      final list1 = [1, 1, 2, 3, 5, 8, 89, 13, 21, 34, 55];
      final list2 = [1, 2, 3, 4, 5, 6, 10, 7, 8, 9, 11, 12, 13];
      // for (var i = 0; i < 10; i++) {
      //   list1.add(-1000 + random.nextInt(4080));
      //   list2.add(-777 + random.nextInt(500));
      // }
      runUniTestCases(2, () {
        final listCommon = intern_dart_project.findCommonElements(list1, list2);
        final listExpectedCommon = [1, 2, 3, 5, 8, 13];
        expect(listExpectedCommon, listCommon);
      });
      break;
    }
    case 4: {
      stdout.write("Enter an positive integer: ");
      final integer = int.parse(stdin.readLineSync() ?? '0');
      stdout.write("Do you think your number is prime (y/n): ");
      final resultExpected = stdin.readLineSync() != 'y' ? false : true;

      runUniTestCases(3, () {
        expect(resultExpected, intern_dart_project.checkPrimeNumber(integer));
      });
      break;
    }
    case 5: {
      stdout.write("Enter your password: ");
      final password = stdin.readLineSync() ?? '';
      print('Your password is $password.');
      print(intern_dart_project.passwordRegex().hasMatch(password));
        runUniTestCases(4, () {
        expect(true, intern_dart_project.passwordRegex().hasMatch(password));
      });
      break;
    }
  }
}

void runUniTestCases(int testIndex, dynamic Function() testFunction) {
  try {
    test('testForUnitTest$testIndex', testFunction);
  } catch(e) {
    print(e);
  }
}
