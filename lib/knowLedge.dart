import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class knowledge extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Knowledge",
      home: Scaffold(appBar: AppBar(title: Text("Knowledge"),),
      body: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlinedButton(onPressed: () => {}, child: Text ("How to make password stronger"),),
            OutlinedButton(onPressed: () => {}, child: Text ("What is two factor authentication?"),),
            OutlinedButton(onPressed: () => {}, child: Text ("How important is cyber security."),),
            OutlinedButton(onPressed: () => {}, child: Text ("How often do users need to change their passwords?"),),
            OutlinedButton(onPressed: () => {Navigator.pop(context)}, child: Text ("back"),),
          ],
        ),
      ),
    ),
    );
  }
}
