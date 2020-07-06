import 'package:flutter/material.dart';

class DietasRec extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Diet",
            style: TextStyle(fontSize: 20, color: Color(0xFF5F44A3))),
        centerTitle: true,
        backgroundColor: Color(0xFFFFFFFF),
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Color(0xFF5F44A3),
            width: 380,
            height: 200,
          ),
          Divider(
            height: 40,
          ),
          Container(
            color: Color(0xFF5F44A3),
            width: 380,
            height: 200,
          )
        ],
      ),
    );
  }
}
