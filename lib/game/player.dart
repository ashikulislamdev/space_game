import 'package:flame/components.dart';

//this class represent the player player character of the game
class Player extends SpriteComponent{

  //just used for getting the direction 
  Vector2 _moveDirection = Vector2.zero();
  //move speed of the player
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

  //this method is called by game class for every frame
  @override
  void update(double dt) {
    super.update(dt);
    position += _moveDirection.normalized() * _speed * dt;
  }

  //move the player currentDirection to newDirection
  void setMoveDirection(Vector2 newMoveDirection){
    _moveDirection = newMoveDirection;
  }
}