import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:game_verse/controller/game_controller.dart';
import 'package:game_verse/constants/constant.dart';
import 'package:game_verse/view/gridView/grid_view_page.dart';
import 'package:game_verse/widget/widget.dart';
import 'package:game_verse/view/Detiels/game_details.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SliderImage extends StatelessWidget {
  const SliderImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 10,
      itemBuilder: (context, index, realIndex) {
        return Consumer<GameController>(
          builder: (context, value, child) {
            if (value.error != null && value.randomallGames.isEmpty) {
              log("list is empty");
              return Text(
                value.error ?? "error",
                style: TextStyle(color: Appcolors.light),
              );
            }
            if (value.randomallGames.isEmpty) {
              return ShimmerLoading();
            }
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Appcolors.light,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    value.randomallGames[index].backgroundImage.toString(),
                  ),
                ),
              ),
              height: 200,
              width: double.infinity,
              child: Center(
                child: Text(
                  value.randomallGames[index].name!,
                  style: GoogleFonts.fjallaOne(
                    color: Appcolors.light,
                    shadows: [
                      Shadow(
                        offset: Offset(1, 1),
                        blurRadius: 3,
                        color: Colors.black54,
                      ),
                    ],
                    fontSize: 25,
                  ),
                ),
              ),
            );
          },
        );
      },
      options: CarouselOptions(
        enlargeCenterPage: true,
        // autoPlayCurve: Curves.easeInOut,
        pageSnapping: true,
        aspectRatio: 2.0,
        initialPage: 2,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 5),
        autoPlayAnimationDuration: Duration(seconds: 2),
        viewportFraction: 0.85,
      ),
    );
  }
}

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

Text titleText(GameController value, int index) => Text(
  value.newGames[index].released.toString(),
  style: GoogleFonts.fjallaOne(color: Appcolors.light),
);

Row headlines({required String title, required BuildContext context, required navigate}) {
  return Row(
    children: [
      GestureDetector(
        onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => GridViewPage(games: navigate),));
          
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: GoogleFonts.orbitron(fontSize: 20, color: Appcolors.light),
            ),
            Icon(Icons.arrow_forward_ios_sharp, color: Appcolors.light, size: 20),
          ],
        ),
      ),
    ],
  );
}
