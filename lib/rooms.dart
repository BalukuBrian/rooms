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

    updateUserAccountBalance();

    printResults();

    exit(0);
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

var retries = 3;
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
      print('Invalid age, you have $retries retries left');
      return getUserAge();
    } else {
      print(
          'Invalid, you have used all your retries, your age wont be captured');
      return null;
    }
  }
}

void printResults() {
  print('**********Results*************');
  print('My name is $name');
  print('My email address is $emailAddress');
  print('My gender is $gender');
  print('My country is $country');
  print('My favorite Food is $favoriteFood');
  print('My hobby is $hobby');
  print('My friend is $friend');
  print('My favorite Car is $favoriteCar');
  print('My age is $age');
  print('Your account balance is $accountBalance');
  print('*********Results**************');
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
      }

      if (answer1 != null && answer1.toLowerCase() == 'withdraw') {
        //TODO finish implementing withdraw function provided below so that a use can deposit money
        withdraw();
      }
    } else {
      print('You decided not to use your account');
    }
  } else {
    print('You did not input anything');
  }
}

void deposit() {
  var depositAmount = getUserResponse('How much do you want to deposit?');
  //TODO increase accountBalance by depositAmount
  // Make sure depositAmount is a valid integer
  // print new balance after depositing
}

void withdraw() {
  //TODO get the amount that the user wants to withdraw
  // store the amount in a variable called withdrawAmount
  // make sure withdrawAmount is a valid integer
  // make sure a user does not withdraw more than their accountBalance
  // print new balance
}
