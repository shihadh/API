import 'package:flutter/material.dart';
import 'package:game_verse/controller/game_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:game_verse/constants/color_constant.dart';

import 'package:provider/provider.dart';

Text heading({
    required String title,
    required double size
  }) => Text(title,style: GoogleFonts.yanoneKaffeesatz(color: Appcolors.light,fontSize: size),);


  class Platforms extends StatelessWidget {
    final int index;
  const Platforms({super.key,required this.index});

  @override
  Widget build(BuildContext context) {
    return Consumer<GameController>(builder: (context, value, child) {
      return Wrap(
                        spacing: 5,
                        runSpacing: 5,
                        children:
                            (value.allGames[index].platforms ?? []).map((
                              platfotm,
                            ) {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.blueGrey.shade700,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Text(
                                    platfotm,
                                    style: TextStyle(
                                      color: Appcolors.light,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                      );}
    );
  }
}