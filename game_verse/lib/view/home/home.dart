import 'package:flutter/material.dart';
import 'package:game_verse/constants/widget_constants.dart';
import 'package:game_verse/controller/game_controller.dart';
import 'package:game_verse/constants/text_constant.dart';
import 'package:game_verse/view/home/widgets/discover_widget.dart';
import 'package:game_verse/view/home/widgets/new_release_widget.dart';
import 'package:game_verse/view/home/widgets/sliderimage_widget.dart';
import 'package:game_verse/view/home/widgets/upcoming_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:game_verse/constants/color_constant.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.dark,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Appcolors.light),
        backgroundColor: Appcolors.dark,
        leading: Image.asset("images/logo.png"),
        centerTitle: true,
        title: Text(AppTexts.appName,style: GoogleFonts.fjallaOne(
                            color: Appcolors.light,)),
        actions: [
          Icon(Icons.notifications_none_outlined)
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
             Column(
               children: [
                SliderImage()
               ],
             ),
             AppWidgets.gap,
             headlines(title: AppTexts.discover,context: context,navigate: context.watch<GameController>().allGames,),
             AppWidgets.gap,
             Discover(),
             AppWidgets.gap,
             headlines(title: AppTexts.upcoming,context: context, navigate: context.watch<GameController>().upComingGames,),
             AppWidgets.gap,
             Upcoming(),
             AppWidgets.gap,
             headlines(title: AppTexts.newgame, context: context, navigate: context.watch<GameController>().newGames,),
             AppWidgets.gap,
             NewRelease()         
            ],
          ),
        ),
      ),
    );
  }
}