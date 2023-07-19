import 'dart:io';

import 'package:intern_dart_project/intern_dart_project.dart' as intern_dart_project;

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
  var yourChoice = 0;
  print('Welcome to dart challenge project');
  do {
    print('\nThese are options for you to choose:');
    for (var i = 0; i < listText.length; i++) {
      print(listText[i]);
    }
    stdout.write("Your choice: ");
    try {
      yourChoice = int.parse(stdin.readLineSync() ?? '0');
      print('Your choice is ${listText[yourChoice]}');

      intern_dart_project.executeOption(yourChoice);
    } catch (e) {
      print('Your choice is not valid. Please choose again');
      yourChoice = -1;
    }
  } while (yourChoice != 0);
}
