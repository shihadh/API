import 'dart:developer';

import 'package:cart/model/cart_model.dart';
import 'package:cart/service/cart_service.dart';
import 'package:flutter/material.dart';

class CartController extends ChangeNotifier{

  String? error;
  List<CartModel> datas = [];
  CartService cartservice = CartService();

  void fetchadata()async{
    var (data,errors)= await cartservice.fetch();
    if(errors != null){
      error = errors;
    }
    if(data != null){
      datas = data;
      log("$datas");
    }
    notifyListeners();
  }
}