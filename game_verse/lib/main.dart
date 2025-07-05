import 'package:flutter/material.dart';
import 'package:game_verse/controller/game_controller.dart';
import 'package:game_verse/controller/platform_controller.dart';
import 'package:game_verse/controller/splash_controller.dart';
import 'package:game_verse/view/splash.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => GameController(),),
      ChangeNotifierProvider(create: (context) => PlatformController(),),
      ChangeNotifierProvider(create: (context) => SplashController(),)
    ]
    ,child: MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
    );
  }
}