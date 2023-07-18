// exercise 1
import 'dart:io';
import 'dart:math';

import 'package:intern_dart_project/exercise_1.dart';
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
