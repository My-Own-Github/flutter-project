import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.light()),
    ),
  );
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var students = [
    {"name": "Saurabh Mali", "mobile_no": "+91-7875792976"},
    {"name": "Mayur Mahale", "mobile_no": "+91-9422785556"},
    {"name": "Avinash patil", "mobile_no": "+91-9125457841"},
    {"name": "tushar patil", "mobile_no": "+91-8992968578"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: Text(
          'My App',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            // fontStyle: FontStyle.italic
          ),
        ),
        backgroundColorStart: Colors.indigo[300],
        backgroundColorEnd: Colors.green[300],
      ),
      body: new Container(
          child: ListView.builder(
              itemCount: students == null ? 0 : students.length,
              itemBuilder: (context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5,
                    margin: EdgeInsets.all(10),
                    color: Colors.lightGreen,
                    child: Container(
                      // mainAxisSize: MainAxisSize.min,
                      child: ListTile(
                          title: Text(
                        "${students[index]["name"]}",
                        style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      )),
                    ),
                  ),
                );
              })),
    );
  }
}
