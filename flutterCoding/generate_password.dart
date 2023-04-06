// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, sort_child_properties_last, deprecated_member_use

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:safeword/main.dart';

class GeneratePassword extends StatefulWidget {
  @override
  _GeneratePasswordState createState() => _GeneratePasswordState();
}

class _GeneratePasswordState extends State<GeneratePassword> {
  TextEditingController length = TextEditingController();
  TextEditingController upperLength = TextEditingController();
  TextEditingController specialLength = TextEditingController();
  String result = "";
  final _random = Random(); 

  String generatePassword(int length, int upperLength, int specialLength) {
    const upper = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const special = '!@#\$%^&*()_+';
    const lower = 'abcdefghijklmnopqrstuvwxyz01234567890123456789';

    if (upperLength + specialLength > length) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text(
                '      Please change the length \n                of characters',
                style: TextStyle(color: Colors.red),
              ),
              actions: [
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
      return "";
    } else if (length <= 1) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text(
                '      The length of pass word should \n        be more than one characters',
                style: TextStyle(color: Colors.red),
              ),
              actions: [
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
      return "";
    } else if (length > 20) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text(
                '      The length of pass word should \n        be less than 20 characters',
                style: TextStyle(color: Colors.red),
              ),
              actions: [
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
      return "";
    }

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

    // Generate the lowercase and numeric characters
    final remainingLength = length - upperLength - specialLength;
    final remainingCharacters = StringBuffer();
    for (var i = 0; i < remainingLength; i++) {
      final index = _random.nextInt(lower.length);
      remainingCharacters.write(lower[index]);
    }

    final password =
        '${upperCaseCharacters.toString()}${specialCharacters.toString()}${remainingCharacters.toString()}';

    final passwordChars = password.split('');
    for (var i = passwordChars.length - 1; i > 0; i--) {
      final j = _random.nextInt(i + 1);
      final temp = passwordChars[i];
      passwordChars[i] = passwordChars[j];
      passwordChars[j] = temp;
    }
    SystemChannels.textInput.invokeMethod('TextInput.hide');

    return passwordChars.join('');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background1.jpg'),
          fit: BoxFit.cover,
          alignment: Alignment.topRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.0),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),
                    Container(
                      width: 400,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.89),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: const Center(
                        child: Text(
                          'Let us generate',
                          textAlign: TextAlign
                              .center, // center the text within the container
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 22),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'Password Length',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                    TextField(
                      controller: length,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        hintText: '0',
                        hintStyle: TextStyle(color: Color.fromARGB(255, 180, 174, 174)),
                      ),                                    
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20, // increase font size
                        
                      ),
                    ),
                    const SizedBox(height: 18),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'Uppercase Characters length',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                    TextField(
                      controller: upperLength,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        hintText: '0',
                        hintStyle: TextStyle(color: Color.fromARGB(255, 180, 174, 174)),
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20, // increase font size
                      ),
                    ),
                    const SizedBox(height: 18),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'Special chacrecters length',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                    TextField(
                      controller: specialLength,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        hintText: '0',
                        hintStyle: TextStyle(color: Color.fromARGB(255, 180, 174, 174)),
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20, // increase font size
                      ),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          result = generatePassword(
                            int.tryParse(length.text) ?? 0,
                            int.tryParse(upperLength.text) ?? 0,
                            int.tryParse(specialLength.text) ?? 0,
                          );
                        });
                      },
                      child: const Text('Generate',
                          style: TextStyle(fontSize: 20, color: Colors.black)),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Clipboard.setData(ClipboardData(text: result));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Copied to clipboard')),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              result,
                              style: const TextStyle(
                                  fontSize: 24, color: Colors.white),
                            ),
                            const SizedBox(width: 10),
                            const Icon(Icons.copy, color: Colors.white),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const BackButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 0,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white, width: 3),
                ),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 50,
            height: 120,
          ),
          Expanded(
            flex: 0,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0, 0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: const HomePage(),
                    );
                  },
                  transitionDuration: const Duration(milliseconds: 300),
                ));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: const Icon(
                      Icons.home,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
