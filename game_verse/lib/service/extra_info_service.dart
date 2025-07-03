import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:game_verse/model/extra_info_model.dart';

class ExtraInfoService {
  Dio dio =Dio();
  Future<ExtraInfoModel> extraInfo(String id)async{
    String url ="https://api.rawg.io/api/games/$id?key=25935b8a68e44bfc9538e3ecbf59ce89";
    
    try{
      var response = await dio.get(url);
      if(response.statusCode == 200){
        var data =response.data;
        log(data.toString());
        final datas = ExtraInfoModel.fromJson(data);
        log(datas.toString());
        return datas;
      }else{
        throw Exception("error on fetching");
      }

    }catch(e){
      throw Exception(e);
    }
  }
}