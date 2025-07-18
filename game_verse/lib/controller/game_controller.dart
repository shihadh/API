import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:game_verse/model/extra_info_model.dart';
import 'package:game_verse/model/new_game_model.dart';
import 'package:game_verse/model/games_model.dart';
import 'package:game_verse/service/extra_info_service.dart';
import 'package:game_verse/service/new_game_service.dart';
import 'package:game_verse/service/games_service.dart';
import 'package:game_verse/view/home/home.dart';
import 'package:game_verse/view/platforms/platforms_page.dart';
import 'package:game_verse/view/search/search.dart';

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
  List<GamesModel> filteredGames=[];
  ExtraInfoModel? extradetaiels;
  NewGameService gameService =NewGameService();
  GamesService gamesService =GamesService();
  ExtraInfoService extraInfoService =ExtraInfoService();
  String? error;
  int currentIndex = 0;
  TextEditingController searchcontroller = TextEditingController();
  final List<Widget> pages = [
    HomePage(),
    SearchPage(),
    PlatformsPage(),
  ];

void getFirstGames() async {
  try {
    error = null;

    final results = await Future.wait([
      gamesService.fetchgames(4),   // PC
      gamesService.fetchgames(187), // PlayStation 5
      gamesService.fetchgames(1),   // Xbox One
    ]);

    pcGames = results[0];
    playStation5Games = results[1];
    xBoxGames = results[2];

    allGames = [...playStation5Games, ...pcGames, ...xBoxGames];
    randomallGames = [...allGames]..shuffle();

    notifyListeners();

  } catch (e) {
    error = e.toString();
    notifyListeners();
  }
}

void getSecondGames()async{
  await Future.delayed(Duration(seconds: 5));
  var ps4 =  await gamesService.fetchgames(18); // PlayStation 4
  var mob = await gamesService.fetchgames(21);  // Android
  var os = await gamesService.fetchgames(3);   // iOS
    playStation4Games = ps4;
    androidGames =mob;
    iOSGames= os;
    notifyListeners();
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
  Future<void> extraInfo(String id)async{
    error =null;
  try{
  final data =await extraInfoService.extraInfo(id);
  extradetaiels =data;
  notifyListeners();
  }
  catch(e){
    error =e.toString();
    notifyListeners();
  }
}

void changeIndex(int val){
  currentIndex = val;
  notifyListeners();
}

void search(String text) {
  if (text.isEmpty) {
    filteredGames = [];
  } else {
    filteredGames = allGames
        .where((game) =>
            game.name!.toLowerCase().contains(text.toLowerCase()))
        .toList();
  }
  notifyListeners();
}

}

