import 'package:flutter/material.dart';
import 'package:quizapp/screens/endScreen.dart';
import 'package:quizapp/screens/quizHome.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: quizHome(),
      theme: ThemeData(primarySwatch: Colors.brown),
    );
  }
}