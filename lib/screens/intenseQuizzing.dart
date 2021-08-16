import 'package:flutter/material.dart';
import 'package:quizapp/data/data.dart';
import 'package:quizapp/screens/endScreen.dart';

class intenseQuizzing extends StatefulWidget {
  const intenseQuizzing({ Key? key }) : super(key: key);

  @override
  _intenseQuizzingState createState() => _intenseQuizzingState();
}

class _intenseQuizzingState extends State<intenseQuizzing> {
  var QuestionNumber = 0;
  var Question = '';
  var answer = '';
  var wrong = true;
  var skipped = 0;
  TextEditingController controller = TextEditingController();
  var amountOfWrong = 0;

  Data data = Data();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Question = data.nextQuestion(index: QuestionNumber - 1);
  }
  
  void checkAnswer(){
    var check = data.check(index: QuestionNumber, answer: controller.text);
    print(check);

    if(check && QuestionNumber + 1 != data.questions.length - 1){
      setState(() {
          Question = data.nextQuestion(index: QuestionNumber);
          QuestionNumber += 1;
          controller.text = '';
      });
    }else if(QuestionNumber + 1 == data.questions.length){
      setState(() {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => endScreen(outcome: wrong, wrong: amountOfWrong, skipped: skipped,)));
      });
    }else if(check == false){
      amountOfWrong += 1;
      setState(() {
        wrong = false;
      });
    }
  }
  void skip(){
    if(QuestionNumber + 1 != data.questions.length){
        setState(() {
          Question = data.nextQuestion(index: QuestionNumber);
          QuestionNumber += 1;
          controller.text = '';
      });
    }else{
      setState(() {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => endScreen(outcome: wrong, wrong: amountOfWrong, skipped: skipped,)));
      });
    }
    
    skipped += 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wrong == true ? Colors.green : Colors.red,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          // Text('This is the quizzing screen, get ready to be interrogated', style: TextStyle(color: Colors.lime, fontSize: 20, fontWeight: FontWeight.w900),),
          Text('Question${QuestionNumber + 1}:', style: TextStyle(color: Colors.lime, fontSize: 50, fontWeight: FontWeight.w900),), Text(' $Question', style: TextStyle(color: Colors.lime, fontSize: 100, fontWeight: FontWeight.w900),),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
            child: Row(children: [
              SizedBox(child: Text('Your answer?? - ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w100),)) ,SizedBox(width: 200,child: TextField(controller: controller, style: TextStyle( fontSize: 16, fontWeight: FontWeight.w100),))
            ],),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(onPressed: skip, child: Text('SKiP', style: TextStyle(color: Colors.brown, fontSize: 15, fontWeight: FontWeight.w100),), style: TextButton.styleFrom(backgroundColor: Colors.amber),),
              SizedBox(width: 150,),
              TextButton(onPressed: checkAnswer, child: Text('NeXT', style: TextStyle(color: Colors.brown, fontSize: 15, fontWeight: FontWeight.w100),), style: TextButton.styleFrom(backgroundColor: Colors.amber),)
            ],
          )
        ],),
      ),
    );
  }
}