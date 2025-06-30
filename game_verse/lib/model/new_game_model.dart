class NewGameModel {

  int? id; 
  String? name;
  String? relesed;
  double? rating;
  String? backgroundImage;
  List <String>? platforms;

  NewGameModel({
    required this.id,
    required this.name,
    this.relesed,
    required this.rating,
    required this.backgroundImage,
    required this.platforms
  });

  factory NewGameModel.fromJson(Map<String,dynamic>json){
    return NewGameModel(
      id: json['id'], 
      name: json['name'],
      relesed: json['released'], 
      rating: (json['rating'] as num).toDouble(), 
      backgroundImage: json['background_image'],
      platforms: (json['platforms'] as List).map((p)=>p['platform']['name'].toString()).toList());
  }

}