import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class OnlyImage extends StatefulWidget {
  const OnlyImage({super.key});

  @override
  State<OnlyImage> createState() => _OnlyImageState();
}

class _OnlyImageState extends State<OnlyImage> {
  final player = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
body: Column(
  children: [
    ElevatedButton(
      onPressed: () async {
        try {
          await player.play(AssetSource('mp3/dice_roll.mp3'));
        } catch (e) {
          debugPrint('Audio error → $e');
        }
      },
      child: const Text('Play sound'),
    ),
  ],
),

    );
  }
}