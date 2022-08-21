import 'package:flame/components.dart';

class Player extends SpriteComponent{
  Vector2 _moveDirection = Vector2.zero();
  final double _speed = 300;

  Player({
    Sprite? newSprite,
    Vector2? newPosition,
    Vector2? newSize,
  }) : super(
    sprite: newSprite,
    position: newPosition,
    size: newSize,
  );

  @override
  void update(double dt) {
    super.update(dt);
    position += _moveDirection.normalized() * _speed * dt;
  }

  void setMoveDirection(Vector2 newMoveDirection){
    _moveDirection = newMoveDirection;
  }
}