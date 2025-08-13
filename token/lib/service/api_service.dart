import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:token/model/user_model.dart';
import 'package:token/service/token_manager.dart';

class ApiService {

  static const  String url = "https://dummyjson.com/auth";
  static final Dio dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    baseUrl: url
    ));

  static void init(){
    dio.interceptors.add(InterceptorsWrapper(
      onRequest:  (options, handler) async{
        final token = await TokenManager.getAccessToken();
        if(token != null){
          options.headers['Authorization'] = 'Bearer $token';
        }return handler.next(options);
      },
      onError: (error, handler) async{
        if(error.response?.statusCode == 401){
          final newToken = await refreshToken();
          if(newToken != null){
            error.requestOptions.headers['Authorization'] = "Bearer $newToken";
            final cloneReq = await dio.fetch(error.requestOptions);
            return handler.resolve(cloneReq);
          }
        }
        return handler.next(error);
      },
    ));
  }

  static Future<Response> get(String endpoint,{Map<String,dynamic>? query}){
    return dio.get(endpoint, queryParameters: query);
  }

  static Future<Response> post(String endpoint, {dynamic data}){
    return dio.post(endpoint,data: data);
  }

  Future<(UserModel?,String?)>fetchData()async{
    try{
      final response = await get('/me');
      if(response.statusCode == 200){
        var data = UserModel.fromjson(response.data);
        return (data,null);
      }else{
        log('faild to feach');
        return (null,'faild to feach');
      }
    }on DioException catch(e){
      log(e.toString());
      return(null,e.toString());
    }
  }

  static Future<String?>refreshToken()async{
    final token = await TokenManager.getRefreshToken();
    if(token == null) return null;
    
    try{
      final response = await dio.post('/refresh', data: {'refreshToken' : token});
      if(response.statusCode == 200){
        final newAccessToken = response.data['accessToken'];
        final newRefreshToken = response.data['refreshToken'];
        await TokenManager.saveToken(newAccessToken, newRefreshToken);
        return newAccessToken;
      }
      return null;

    }catch(e){
      log(e.toString());

      await TokenManager.clearToken();
      return null;

    }
  }
}