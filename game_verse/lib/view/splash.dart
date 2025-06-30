import 'package:flutter/material.dart';
import 'package:game_verse/controller/game_controller.dart';
import 'package:game_verse/view/home/home.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Provider.of<GameController>(context,listen: false).getDetailes();

    splash(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset("images/splash.png",height: 250,width: 250,),
      ),
    );
  }
}

Future<void> splash(context)async{
  await Future.delayed(Duration(seconds: 4));
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
}