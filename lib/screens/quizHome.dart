import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizapp/screens/intenseQuizzing.dart';

class quizHome extends StatefulWidget {
  const quizHome({ Key? key }) : super(key: key);

  @override
  _quizHomeState createState() => _quizHomeState();
}

class _quizHomeState extends State<quizHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            SizedBox(height: 200,),
            Text('The greatest quiz of all time', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 35),),
            SizedBox(
              height: 25,
            ),
            SizedBox(
              height: 100,
              width: 500,
              child: Text('This quiz app was made for fun. This quiz app is a quiz about quizzes and how they are a quiz quiz. Now get quizzing. This app is not being sold, do not claim as own lol. click the start button below to begin. You might have to scroll a bit lol', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,),textAlign: TextAlign.center,)),
            SizedBox(height: 150,),
            GestureDetector(child: Image.asset('assets/fonts/imgs/Logo-Epic-Quiz.jpg', width: 300,), onTap: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => (intenseQuizzing())));},)
          ],),
        ),
      ),
    );
  }
}