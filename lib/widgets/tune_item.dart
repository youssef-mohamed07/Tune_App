// lib/widgets/tune_item.dart
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class TuneItem extends StatelessWidget {
  final Color color;
  final String sound;

  const TuneItem({
    super.key,
    required this.color,
    required this.sound,
  });

  void playSound() async {
    try {
      final player = AudioPlayer();
      await player.play(AssetSource(sound));
      print('🎶 Playing: $sound');
    } catch (e) {
      print('❌ Error playing $sound: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: playSound,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [color.withOpacity(0.9), color.withOpacity(0.7)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.4),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: const Center(
          child: Icon(
            Icons.music_note_rounded,
            size: 40,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
