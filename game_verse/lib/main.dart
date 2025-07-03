import 'package:flutter/material.dart';
import 'package:game_verse/controller/game_controller.dart';
import 'package:game_verse/view/home/home.dart';
import 'package:game_verse/view/navigation/navigation.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => GameController(),)
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
        home: MainPage(),
    );
  }
}