import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yourstory_assignment/bloc/NavigationBloc.dart';
import 'package:yourstory_assignment/screens/SplashScreen.dart';

void main() {
  runApp(BlocProvider<NavigationBloc>(
    create: (BuildContext context) => NavigationBloc(0),
    child: MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YourStory Assignment',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'VarelaRound',
      ),
      home: SplashScreen(),
    );
  }
}
