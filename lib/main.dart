import 'package:flutter/material.dart';
import 'package:password/second.dart';

void main() {
  runApp(pageone());
}

class pageone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SafeWord",
      home: movetwo(),
      theme: ThemeData(primarySwatch: Colors.green),
    );
  }
}

class movetwo extends StatefulWidget {

  @override
  State<movetwo> createState() => _movetwoState();
}

class _movetwoState extends State<movetwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Our pass"),
      ),
      body: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlinedButton(onPressed: () => {Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => second())))}, child: Text ("Touch"),),
          ],
        ),
      ),
    );
  }
}
