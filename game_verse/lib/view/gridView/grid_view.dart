import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:game_verse/controller/game_controller.dart';
import 'package:game_verse/view/Detiels/game_details.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GameGridView extends StatelessWidget {
  final List<dynamic> games;

  const GameGridView({Key? key, required this.games}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.65,
        ),
        itemCount: games.length,
        itemBuilder: (context, index) {
          final game = games[index];
          final name = game.name ?? "No Name";
          final image = game.backgroundImage ?? "https://via.placeholder.com/150";

          return InkWell(
            onTap: () async {
                await context.read<GameController>().extraInfo(game.id.toString());
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GameDetails(gametype: games,index: index),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.network(
                      image,
                      height: 130,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 130,
                        color: Colors.black26,
                        child: Icon(Icons.broken_image, color: Colors.white),
                      ),
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                          height: 160,
                          color: Colors.black12,
                          child: Center(
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.aBeeZee(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
  }
}
