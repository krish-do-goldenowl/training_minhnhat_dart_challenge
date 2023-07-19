import 'dart:math';

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

// unit test 4
bool checkPassword(String password) {
  return RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{6,}$').hasMatch(password);
}
