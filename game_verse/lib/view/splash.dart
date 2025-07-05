import 'package:flutter/material.dart';
import 'package:game_verse/controller/game_controller.dart';
import 'package:game_verse/controller/splash_controller.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SplashController splashController;
  @override
  void initState() {
    Provider.of<GameController>(context,listen: false).getFirstGames();
    Provider.of<GameController>(context,listen: false).getDetailes();
    Provider.of<GameController>(context,listen: false).getSecondGames();
    splashController = Provider.of<SplashController>(context, listen: false);
    Provider.of<SplashController>(context, listen: false).splash(context);
    

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Consumer<SplashController>(
          builder: (context, value, child) {
            if (!splashController.videoController.value.isInitialized) {
              return Center();
            }
            return Center(
              child: AspectRatio(
                aspectRatio: splashController.videoController.value.aspectRatio,
                child: VideoPlayer(splashController.videoController),
              ),
            );
          },
        ),
      ),
    );
  }
}
