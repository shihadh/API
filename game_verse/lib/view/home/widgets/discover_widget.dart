import 'package:flutter/material.dart';
import 'package:game_verse/constants/constant.dart';
import 'package:game_verse/controller/game_controller.dart';
import 'package:game_verse/view/Detiels/game_details.dart';
import 'package:game_verse/widget/widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Discover extends StatelessWidget {
  const Discover({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GameController>(
      builder: (context, value, child) {
       if (value.error != null && value.allGames.isEmpty){
                  return Center(
                    child: Text(
                      value.error ?? "No data",
                      style: TextStyle(color: Appcolors.light),
                    ),
                  );
       }
       if (value.allGames.isEmpty) {
              return ShimmerLoading();
          
        }
        return SizedBox(
          height: 180,
          child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      final game = value.allGames[index];
                      return InkWell(

                        borderRadius: BorderRadius.circular(10),
                        onTap:
                            () async{ 
                             await value.extraInfo(game.id.toString());
                              Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GameDetails(gametype: value.allGames,index: index,),
                              ),
                            );},
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 6),
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(
                                game.backgroundImage.toString(),
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: 45,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                  color: const Color.fromARGB(
                                    48,
                                    255,
                                    255,
                                    255,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Text(
                                    game.name.toString(),
                                    style: GoogleFonts.fjallaOne(
                                      color: Appcolors.light,
                                      shadows: [
                                        Shadow(
                                          offset: Offset(1, 1),
                                          blurRadius: 3,
                                          color: Colors.black54,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
        );
      },
    );
  }
}