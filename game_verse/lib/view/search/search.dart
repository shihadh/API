import 'package:flutter/material.dart';
import 'package:game_verse/constants/constant.dart';
import 'package:game_verse/controller/game_controller.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<GameController>().searchcontroller;
    return Scaffold(
      backgroundColor: Appcolors.dark,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                onChanged: (value) {
                  context.read<GameController>().search(value);
                },
                controller: controller,
                style: TextStyle(color: Appcolors.light),
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
                  const SizedBox(height: 16),

            // Search Result List
            Expanded(
              child: Consumer<GameController>(
                builder: (context, value, child) {
                  if (value.filteredGames.isEmpty) {
                    return Center(
                      child: Text(
                        "No games found.",
                        style: TextStyle(color: Appcolors.light),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: value.filteredGames.length,
                    itemBuilder: (context, index) {
                      final game = value.filteredGames[index];
                      return Card(
                        color: Colors.black12,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          leading: Image.network(game.backgroundImage!, width: 60,),
                          title: Text(
                            game.name!,
                            style: TextStyle(color: Appcolors.light),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            ],
          ),
        ),
      ),
    );
  }
}