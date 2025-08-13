import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:token/model/user_model.dart';
import 'package:token/service/api_service.dart';
import 'package:token/service/token_manager.dart';

class AuthService {
  String endpoint = "/login";
   Future<(UserModel?,String?)>login(String username, String password)async{
    try{

    final response = await ApiService.post(endpoint, data: { 'username' : username, 'password': password});
    if(response.statusCode == 200){
    
    await TokenManager.saveToken(response.data['accessToken'], response.data['refreshToken']);
    final data = UserModel.fromjson(response.data);

  
    log("${data.accessToken}");
    log("${data.refreshToken}");
    log(response.data.toString());
    return (data,null);
    }
    else{
      return (null,'faild to fetch data');
    }
    
    }on DioException catch(e){
      log(e.toString());
      return (null,e.toString());
    }

  }

  Future<(bool,String?)>logout()async{
    try{
      await TokenManager.clearToken();
      return(true,null);
    }catch(e){
      return (false,e.toString());
    }
    
  }
}