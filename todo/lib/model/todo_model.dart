class TodoModel {

  int? userId;
  String? id;
  String? title;
  bool? completed;

  TodoModel({
    required this.userId,
    this.id,
    required this.title,
    required this.completed
  });

  TodoModel.fromJson(Map<String,dynamic>json){
    userId= json['userId'];
    id=json['id'];
    title=json['title'];
    completed =json['completed'];
  }

  Map<String,dynamic>toJson(){
    return {
      'userId':userId,
      'id':id,
      'title':title,
      'completed':completed
    };
  }

}