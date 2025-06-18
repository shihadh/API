import 'package:flutter/widgets.dart';
import 'package:todo/service/todo_service.dart';
import 'package:todo/model/todo_model.dart';

class ApiController extends ChangeNotifier {
  TextEditingController userIdcontroller = TextEditingController();
  TextEditingController titleContropller = TextEditingController();
  TextEditingController userIdUpdateContropller = TextEditingController();
  TextEditingController titleUpdateContropller = TextEditingController();
  TodoService todoService = TodoService();
  List<TodoModel> tododata = [];
  bool swichvalue = false;
  bool isLoading=true;

  void toggle(index, value) async {
    await todoService.updateTodo(TodoModel(
      userId: tododata[index].userId, title: tododata[index].title, completed: value
      ),
      tododata[index].id!);
    getData();
    notifyListeners();
  }

  void swichtoggle(value) {
    swichvalue = value;
    notifyListeners();
  }

  void addDAta(bool stat) async {
    final firstId = int.tryParse(tododata.first.id ?? '') ?? 0;
    final newId = tododata.isEmpty ? 1 : firstId + 1;

    int userid = int.parse(userIdcontroller.text);
   await todoService.addTodo(
      TodoModel(
        userId: userid,
        title: titleContropller.text,
        completed: stat,
        id: newId.toString(),
      ),
    );
   
     getData();
    notifyListeners();
    userIdcontroller.clear();
    titleContropller.clear();
    notifyListeners();
  }

  void getData() async {
    isLoading=true;
    await Future.delayed(Duration(seconds: 1));
    notifyListeners();
    tododata = await todoService.getTodo();
     isLoading=false;
    notifyListeners();
  }

  void updateTodofn(
    useridcntroller,
    titlecontroller,
    id,
    userIdUpdateContropller,
    titleUpdateContropller,
    bool stat,
  ) async {
    int convert = int.parse(userIdUpdateContropller);
   await todoService.updateTodo(
      TodoModel(
        userId: convert,
        title: titleUpdateContropller,
        completed: stat,
      ),
      id,
    );
    getData();
    notifyListeners();
  }

  void deletetodo(id) async {
   await todoService.deleteTodo(id);
    notifyListeners();
    getData();
  }
}
