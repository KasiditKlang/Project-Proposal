// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, unused_field, prefer_const_constructors, sort_child_properties_last, deprecated_member_use

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:safeword/main.dart';

class StringConverter extends StatefulWidget {
  @override
  _StringConverterState createState() => _StringConverterState();
}

class _StringConverterState extends State<StringConverter> {
  final TextEditingController _textEditingController =
      TextEditingController();
  final TextEditingController _lengthTextEditingController =
      TextEditingController();
  int _desiredLength = 0;
  String _outputString = '';

  final List<List<String>> _replacements = [
    ['A', 'a', '@'],
    ['B', 'b', '6', '8', '&'],
    ['C', 'c', '(', ')'],
    ['D', 'd'],
    ['E', 'e', '3'],
    ['F', 'f'],
    ['G', 'g', '9'],
    ['H', 'h'],
    ['I', 'i', '!'],
    ['J', 'j'],
    ['K', 'k'],
    ['L', 'l', '|', '1'],
    ['M', 'm'],
    ['N', 'n'],
    ['O', 'o', '0'],
    ['P', 'p'],
    ['Q', 'q'],
    ['R', 'r'],
    ['S', 's', '5', '\$'],
    ['T', 't', '+'],
    ['U', 'u'],
    ['V', 'v'],
    ['W', 'w'],
    ['X', 'x'],
    ['Y', 'y'],
    ['Z', 'z', '=']
  ];
//GpsMaker
  final List<String> _another = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z',
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
    'i',
    'j',
    'k',
    'l',
    'm',
    'n',
    'o',
    'p',
    'q',
    'r',
    's',
    't',
    'u',
    'v',
    'w',
    'x',
    'y',
    'z',
    "!",
    "@",
    "#",
    "\$",
    "%",
    "^",
    "&",
    "*",
    "(",
    ")",
    "_",
    "+",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "0"
  ];

  void _convertString() {
    String inputString = _textEditingController.text;
    int desiredLength = int.tryParse(_lengthTextEditingController.text) ??
        0; // ensure that _desiredLength is an integer
    var outputString = StringBuffer();
    var random = Random();
    if (inputString.length > desiredLength) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text(
                'The password length is must be more than or equal the length of Base on your word',
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

      return;
    }
    if (inputString.isEmpty) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text(
                'Please enter the Base on your word.',
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
      return;
    }
    if (desiredLength == 0) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text(
                'Please enter the Password length.',
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
      return;
    }
    if (inputString.length > 20) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text(
                'The length of Base on your word should be at most 20 character.',
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
      return;
    }
    if (desiredLength > 20) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text(
                'The Password length should be at most 20 character.',
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
      return;
    } else if (desiredLength >= inputString.length) {
      // Replace characters in inputString and add them to outputString
      for (String co in inputString.split('')) {
        bool replaced = false;
        for (List<String> replacement in _replacements) {
          if (replacement.contains(co)) {
            outputString.write(replacement[random.nextInt(replacement.length)]);
            replaced = true;
            SystemChannels.textInput.invokeMethod('TextInput.hide');

            break;
          }
        }
        if (!replaced) {
          outputString.write(co);
        }
      }

      // Determine how many additional characters are needed
      var remainingChars = desiredLength - inputString.length;

      while (remainingChars > 0) {
        outputString.write(_another[random.nextInt(_another.length)]);
        remainingChars--;
      }

      setState(() {
        _desiredLength =
            desiredLength; // update _desiredLength after successful parsing
        _outputString = outputString.toString();
      });
    }
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
                          'Generate by yourself',
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
                    const SizedBox(height: 70),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'Base on your word',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                    TextField(
                      controller: _textEditingController,
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'fill your word here',
                        hintStyle: TextStyle(color: Color.fromARGB(255, 180, 174, 174)),
                      ),
                    ),
                    const SizedBox(height: 35),
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
                      controller: _lengthTextEditingController,
                      keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: '0',
                        hintStyle: TextStyle(color: Color.fromARGB(255, 180, 174, 174)),
                      ),
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () {
                        _convertString();
                      },
                      child: Text('Generate',
                          style: TextStyle(fontSize: 20, color: Colors.black)),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Clipboard.setData(ClipboardData(text: _outputString));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Copied to clipboard')),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _outputString,
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white),
                            ),
                            SizedBox(width: 10),
                            Icon(Icons.copy, color: Colors.white),
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
                      border: Border.all(color: Colors.white, width: 3),
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
