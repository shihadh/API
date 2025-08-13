import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:token/controller/login_controller.dart';
import 'package:token/service/token_manager.dart';
import 'package:token/view/home.dart';
import 'package:token/view/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLogin();
  }

  Future<void> _checkLogin() async {
    final token = await TokenManager.getAccessToken(); 

    await Future.delayed(const Duration(seconds: 1));

    if (token != null && token.isNotEmpty) {
      Provider.of<LoginController>(context,listen: false).getuser();
    await Future.delayed(const Duration(seconds: 1));

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
