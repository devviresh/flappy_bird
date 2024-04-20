import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flappy_bird/components/background.dart';
import 'package:flappy_bird/components/bird.dart';
import 'package:flappy_bird/components/ground.dart';
import 'package:flappy_bird/components/pipe_group.dart';
import 'package:flappy_bird/game/configuration.dart';
import 'package:flutter/painting.dart';

import '../components/clouds.dart';

class FlappyBird extends FlameGame
    with TapDetector, LongPressDetector, HasCollisionDetection {
  FlappyBird();

  late Bird bird;
  Timer interval = Timer(Config.pipeInterval, repeat: true);
  bool isHit = false;
  late TextComponent score;

  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground(),
      Clouds(),
      bird = Bird(),
      score = buildScore(),
    ]);

    interval.onTick = () => add(PipeGroup());
  }

  TextComponent buildScore() {
    return TextComponent(
        position: Vector2(size.x / 2, size.y / 2 * 0.2),
        anchor: Anchor.center,
        textRenderer: TextPaint(
          style: const TextStyle(
              fontSize: 40, fontFamily: 'Game', fontWeight: FontWeight.bold),
        ));
  }

  @override
  void onTap() {
    bird.fly();
  }

  @override
  void onLongPress() {
    bird.fall();
  }

  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);
    score.text = 'Score: ${bird.score}';
  }
}
