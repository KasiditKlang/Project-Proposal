import 'dart:math';
import 'dart:io';

final _random = Random();

void main() {
  final input = stdin;

  int? length, upperLength, specialLength;

  try {
    stdout.write('Enter password length: ');
    length = int.parse(input.readLineSync()!);

    stdout.write('Enter length of upper case characters: ');
    upperLength = int.parse(input.readLineSync()!);

    stdout.write('Enter length of special characters: ');
    specialLength = int.parse(input.readLineSync()!);
  } catch (e) {
    print('Invalid input: $e');
    return;
  }

  if (upperLength + specialLength > length) {
    print('Upper case and special lengths combined cannot be greater than password length.');
    final remainingLength = length - min(upperLength, length) - min(specialLength, length - min(upperLength, length));
    //print('Upper case length: ${min(upperLength, length)}');
    //print('Special length: ${min(specialLength, length - min(upperLength, length))}');
    //print('Remaining length: $remainingLength');
  } else {
    final password = generatePassword(length, upperLength, specialLength);
    print('Generated password: $password');
  }
}

String generatePassword(int length, int upperLength, int specialLength) {
  const upper = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  const special = '!@#\$%^&*()_+';
  const lower = 'abcdefghijklmnopqrstuvwxyz0123456789';

  // Generate the upper case characters
  final upperCaseCharacters = StringBuffer();
  for (var i = 0; i < upperLength; i++) {
    final index = _random.nextInt(upper.length);
    upperCaseCharacters.write(upper[index]);
  }

  // Generate the special characters
  final specialCharacters = StringBuffer();
  for (var i = 0; i < specialLength; i++) {
    final index = _random.nextInt(special.length);
    specialCharacters.write(special[index]);
  }

  // Generate the remaining characters
  final remainingLength = length - upperLength - specialLength;
  final remainingCharacters = StringBuffer();
  for (var i = 0; i < remainingLength; i++) {
    final index = _random.nextInt(lower.length);
    remainingCharacters.write(lower[index]);
  }

  // Combine the upper case, special, and remaining characters
  final password = '${upperCaseCharacters.toString()}${specialCharacters.toString()}${remainingCharacters.toString()}';

  // Shuffle the password characters
  final passwordChars = password.split('');
  for (var i = passwordChars.length - 1; i > 0; i--) {
    final j = _random.nextInt(i + 1);
    final temp = passwordChars[i];
    passwordChars[i] = passwordChars[j];
    passwordChars[j] = temp;
  }

  return passwordChars.join('');
}
