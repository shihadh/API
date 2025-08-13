import 'package:flutter/material.dart';
import 'package:token/model/user_model.dart';
import 'package:token/service/api_service.dart';
import 'package:token/service/auth_service.dart';
import 'package:token/view/home.dart';
import 'package:token/view/login.dart';

class LoginController extends ChangeNotifier{

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthService authservice = AuthService();
  ApiService apiService = ApiService();
  UserModel? user;
  String? errors;

  void login(BuildContext context)async{
    errors =null;
    if(usernameController.text.isNotEmpty && passwordController.text.isNotEmpty){
      var (data, error) = await authservice.login(usernameController.text.trim(), passwordController.text.trim());
    if(error != null){
      errors= error;
    }
    if(data != null){
      user = data;
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
    }
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("enter username and password")));
    }
    notifyListeners();
  }

  void getuser()async{
    var (data,error) = await apiService.fetchData();
    if(error != null){
      errors= error;
    }
    if(data != null){
      user = data;
    }
    notifyListeners();
  }

  void logout(BuildContext context)async{
    errors = null;
    var(stats, error)= await authservice.logout();
    if(error != null){
      errors= error;
    }
    if(stats == true){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage(),), (route) => false,); 
    }
    notifyListeners();
  }
}