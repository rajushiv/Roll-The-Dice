import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const DiceApp());

}

class DiceApp extends StatelessWidget{
  const DiceApp({super.key});
  @override
  Widget build(BuildContext context){
    return const MaterialApp(
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
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          const  Text(
                'Roll the Dice',
              style: TextStyle(
                fontSize: 29,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),

            ),
           const SizedBox(height: 43,),


            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              padding:  const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          borderRadius: BorderRadius.circular(25),
          boxShadow:[
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 15,
              offset: const Offset(4, 4),
            )
          ]

          ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/dice1.png',width: 100,height: 100,),
                  Image.asset('assets/dice2.png',width: 100,height: 100,),
                  Image.asset('assets/dice3.png',width: 100,height: 100,),
                  Image.asset('assets/dice4.png',width: 100,height: 100,),
                  Image.asset('assets/dice5.png',width: 100,height: 100,),
                  Image.asset('assets/dice6.png',width: 100,height: 100,),
                ],
              ),
        ),

            ElevatedButton(
              onPressed: () {
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                backgroundColor: Colors.orangeAccent,
                shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                )
              ),
              child: const Text('Roll Dice'),

            ),

          ],
        ) ,
      ),
    );
  }
}