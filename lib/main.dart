import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:space_shot/game/game_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  //open the app in fullScreen mode
  Flame.device.fullScreen();
  
  //widget of any class extending from flame game class 
  runApp(
    GameWidget(game: SpaceGame())
  );
}
