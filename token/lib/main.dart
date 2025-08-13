import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:token/controller/login_controller.dart';
import 'package:token/service/api_service.dart';
import 'package:token/view/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ApiService.init();
  runApp(ChangeNotifierProvider(create: (context) => LoginController() ,child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}