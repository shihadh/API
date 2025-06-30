import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:game_verse/model/new_game_model.dart';
import 'package:game_verse/model/games_model.dart';
import 'package:game_verse/service/new_game_service.dart';
import 'package:game_verse/service/games_service.dart';

class GameController extends ChangeNotifier{
  List<NewGameModel> upComingGames =[];
  List<NewGameModel> newGames =[];
  List<GamesModel> pcGames=[];
  List<GamesModel> xBoxGames=[];
  List<GamesModel> androidGames=[];
  List<GamesModel> iOSGames=[];
  List<GamesModel> playStation5Games =[];
  List<GamesModel> playStation4Games =[];
  List<GamesModel> allGames=[];
  List<GamesModel> randomallGames=[];
  NewGameService gameService =NewGameService();
  GamesService gamesService =GamesService();
  String? error;

void getFirstGames() async {
  try {
    error = null;

    final results = await Future.wait([
      gamesService.fetchgames(4),   // PC
      gamesService.fetchgames(187), // PlayStation 5
      // gamesService.fetchgames(18),  // PlayStation 4
      gamesService.fetchgames(1),   // Xbox One
      // gamesService.fetchgames(21),  // Android
      // gamesService.fetchgames(3),   // iOS
    ]);

    pcGames = results[0];
    playStation5Games = results[1];
    // playStation4Games = results[2];
    xBoxGames = results[2];
    // androidGames = results[4];
    // iOSGames = results[5];

    allGames = [...playStation5Games, ...pcGames, ...xBoxGames];
    randomallGames = [...allGames]..shuffle();

    notifyListeners();
  } catch (e) {
    error = e.toString();
    notifyListeners();
  }
}



  void getDetailes()async{ // for upcpming
    try{
      final (upcoming,errors1) =await gameService.fetchNewData("2025-07-01","2025-12-31");
      upComingGames = upcoming!;
      final (newgame,errors2) =await gameService.fetchNewData("2025-05-01","2025-06-30");
      newGames=newgame!;
      notifyListeners();
    }catch(e){
      log("fetch data error");
      error = e.toString();
    }   
  }
}