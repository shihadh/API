import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:todo/model/todo_model.dart';

class TodoService {

  Dio dio=Dio(
    BaseOptions(
      connectTimeout: Duration(seconds: 3),
      receiveTimeout: Duration(seconds: 3)
    )
  );
  String baseurl="https://684bc121ed2578be881c555f.mockapi.io/todos";

  Future<List<TodoModel>>getTodo()async{
    
    try{
      var responce = await dio.get(baseurl);
      if(responce.statusCode ==200){
        List data =responce.data;
        return data.map((e)=>TodoModel.fromJson(e)).toList();
    }else{
      throw Exception("error to fatch data");
    }
    }
    catch (e){
      log("faild to get data");
      throw Exception(e);
    }
  }

  Future<TodoModel?> addTodo(TodoModel todo)async{
  try{
    var data = todo.toJson();
    var responce =await dio.post(baseurl,data: data);
    if(responce.statusCode ==201){
      log("data  add successful${data}");
          return TodoModel.fromJson(responce.data);

    }
    else{
      log("data added faild ${responce.statusCode}");
      return null;
    }
  }catch(e){
    log("error in addtodo $e");
    throw Exception(e);
  }
}
  Future updateTodo(TodoModel todo,String id)async{
    log("update");
    try{
      var data =todo.toJson();
       await dio.put("$baseurl/$id",data: data);
       log("updateSuccess ${todo}");
    }catch(e){
      log("faild update $e");
      throw Exception(e);
    }
  }

  Future deleteTodo(id)async{
    try{
      await dio.delete("$baseurl/$id");
      log("delete success $id");
    }catch(e){
      log("faild to delete $e");
      throw Exception(e);
    }
  }

  Future<bool> status()async{
    var stat = await dio.get(baseurl);
    return stat.data['completed'];
  }

}