import 'package:intern_dart_project/intern_dart_project.dart';
import 'package:test/test.dart';

void main() {
  testForUnitTest1();
}

void testForUnitTest1() {
  test('testForUnitTest1', () {
    final expectedList = [1, 2, 3, 4, 5, 6, 10, 12, 15, 20, 25, 30, 50, 60, 75, 100, 150, 300];
    expect(expectedList, findDivisorOf(300));
  });
}
