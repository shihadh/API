import 'package:flutter/material.dart';
import 'package:game_verse/constants/constant.dart';
import 'package:game_verse/controller/game_controller.dart';
import 'package:game_verse/view/gridView/grid_view.dart';
import 'package:provider/provider.dart';

class GridViewPage extends StatelessWidget {
  final List<dynamic> games;

  const GridViewPage({super.key,required this.games});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  backgroundColor: Appcolors.dark,
  appBar: AppBar(
    iconTheme: IconThemeData(color: Appcolors.light),
    backgroundColor: Appcolors.dark,
    title: Text("All Games", style: TextStyle(color: Colors.white)),
    elevation: 0,
  ),
  body: GameGridView(games: games),
);
  }
}