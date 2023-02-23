import 'package:flutter/material.dart';
import 'package:password/generatepass.dart';
import 'package:password/knowLedge.dart';

class second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Page2",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Page2"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              OutlinedButton(
                onPressed: () => {Navigator.pop(context)},
                child: Text("back"),
              ),
              OutlinedButton(
                onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => generatepass())))
                },
                child: Text("Generate Password"),
              ),
              OutlinedButton(
                onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => knowledge())))
                },
                child: Text("Knowledge"),
              ),
            
              // FlatButton(
              //   onPressed: () => {},
              //   child: Text("link"),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
