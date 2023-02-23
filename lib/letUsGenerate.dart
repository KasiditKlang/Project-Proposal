import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class letUsGenerate extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Let us generate",
      home: Scaffold(appBar: AppBar(title: Text("Let us generate"),),
      body: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlinedButton(onPressed: () => {}, child: Text ("Password Length"),),
            OutlinedButton(onPressed: () => {}, child: Text ("Upper Case"),),
            OutlinedButton(onPressed: () => {}, child: Text ("Special Characters"),),
          ],
        ),
      ),
    ),
    );
  }
}
