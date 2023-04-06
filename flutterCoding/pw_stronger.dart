import 'package:flutter/material.dart';
import 'main.dart';

class PwStronger extends StatelessWidget {
  const PwStronger({Key? key}) : super(key: key);

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
                          'How to make \npassword stronger',
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
                            '1. Do not use sequential numbers or letters\nFor example, do not use 1234, qwerty, jklm, 6789, etc.\n\n2. Do not include your birth year or birth month/day in your password\nRemember that cyber criminals can easily find this information by snooping into your socialmedia accounts.\n\n3. Use a combination of at least eight letters, numbers, and symbols\nThe longer your password and the more character variety it uses, the harder it is to guess. For example, M0l#eb9Qv? uses a unique combination of upper- and lowercase letters, numbers, and symbols.  '
                            '\n\n4. Combine different unrelated words in your password or passphrase\nThis practice makes it difficult for cyber criminals to guess your password. Do not use phrases from popular songs, movies, or television shows. Use three or four longer words to create your passphrase. For example, 9SpidErscalKetogGaN.\n\n5. Do not use names or words found in the dictionary\nSubstitute letters with numbers or symbols to make it difficult to guess the password. Or deliberately use spelling errors in the password or passphrase. For example, P8tty0G#5dn for “patio garden.”\n '
                            '\n\n6. Use a password manager to store your passwords\nDo not store your passwords in a document on your computer. Ensure you’re using the password manager tool the IT/support team provided to store all professional and personal passwords.\n\n7. Do not reuse your passwords\nEvery device, application, website, and software requires a unique and strong password or PIN. Remember, if a cyber criminal does guess one of your passwords, they will use this to attempt to hack into all of your personal and professional accounts.\n\n',
                            style: TextStyle(
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
