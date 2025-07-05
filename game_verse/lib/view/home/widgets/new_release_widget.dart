import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:game_verse/constants/constant.dart';
import 'package:game_verse/controller/game_controller.dart';
import 'package:game_verse/view/Detiels/game_details.dart';
import 'package:game_verse/view/home/widgets/sliderimage_widget.dart';
import 'package:game_verse/widget/widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewRelease extends StatelessWidget {
  const NewRelease({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GameController>(
      builder: (context, value, child) {
        if (value.error != null && value.newGames.isEmpty) {
          return Center(child: Text(value.error ?? "No data"));
        }

        if (value.newGames.isEmpty) {
           return ShimmerLoading();

        }

        return SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: value.newGames.length,
            itemBuilder: (context, index) {
              final game = value.newGames[index];

              return SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(10),
                        onTap:
                            () async{ 
                             await value.extraInfo(game.id.toString());
                              Navigator.push(
                              context,
                              MaterialPageRoute(
                                 builder: (context) => GameDetails(gametype: value.newGames,index: index,),

                              ),
                            );},
                      child: Container(
                        height: 180,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(game.backgroundImage ?? ""),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              game.name ?? "Unknown Game",
                              style: GoogleFonts.fjallaOne(
                                color: Appcolors.light,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            titleText(value, index),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                StarRating(
                                  allowHalfRating: true,
                                  rating: game.rating ?? 0,
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Wrap(
                              spacing: 5,
                              runSpacing: 6,
                              children:
                                  (game.platforms ?? []).map((platform) {
                                    return Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.blueGrey.shade700,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Text(
                                        platform,
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                            ),
                          ],
                        ),
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