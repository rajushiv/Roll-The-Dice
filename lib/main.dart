import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/dice.dart';


void main(){
  runApp(const DiceApp());

}

class DiceApp extends StatelessWidget{
  const DiceApp({super.key});
  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title:'Dice Rolling App',
      home:DiceScreen(),
    );
  }

}
class DiceScreen extends StatelessWidget{
  const DiceScreen({super.key});
  @override
  Widget build(BuildContext context){
    return  Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
              colors: [Colors.red,Colors.orangeAccent,Colors.yellow,Colors.blueAccent,Colors.pink,Colors.pinkAccent],
            center: Alignment.center,
            radius: 1.5,
          ),
        ),
        child: const Dice(),
      ),
    );
  }
}