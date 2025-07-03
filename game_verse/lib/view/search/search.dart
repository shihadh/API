import 'package:flutter/material.dart';
import 'package:game_verse/constants/constant.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.dark,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
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
            ],
          ),
        ),
      ),
    );
  }
}