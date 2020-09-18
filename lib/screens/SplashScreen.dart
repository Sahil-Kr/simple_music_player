import 'dart:async';
import 'package:flutter/material.dart';
import 'package:yourstory_assignment/common/CommonFields.dart';
import 'package:yourstory_assignment/screens/MainScreen.dart';
import 'package:yourstory_assignment/values/Constants.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  //method to start timer for automatically call of navigationPage method
  startTime() async {
    var _duration = new Duration(seconds: 1);
    return new Timer(_duration, navigationPage);
  }

  //method to navigate to the Main Screen
  void navigationPage() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (BuildContext ctx) {
      return MainScreen();
    }));
  }

  @override
  void initState() {
    super.initState();
    startTime(); // start timer on initialisation
  }

  //build method to display splash screen UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextView(
                title:YOURSTORY,
                fontColor: Color.fromRGBO(218, 0, 0, 0.9),
                fontWeight: FontWeight.bold,
                fontSize: 35
              ),
              TextView(
                  title: ASSIGNMENT,
                  fontColor:Colors.white,
                  fontSize: 24
              ),
            ],
          ),
        ),
      ),
    );
  }
}
