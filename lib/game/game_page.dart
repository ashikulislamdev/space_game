import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/sprite.dart';

class SpaceGame extends FlameGame{
  @override
  Future<void>? onLoad() async {
    await images.load('simpleSpace_tilesheet.png');
    
    final spreadsheet = SpriteSheet.fromColumnsAndRows(
      image: images.fromCache('simpleSpace_tilesheet.png'), 
      columns: 8, 
      rows: 6
    );


    SpriteComponent player = SpriteComponent(
      sprite: spreadsheet.getSpriteById(4),
      size: Vector2(64, 64),
      position: size / 2 
    );

    player.anchor = Anchor.center;
    add(player);

    return super.onLoad();
  }
}