import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class DiceApp extends StatefulWidget {
  const DiceApp({super.key});

  @override
  State<DiceApp> createState() => _DiceAppState();
}

class _DiceAppState extends State<DiceApp> {
  int dicenumber = 6;
  final player = AudioPlayer();
    void rolldice() async{
      await player.seek(Duration.zero); 
      await player.resume(); 
      await player.play(AssetSource('mp3/glass-break-316720.mp3'));
      setState(() {
        dicenumber = Random().nextInt(6)+1;
      });
    }
  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
      backgroundColor: Colors.limeAccent,
      appBar: AppBar(
        title: Text('dice roller'.toUpperCase(),style: TextStyle(color: Colors.red),),
        centerTitle: true,
        backgroundColor: Colors.indigo
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ 
            AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              transitionBuilder: (child, animation) {
                return ScaleTransition(scale: animation,
                child: child,);
              },
              child: Image.asset('assets/$dicenumber.png',
              width:300 ,
              height: 300,
             key: ValueKey(dicenumber),
              errorBuilder:(context, error, stackTrace) {
                return Text('image not found',    
                  style:
                   TextStyle(color: Colors.red, fontSize: 16),);
              },
              fit: BoxFit.cover,),
            ),
            
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: rolldice,
             child: Text('Roll'
             ,style:
                 TextStyle(color: Colors.red, fontSize: 16)),)
          ],
        ),
      ),
    );
  }
}

