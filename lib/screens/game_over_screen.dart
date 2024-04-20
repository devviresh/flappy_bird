import 'package:flappy_bird/game/assets.dart';
import 'package:flappy_bird/game/flappy_bird.dart';
import 'package:flutter/material.dart';

class GameOverScreen extends StatelessWidget {
  final FlappyBird game;

  const GameOverScreen({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) => Material(
        color: Colors.black38,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Score: ${game.bird.score}',
                style: const TextStyle(
                  fontSize: 60,
                  color: Colors.white,
                  fontFamily: 'Game',
                ),
              ),
              const SizedBox(height: 40),
              Image.asset(Assets.gameOver),
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white24),
                child: ElevatedButton(
                  onPressed: onRestart,
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  child: const Text(
                    'Restart',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  void onRestart() {
    game.bird.reset();
    game.overlays.remove('gameOver');
    // game.overlays.add('mainMenu');
    game.resumeEngine();
  }
}
