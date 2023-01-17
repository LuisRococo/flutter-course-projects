import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('SCP Foundation'),
          backgroundColor: Colors.pink[800],
        ),
        body: const Center(
          child: Image(
            image: NetworkImage(
                'https://assets.stickpng.com/images/621f924f654abf384c30d648.png'),
          ),
        ),
        backgroundColor: Colors.blueGrey[50],
      ),
    ),
  );
}
