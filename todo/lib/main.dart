import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/controller/api_controller.dart';
import 'package:todo/controller/filter_controller.dart';
import 'package:todo/views/home/home.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ApiController()),
    ChangeNotifierProxyProvider<ApiController,FilterController>(create: (context) => 
    FilterController(Provider.of<ApiController>(context,listen: false)),
    update: (context, apiController, previous) => FilterController(apiController),)
    ]
    ,child: MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}