import 'package:flutter/material.dart';
import 'package:game_verse/controller/game_controller.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GameController>(
      builder: (context, value, child) =>Scaffold(
        body: value.pages[value.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          
          currentIndex: value.currentIndex,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          onTap: (val) {
            value.changeIndex(val);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.videogame_asset),
              label: "Platforms",
            ),
          ],
        ),
      ),
    );
  }
}
