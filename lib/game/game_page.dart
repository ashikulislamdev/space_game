import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:space_shot/game/player.dart';

class SpaceGame extends FlameGame with PanDetector{
  late Player player;
  Offset? _pointerStartPosition;
  Offset? _pointerCurrentPosition;
  final double _joyStickRadius = 60;
  final double _redZoneRadius = 10;

  @override
  Future<void>? onLoad() async {
    await images.load('simpleSpace_tilesheet.png');
    final spreadsheet = SpriteSheet.fromColumnsAndRows(
      image: images.fromCache('simpleSpace_tilesheet.png'), 
      columns: 8, 
      rows: 6
    );
    player = Player(
      newSprite: spreadsheet.getSpriteById(4),
      newSize: Vector2(64, 64),
      newPosition: size / 2 
    );
    
    player.anchor = Anchor.center;

    add(player);
    return super.onLoad();
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    if (_pointerStartPosition != null) {
      canvas.drawCircle(
        _pointerStartPosition!, 
        60,
        Paint()..color = Colors.grey.withAlpha(100)
      );
    }

    if (_pointerCurrentPosition != null) {
      var delta = _pointerCurrentPosition! - _pointerStartPosition!;

      if (delta.distance > _joyStickRadius) {
        delta = _pointerStartPosition! + (Vector2(delta.dx, delta.dy).normalized() * _joyStickRadius ).toOffset();
      }else{
        delta = _pointerCurrentPosition!;
      }

      canvas.drawCircle(delta, 10, Paint()..color = Colors.grey);
    }
  }

  @override
  void onPanStart(DragStartInfo info) {
    _pointerStartPosition = _pointerStartPosition = info.eventPosition.global.toOffset();
    _pointerCurrentPosition = _pointerCurrentPosition = info.eventPosition.global.toOffset();
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    _pointerCurrentPosition = info.eventPosition.global.toOffset();

    var delta = _pointerCurrentPosition! - _pointerStartPosition!;

    if (delta.distance > _redZoneRadius) {
      player.setMoveDirection(Vector2(delta.dx, delta.dy));
    }else{
      player.setMoveDirection(Vector2.zero());
    }
  }

  @override
  void onPanEnd(DragEndInfo info) {
    _pointerStartPosition = null;
    _pointerCurrentPosition = null;
    player.setMoveDirection(Vector2.zero());
  }
  @override
  void onPanCancel() {
    _pointerStartPosition = null;
    _pointerCurrentPosition = null;
    player.setMoveDirection(Vector2.zero());
  }
}