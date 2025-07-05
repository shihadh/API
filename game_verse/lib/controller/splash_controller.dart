import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:game_verse/view/navigation/navigation.dart';
import 'package:video_player/video_player.dart';

class SplashController extends ChangeNotifier{
  late final VideoPlayerController videoController;
  
  Future<void>splash(context)async{
    videoController = VideoPlayerController.asset("assets/splash.mp4")..initialize().then((_){
    videoController.play();
    notifyListeners();
  });
  log("splash");
  await Future.delayed(Duration(seconds: 10));
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage(),));
  notifyListeners();
}

}