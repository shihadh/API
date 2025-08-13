import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:token/controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<LoginController>(
          builder: (context, value, child) {
            return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: value.usernameController,
                decoration: InputDecoration(
                  hintText: 'usernamae',
                  border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: value.passwordController,
                decoration: InputDecoration(
                  hintText: 'password',
                  border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: (){
                value.login(context);
                if(value.errors !=null){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value.errors!)));  
                }
              }, child: Text("login"))
            ],
          );
          },
        ),
      ),
    );
  }
}