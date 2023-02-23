import 'package:flutter/material.dart';
import 'package:password/generateByYourself.dart';
import 'package:password/letUsGenerate.dart';

class generatepass extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Generate Password",
      home: Scaffold(appBar: AppBar(title: Text("Generate Password"),),
      body: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlinedButton(onPressed: () => {Navigator.push(context, MaterialPageRoute(builder: ((context) => letUsGenerate())))}, child: Text ("Let us generate"),),
            OutlinedButton(onPressed: () => {Navigator.push(context, MaterialPageRoute(builder: ((context) => generateByYourself())))}, child: Text ("Generate by yourself"),),
            OutlinedButton(onPressed: () => {Navigator.pop(context)}, child: Text ("back"),),
          ],
        ),
      ),
    ),
    );
  }
}
