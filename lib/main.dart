import 'package:flutter/material.dart';
import 'package:ebpc/screens/main_screen.dart';
import 'package:ebpc/screens/search.dart';

void main() async {

  runApp(EBPC());
}

class EBPC extends StatelessWidget  {

  @override
  Widget build(BuildContext context) {

     return MaterialApp(
        title: 'EBPC',
        theme: ThemeData(
          primarySwatch: Colors.lightGreen,
        ),
        initialRoute: MainScreen.id,
        routes: {
          MainScreen.id: (context) => MainScreen(),
          Search.id: (context) => Search(),
        },
        debugShowCheckedModeBanner: false,
      );
  }
}