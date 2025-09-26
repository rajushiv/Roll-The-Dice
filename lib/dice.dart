
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Dice extends StatefulWidget{
  const Dice({super.key});
  @override
  State<Dice> createState(){
    return _DiceState();

  }


}

class _DiceState extends State<Dice>{

  int leftDice = 1;
  int rightDice = 1;
  void rollDice(){
    setState(() {
      leftDice = Random().nextInt(6)+1;
      rightDice= Random().nextInt(6)+1;

    });

  }

  @override
  Widget build(BuildContext context){
    return Column(
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
            margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 30),
            padding:  const EdgeInsets.all(40),
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/dice$leftDice.png',width:100,height:100,),

                Image.asset('assets/dice$rightDice.png',width:80,height:80,),

              ],

            ),
          ),


          ElevatedButton(
            onPressed:rollDice ,
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                backgroundColor: Colors.orangeAccent,
                shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                shadowColor: Colors.black38,
                elevation: 10
            ),
            child: const Text('Roll Dice',style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.pinkAccent,
            ),),

          ),

        ],
      ) ;

  }

}