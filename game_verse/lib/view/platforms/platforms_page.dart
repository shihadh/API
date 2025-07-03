import 'package:flutter/material.dart';
import 'package:game_verse/constants/constant.dart';
import 'package:google_fonts/google_fonts.dart';

class PlatformsPage extends StatelessWidget {
  const PlatformsPage({super.key});

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
    );
  }
}