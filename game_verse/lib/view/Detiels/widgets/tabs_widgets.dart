import 'package:flutter/material.dart';
import 'package:game_verse/constants/constant.dart';
import 'package:game_verse/controller/game_controller.dart';

class TabsWidgets extends StatelessWidget {
  final List<dynamic>gametype;
  final int idIndex;
  final GameController value;

  const TabsWidgets({super.key, required this.gametype, required this.idIndex, required this.value});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 2,
      length: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Appcolors.blue,
            labelColor: Appcolors.light,
            tabs: const [
              Tab(child: Text("About")),
              Tab(child: Text("ScreenShots")),
              Tab(child: Text("Requirements")),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 200,
            child: TabBarView(
              children: [
                SingleChildScrollView(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    value.extradetaiels?.description ??
                        "No description available",
                    style: TextStyle(color: Appcolors.light, height: 1.5),
                  ),
                ),

                gametype[idIndex].shortScreenshots == null ||
                        gametype[idIndex].shortScreenshots!.isEmpty
                    ? Center(
                      child: Text(
                        "No screenshots available",
                        style: TextStyle(color: Appcolors.light),
                      ),
                    )
                    : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          gametype[idIndex].shortScreenshots!.length,
                      itemBuilder:
                          (context, index) => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  
                                      gametype[idIndex]
                                      .shortScreenshots![index],
                                ),
                              ),
                            ),
                          ),
                    ),

                ListView(
                  padding: const EdgeInsets.all(8),
                  children: [
                    Text(
                      "Minimum:",
                      style: TextStyle(
                        color: Appcolors.light,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      value.extradetaiels?.minimum ?? "Not available",
                      style: TextStyle(color: Appcolors.light),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Recommended:",
                      style: TextStyle(
                        color: Appcolors.light,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      value.extradetaiels?.maximum ?? "Not available",
                      style: TextStyle(color: Appcolors.light),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
