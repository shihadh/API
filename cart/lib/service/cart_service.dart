import 'dart:developer';

import 'package:cart/model/cart_model.dart';
import 'package:dio/dio.dart';

class CartService {
  Dio dio = Dio(BaseOptions(baseUrl: "https://dummyjson.com" ));
  Future<(List<CartModel>?, String?)>fetch()async{
    try{
      log("message");
      final response = await dio.get("/carts");
      if(response.statusCode == 200){
        List data =response.data['carts'];
        final finaldata = data.map((e)=>CartModel.fromjson(e)).toList();
        log("$finaldata");
        return (finaldata,null);

      }else{
        return (null,'faild to fetch');
      }
    }on DioException catch(e){
      return (null,e.toString());
    }
  }
}