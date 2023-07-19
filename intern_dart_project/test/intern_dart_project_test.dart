import 'dart:math';

import 'package:intern_dart_project/unit_test_exercises.dart';
import 'package:test/test.dart';

final random = Random();
void main() {
  testForUnitTest1();
  testForUnitTest2();
  testForUnitTest3();
  testForUnitTest4();
}

void testForUnitTest1() {
  print('test 1 for 300');
  test('testForUnitTest1', () {
    expect(
      findDivisorOf(300),
      [1, 2, 3, 4, 5, 6, 10, 12, 15, 20, 25, 30, 50, 60, 75, 100, 150, 300],
    );
  });
}
void testForUnitTest2() {
  final list1 = [1, 1, 2, 3, 5, 8, 89, 13, 21, 34, 55];
  final list2 = [1, 2, 3, 4, 5, 6, 10, 7, 8, 9, 11, 12, 13];
  print('test 2 for $list1');
  print('and $list2');
  test('testForUnitTest2', () {
    expect(findCommonElements(list1, list2), [1, 2, 3, 5, 8, 13]);
  });
}
void testForUnitTest3() {
  final integer = 97;
  print('test 3 for $integer');
  test('testForUnitTest3', () {
    expect(
      checkPrimeNumber(integer),
      true,
    );
  });
}
void testForUnitTest4() {
  final password = 'A@123abc';
  print('test 4 for $password');
  test('testForUnitTest4', () {
    expect(checkPassword(password), true);
  });
}
