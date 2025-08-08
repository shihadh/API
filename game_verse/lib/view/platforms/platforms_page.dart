import 'package:flutter/material.dart';
import 'package:game_verse/constants/assets_constant.dart';
import 'package:game_verse/constants/text_constant.dart';
import 'package:game_verse/controller/game_controller.dart';
import 'package:game_verse/controller/platform_controller.dart';
import 'package:game_verse/view/platforms/widgets/card_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:game_verse/constants/color_constant.dart';

class PlatformsPage extends StatelessWidget {
  const PlatformsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final gameController = context.watch<GameController>();

List<dynamic> getGamesByKey(String key) {
  switch (key) {
    case "pc":
      return gameController.pcGames;
    case "ps5":
      return gameController.playStation5Games;
    case "ps4":
      return gameController.playStation4Games;
    case "xbox":
      return gameController.xBoxGames;
    case "android":
      return gameController.androidGames;
    case "ios":
      return gameController.iOSGames;
    default:
      return [];
  }
}

    return Scaffold(
      backgroundColor: Appcolors.dark,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Appcolors.light),
        backgroundColor: Appcolors.dark,
        leading: Image.asset(AssetsConstant.logo),
        centerTitle: true,
        title: Text(AppTexts.appName,style: GoogleFonts.fjallaOne(
          color: Appcolors.light,)),
        actions: [
          Icon(Icons.notifications_none_outlined)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<PlatformController>(
          builder: (context, value, child) => GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 3 / 4,
            children: value.platforms.map((platform) {
              return buildPlatformCard(
                title: platform['title'],
                imageUrl: platform['image'],
                context: context,
                gamesList: getGamesByKey(platform['key'])
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}