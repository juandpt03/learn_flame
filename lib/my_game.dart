import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learn_flame/main.dart';
import 'package:learn_flame/routes.dart';

final screenSize = Vector2(1280, 720);
final worldSize = Vector2(12.8, 7.2);

class MyGame extends Forge2DGame with KeyboardEvents {
  MyGame() : super(gravity: Vector2(0, 15.0), zoom: 100);

  final totalBodies = TextComponent(position: Vector2(5, 690));
  final fps = FpsTextComponent(position: Vector2(5, 665));

  @override
  FutureOr<void> onLoad() {
    camera = CameraComponent.withFixedResolution(
        width: screenSize.x, height: screenSize.y);

    add(_Background(size: screenSize));
    add(totalBodies);
    add(fps);
  }

  @override
  void update(double dt) {
    super.update(dt);

    totalBodies.text = "Bodies: ${world.children.length}";
  }

  @override
  KeyEventResult onKeyEvent(
      KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    if (event is KeyDownEvent) {
      if (keysPressed.contains(LogicalKeyboardKey.space)) {
        navigatorKey.currentState
            ?.pushNamedAndRemoveUntil(Routes.menu, (route) => false);
        return KeyEventResult.handled;
      }
    }
    return KeyEventResult.ignored;
  }

  @override
  Color backgroundColor() {
    return Colors.greenAccent;
  }
}

class _Background extends PositionComponent {
  _Background({
    super.size,
  });

  @override
  void render(Canvas canvas) {
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.x, size.y),
      BasicPalette.blue.paint(),
    );
  }
}

class MyGameWidget extends StatelessWidget {
  final MyGame game;
  const MyGameWidget({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            navigatorKey.currentState
                ?.pushNamedAndRemoveUntil(Routes.menu, (route) => false);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: GameWidget(game: game),
    );
  }
}
