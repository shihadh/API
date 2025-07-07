import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:game_verse/controller/game_controller.dart';
import 'package:game_verse/view/gridView/grid_view_page.dart';
import 'package:game_verse/widget/widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:game_verse/constants/color_constant.dart';


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
