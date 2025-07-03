import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:game_verse/controller/game_controller.dart';
import 'package:game_verse/constants/constant.dart';
import 'package:game_verse/view/Detiels/widgets/platform_widget.dart';
import 'package:game_verse/view/Detiels/widgets/tabs_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class GameDetails extends StatelessWidget {
  final int index;
  final List<dynamic>gametype;
  const GameDetails({super.key, required this.index,required this.gametype});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.dark,
      appBar: AppBar(
        backgroundColor: Appcolors.dark,
        iconTheme: IconThemeData(color: Appcolors.light),
        centerTitle: true,
        title: Text(
          AppTexts.discovertitle,
          style: GoogleFonts.fjallaOne(color: Appcolors.light, fontSize: 20),
        ),
      ),
      body: Consumer<GameController>(
        builder: (context, value, child) {
          if (value.error != null && gametype.isEmpty) {
            return Center(child: Text(value.error ?? "no data"));
          }
          return ListView(
            children: [
              SizedBox(
                height: 250,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 180,
                          width: MediaQuery.of(context).size.width,
                          child: Image.network(
                            fit: BoxFit.cover,
                            gametype[index].backgroundImage.toString(),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 0,
                      child: Container(
                        height: 180,
                        width: MediaQuery.of(context).size.width,
                        color: const Color.fromARGB(121, 30, 30, 30),
                      ),
                    ),
                    Positioned(
                      top: 110,
                      left: 10,
                      child: Container(
                        height: 140,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              gametype[index].backgroundImage.toString(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      gametype[index].name.toString(),
                      style: GoogleFonts.fjallaOne(
                        color: Appcolors.light,
                        fontSize: 20,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          value.extradetaiels!.developers?[0] ?? "Develepor",
                          style: TextStyle(color: Appcolors.light),
                        ),
                        Text(
                          "Relese Date",
                          style: TextStyle(fontSize: 15, color: Appcolors.light,),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        StarRating(
                          allowHalfRating: true,
                          rating: gametype[index].rating!,
                        ),
                        Text(
                          gametype[index].released.toString(),
                          style: GoogleFonts.aBeeZee(
                            color: Appcolors.light,
                            fontSize: 13
                          ),
                        ),
                      ],
                    ),
                    AppWidgets.gap,
                    Platforms(index: index),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () async {
                            final website = value.extradetaiels?.website;
                        
                            if (website == null || website.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("No website available")),
                              );
                              return;
                            }
                            final url = Uri.parse(
                              website,
                            );
                            if (await canLaunchUrl(url)) {
                              await launchUrl(
                                url,
                                mode: LaunchMode.externalApplication,
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                (SnackBar(content: Text("Unable to open link"))),
                              );
                            }
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.language,
                                color: Colors.blueAccent,
                                size: 30,
                              ),
                              heading(title: "Website", size: 18),
                            ],
                          ),
                        ),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                            backgroundColor: const Color.fromARGB(255, 53, 176, 57)),
                          onPressed: ()async{
                            final link = value.extradetaiels?.link;
                            if (link == null || link.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("No website available")),
                              );
                              return;
                            }
                            final url = Uri.parse(
                              link,
                            );
                            if (await canLaunchUrl(url)) {
                              await launchUrl(
                                url,
                                mode: LaunchMode.externalApplication,
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                (SnackBar(content: Text("Unable to open link"))),
                              );
                            }
                          }, icon: Icon(Icons.play_arrow,color: Appcolors.light,),label: Text("GET",style: TextStyle(color: Appcolors.light),),)
                      ],
                    ),

                    AppWidgets.gap,
                    TabsWidgets(gametype: gametype, idIndex: index,value: value,),
                    AppWidgets.gap,
                    heading(title: "Genres", size: 25),
                    SizedBox(height: 5,),
                    Wrap(
                      spacing: 5,
                      runSpacing: 5,
                      children:
                          (gametype[index].genres ?? []).map<Widget>((genre) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.blueGrey.shade700,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Text(
                                  genre,
                                  style: TextStyle(
                                    color: Appcolors.light,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
