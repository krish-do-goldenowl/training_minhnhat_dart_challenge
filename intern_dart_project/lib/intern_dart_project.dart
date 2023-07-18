// exercise 1
import 'dart:math';

void printSquare(int squareSize){
  String horizontalLine = " ---" * squareSize;
  String verticalLine = '|   ' * (squareSize + 1);
  for(int i = 0; i < squareSize; i++){
    print(horizontalLine);
    print(verticalLine);
  }
  print(horizontalLine);
}

// unit test 1
List<int> findDivisorOf(int number) {
  List<int> result = [1];
  for(int i = 2; i <= number/2; i++){
    if(number % i == 0){
      result.add(i);
    }
  }
  result.add(number);
  return result;
}

// unit test 2
List<int> findCommonElements(List<int> list1, List<int> list2){
  List<int> result = [];
  for(int i = 0; i < list1.length; i++){
    if(list2.contains(list1[i]) && !result.contains(list1[i])){
      result.add(list1[i]);
    }
  }
  return result;
}

// unit test 3
bool checkPrimeNumber(int number){
  if(number < 2){
    return false;
  }

  if (number == 2) {
    return true;
  }

  for(int i = 2; i <= sqrt(number); i++){
    if(number % i == 0){
      return false;
    }
  }
  return true;
}

RegExp passwordRegex() {
  // write regex with at least 6 characters and has at least 1 number, 1 letter and 1 special character
  return RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$');
}
