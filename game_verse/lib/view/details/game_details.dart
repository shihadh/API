import 'package:flutter/material.dart';
import 'package:game_verse/controller/game_controller.dart';
import 'package:game_verse/util/constant.dart';
import 'package:provider/provider.dart';

class GameDetails extends StatelessWidget {
  final int index;
  const GameDetails({super.key,required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppTexts.discovertitle),
      ),
      body: Center(
        child: Consumer<GameController>( 
          builder: (context, value, child) {

            if(value.error != null && value.allGames.isEmpty){
              return Center(child: Text(value.error ?? "no data"),);
            }
           return ListView(
            children: [ 
              SizedBox(
                height: 100,
                width: 100,
                child: Image.network(value.allGames[index].backgroundImage.toString()))
            ],
          );
            
          },
        ),
      ),
    );
  }
}