import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo/controller/api_controller.dart';
import 'package:todo/model/todo_model.dart';
import 'package:todo/utils/constants.dart';

  enum FilterType {all,complete,incomplete}

class FilterController extends ChangeNotifier{
  
  FilterType _filter =FilterType.all;
  String _searchText="";

  FilterType get filter => _filter;
  String get seractText => _searchText;


  set filter(FilterType newfilter){
    _filter =newfilter;
    notifyListeners();
  }

  set searchText(String value){
    _searchText =value.toLowerCase();
    notifyListeners();
  }

  final ApiController apiController;
  FilterController(this.apiController);

  Color btn1Color =AppColor.primary;
  Color btn2Color =AppColor.normal;
  Color btn3Color =AppColor.normal;

  List<TodoModel> get filteredTodos {
    final alltodos =apiController.tododata;

    List<TodoModel> filtered = switch (_filter) {
      FilterType.complete => alltodos.where((todo) => todo.completed == true).toList(),
      FilterType.incomplete => alltodos.where((todo) => todo.completed == false).toList(),
      FilterType.all => alltodos,
    };

    if(_searchText.isNotEmpty){
      filtered =filtered.where((element) => element.title!.toLowerCase().contains(_searchText) || 
      element.userId.toString().contains(_searchText)).toList();
    }
    return filtered;
    
  }

  

  void all(){
    filter =FilterType.all;
    btn1Color =AppColor.primary;
    btn2Color =AppColor.normal;
    btn3Color =AppColor.normal;
    notifyListeners();
  }
  void complete(){
    filter =FilterType.complete;
    btn1Color =AppColor.normal;
    btn2Color =AppColor.primary;
    btn3Color =AppColor.normal;
    notifyListeners();
  }
  void incomplete(){
    filter =FilterType.incomplete;
    btn1Color =AppColor.normal;
    btn2Color =AppColor.normal;
    btn3Color =AppColor.primary;
    notifyListeners();
  }



}