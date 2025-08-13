import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:token/controller/login_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<LoginController>(
          builder: (context, value, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("name"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(value.user?.firstName ?? 'no data'),
                  Text(value.user?.lastName ?? 'no data'),
                  
                ],
                
              ),
              ElevatedButton(onPressed: (){
                value.logout(context);
              }, child: Text("logout"))
            ],
          );
          },
        ),
      ),
    );
  }
}