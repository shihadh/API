import 'dart:developer';

import 'package:cart/constant/text_constents.dart';
import 'package:cart/model/cart_model.dart';
import 'package:dio/dio.dart';

class CartService {
  Dio dio = Dio(BaseOptions(baseUrl: TextConstents.url));
  Future<(List<CartModel>?, String?)>fetch()async{
    try{
      log("message");
      final response = await dio.get("/carts");
      if(response.statusCode == 200){
        List data =response.data['carts'][0]['products'];
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