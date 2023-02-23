import 'package:flutter/material.dart';
import 'package:password/letUsGenerate.dart';

class generateByYourself extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Generate by yourself",
      home: Scaffold(appBar: AppBar(title: Text("Generate by yourself"),),
      body: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlinedButton(onPressed: () => {}, child: Text ("Password Length"),),
            OutlinedButton(onPressed: () => {}, child: Text ("Base on your word"),),
            OutlinedButton(onPressed: () => {}, child: Text ("Length of upper case"),),
            OutlinedButton(onPressed: () => {}, child: Text ("Length of special symbol"),),
            OutlinedButton(onPressed: () => {Navigator.pop(context)}, child: Text ("back"),),
          ],
        ),
      ),
    ),
    );
  }
}
