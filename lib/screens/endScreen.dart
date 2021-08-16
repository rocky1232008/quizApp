import 'dart:async';

import 'package:flutter/material.dart';

class endScreen extends StatefulWidget {
  const endScreen({ Key? key, required this.outcome, required this.wrong, required this.skipped}) : super(key: key);

  final outcome;
  final wrong;
  final skipped;

  @override
  _endScreenState createState() => _endScreenState();
}

class _endScreenState extends State<endScreen> {
  Color color = Colors.green;
  Color realColor = Colors.green;
  Timer? timer;
  Color color1 = Colors.blue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.outcome == true){
      realColor = Colors.green;
    }else{
      realColor = Colors.red;
    }
    color = realColor;
    startAnim();
  }
  void startAnim(){
    timer = Timer.periodic((Duration(seconds: 1)), (_) { 
      if(color == realColor){
        setState(() {
          color = color1;
        });
      }else if(color == color1){
        setState(() {
          color = realColor;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: Center(child: Column(
        children: [
          SizedBox(height: 450,),
          widget.outcome == true ? Text('You win!', style: TextStyle(color: color, backgroundColor: Colors.amber, fontSize: 60, fontWeight: FontWeight.w900, fontFamily: 'Sans-Serif'),) : Text('You lose',style: TextStyle(color: color, backgroundColor: Colors.amber, fontSize: 60, fontWeight: FontWeight.w900, fontFamily: 'Sans-Serif')),
          SizedBox(height: 150,),
          Text('You got ${widget.wrong} answers wrong and you skipped ${widget.skipped} questions!', style: TextStyle(color: color, backgroundColor: Colors.amberAccent, fontFamily: 'Sans-Serif', fontSize: 30, fontWeight: FontWeight.bold),)
        ],
      ),),
    );
  }
}