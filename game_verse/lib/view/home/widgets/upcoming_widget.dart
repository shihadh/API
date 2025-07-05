import 'package:flutter/material.dart';
import 'package:game_verse/constants/constant.dart';
import 'package:game_verse/controller/game_controller.dart';
import 'package:game_verse/view/Detiels/game_details.dart';
import 'package:game_verse/widget/widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Upcoming extends StatelessWidget {
  const Upcoming({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GameController>(
      builder: (context, value, child) {
        if (value.error != null && value.upComingGames.isEmpty) {
          return Center(
            child: Text(
              value.error ?? "No data",
              style: TextStyle(color: Appcolors.light),
            ),
          );
        }
        if (value.upComingGames.isEmpty) {
           return ShimmerLoading();

        }

        return SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 7,
            itemBuilder: (context, index) {
              final game = value.upComingGames[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () async{
                        await value.extraInfo(game.id.toString());
                              Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GameDetails(gametype: value.upComingGames,index: index,),
                              ),);
                      },
                      child: Container(
                        height: 190,
                        width: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(game.backgroundImage ?? ""),
                            fit: BoxFit.cover,
                            onError: (error, stackTrace) {
                              value.error;
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 4),
                    SizedBox(
                      width: 160,
                      child: Text(
                        game.name ?? "Unknown",
                        style: GoogleFonts.fjallaOne(
                          color: Appcolors.light,
                          fontSize: 14,
                          shadows: [
                            Shadow(
                              offset: Offset(1, 1),
                              blurRadius: 3,
                              color: Colors.black54,
                            ),
                          ],
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}