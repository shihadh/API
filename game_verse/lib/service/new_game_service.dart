import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:game_verse/model/new_game_model.dart';

class NewGameService {

  Dio dio =Dio();
  Future<(List<NewGameModel>?,String?)> fetchNewData(String from,String to)async{
  String baseurl ="https://api.rawg.io/api/games?key=25935b8a68e44bfc9538e3ecbf59ce89&dates=$from,$to&platforms=187,186,4";

    log("upcoming");
    try{
      var response = await dio.get(baseurl);
      if(response.statusCode == 200){
        List datas = response.data['results'];
        final data = datas.map((e)=>NewGameModel.fromJson(e)).toList();
        log(data.toString());
        return (data,null);
      }
      else{
        log("else");
        return (null,"faild to data fetched");
      }

    }catch(e){
      return (null,"faild to data fetched");
      
    }
  }
}