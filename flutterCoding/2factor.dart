// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'main.dart';

class TwoFactor extends StatelessWidget {
  const TwoFactor({Key? key}) : super(key: key);

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
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.95),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: const Center(
                        child: Text(
                          'What is \nTwo-Factor Authentication?',
                          textAlign: TextAlign
                              .center, // center the text within the container
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: const SingleChildScrollView(
                          child: Text(
                        '2FA is an extra layer of security used to make sure that people trying to gain access to an online account are who they say they are. First, a user will enter their username and a password. Then, instead of immediately gaining access, they will be required to provide another piece of information. This second factor could come from one of the following categories:\n\nSomething you know: This could be a personalidentification number (PIN), a password, answers to “secret questions” or a specific keystroke pattern\n\n'
                        'Something you have: Typically, a user would have something in their possession, like a credit card, a smartphone, or a small hardware token\n\nSomething you are: This category is a little more advanced, and might include biometric pattern of a fingerprint, an iris scan, or a voice print\nWith 2FA, a potential compromise of just one of these factors won’t unlock the account. So, even if your password is stolen or your phone is lost, the chances of a someone else having your second-factor information is highly unlikely.if a consumer uses 2FA correctly, websites and apps can be more confident of the user’s identity ',                        style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.2,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const BackButtonWidget(),
                  ],
                ),
              ),
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
      padding: const EdgeInsets.symmetric(horizontal: 20,),
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
          const SizedBox(width: 50, height: 100,),
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
