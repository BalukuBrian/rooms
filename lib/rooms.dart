import 'dart:core';

import 'dart:io';

int accountBalance = 10000; // To be update with withdraw and deposit function
String name;
String emailAddress;
String gender;
String country;
String favoriteFood;
String hobby;
String friend;
String favoriteCar;
int age;
var retries = 3;

void getUserInformation() {
  while (true) {
    // get user's name
    name = getUserResponse('Enter your name');

    // get user's email address
    emailAddress = getUserResponse('Enter your email address');

    // get user gender
    gender = getUserResponse('Enter your gender');

    // get user's country
    country = getUserResponse('Enter your country');

    // get user's favorite food
    favoriteFood = getUserResponse('Enter your favorite food');

    // get user's hobby
    hobby = getUserResponse('Enter your hobby');

    // get user's friends
    friend = getUserResponse("Enter your friends' name");

    // get user's favorite car
    favoriteCar = getUserResponse('What is your favorite car');

    // get user's age
    age = getUserAge();

    print('');

    updateUserAccountBalance();

    var quit = getUserResponse(
        "We have reached the end of our program, enter 'q' or press CTRL+C to quit");
    if (quit.toLowerCase() == 'q') {
      printResults();
      exit(0);
    } else {
      print('This is not one of the provided options');
      print('');
    }
  }
}

String getUserResponse(String question) {
  stdout.write('$question: \n');
  return stdin.readLineSync();
}

/// returns a list of foods from a string of foods separated by space
List<String> getFavoriteFoods(String favoriteFoodString) {
  return favoriteFoodString.split(' ');
}

int getUserAge() {
  stdout.write('Enter your age: \n');
  var response = stdin.readLineSync();
  int age;
  try {
    age = int.parse(response);
    return age;
  } catch (e) {
    if (retries > 0) {
      retries -= 1;

      print('Invalid age, you have $retries retries left \n');
      return getUserAge();
    } else {
      print(
          'Invalid, you have used all your retries, your age wont be captured\n');
      return null;
    }
  }
}

void printResults() {
  print('\n');
  print('**********Results*************');
  print('Your name is $name');
  print('Your email address is $emailAddress');
  print('Your gender is $gender');
  print('Your country is $country');
  print('Your favorite Food is $favoriteFood');
  print('Your hobby is $hobby');
  print('Your friend is $friend');
  print('Your favorite Car is $favoriteCar');
  print('Your age is $age');
  print('Your account balance is $accountBalance');
  print('*********Results**************');
  print('');
}

void updateUserAccountBalance() {
  var response = getUserResponse('Do you want to use your account(Yes/No)?');
  if (response != null) {
    if (response.toLowerCase() == 'yes') {
      var answer1 = getUserResponse(
          'Do you want to deposit or withdraw from your account(deposit/withdraw)?');
      if (answer1 != null && answer1.toLowerCase() == 'deposit') {
        //TODO finish implementing deposit function provided below  so that a use can deposit money
        deposit();
      } else if (answer1 != null && answer1.toLowerCase() == 'withdraw') {
        //TODO finish implementing withdraw function provided below so that a use can deposit money
        withdraw();
      } else {
        print('$answer1 is not one of the options');
      }
    } else {
      print('You decided not to use your account');
    }
  } else {
    print('You did not input anything');
  }
}

void deposit() {
  //var depositAmount = getUserResponse('How much do you want to deposit?');
  //TODO increase accountBalance by depositAmount
  // Make sure depositAmount is a valid integer
  // print new balance after depositing

  try {
    var UserDepositAmount =
        getUserResponse('How much do you want to deposit?: \n');

    var depositAmount = int.parse(UserDepositAmount);

    if (depositAmount <= 0) {
      throw NegativeDepositException();
    } else if (depositAmount == 0) {
      throw ZeroDepositException();
    } else {
      accountBalance += depositAmount;
      print('Your new balance is: $accountBalance');
    }
  } on NegativeDepositException {
    print('Can not add a negative deposit!\n');
  } on ZeroDepositException {
    print('Can not add 0 as a deposit!\n');
  } catch (e) {
    print('An error occured $e\n');
  }
}

void withdraw() {
  //TODO get the amount that the user wants to withdraw
  // store the amount in a variable called withdrawAmount
  // make sure withdrawAmount is a valid integer
  // make sure a user does not withdraw more than their accountBalance
  // print new balance

  var UserWithdrawAmount =
      getUserResponse('How much do you want to withdraw?\n');

  try {
    var withdrawAmount = int.parse(UserWithdrawAmount);

    if (withdrawAmount <= 0) {
      throw WithdrawLessAmountException();
    } else if (withdrawAmount > accountBalance) {
      throw WithdrawMorethanAmountException();
    } else {
      accountBalance -= withdrawAmount;
      print('Your new balance is: $accountBalance');
    }
  } catch (e) {
    if (e is FormatException) {
      print(e);
    } else {
      print('An error occurred $e');
    }
  }
}

class NegativeDepositException implements Exception {
  String errorMessage() {
    return 'You cannot deposit a negative amount ';
  }
}

class ZeroDepositException implements Exception {
  String errorMessage() {
    return 'You cannot deposit amount 0';
  }
}

class WithdrawLessAmountException implements Exception {
  String errorMessage() {
    return 'You cannot withdraw less than 1. Try Again!';
  }
}

class WithdrawMorethanAmountException implements Exception {
  String errorMessage() {
    return 'Insufficient Funds';
  }
}
