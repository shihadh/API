import 'package:flutter/material.dart';
import 'package:game_verse/controller/game_controller.dart';
import 'package:game_verse/util/constant.dart';
import 'package:game_verse/view/home/home_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
     Provider.of<GameController>(context,listen: false).getFirstGames();
    Provider.of<GameController>(context,listen: false).getDetailes();
   
    super.initState();
  }
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
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(29, 230, 233, 234),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)

                  )
                ),
              ),
              AppWidgets.gap,
              
             Column(
               children: [
                SliderImage()
               ],
             ),
             AppWidgets.gap,
             headlines(title: AppTexts.discover),
             AppWidgets.gap,
             Discover(),
             AppWidgets.gap,
             headlines(title: AppTexts.upcoming),
             AppWidgets.gap,
             Upcoming(),
             AppWidgets.gap,
             headlines(title: AppTexts.newgame),
             AppWidgets.gap,
             NewRelease()         
            ],
          ),
        ),
      ),
    );
  }
}