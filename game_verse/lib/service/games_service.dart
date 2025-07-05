import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:game_verse/model/games_model.dart';

class GamesService {
  Dio dio =Dio();

  Future<List<GamesModel>> fetchgames(int id)async{
  String url="https://api.rawg.io/api/games?key=25935b8a68e44bfc9538e3ecbf59ce89&platforms=$id&page_size=10";

    try{
      List<GamesModel>all=[];
      int pageCount =0;
       const int maxPages = 2;
        while(url != null && pageCount<maxPages){
          var response =await dio.get(url);
          if(response.statusCode == 200){
          List data = response.data['results'];
          all.addAll(data.map((e)=>GamesModel.fromJson(e)).toList());
           final nexturl = response.data['next'];
           if(nexturl == null || nexturl == url){
            break;
           }
           url =nexturl;
           pageCount++;
        }else{
        throw Exception("faild to fech data");
      } 
      }

      return all;
    }catch(e){
      log("faild to fetch");
      throw Exception(e);
    }
   
    
  }
}