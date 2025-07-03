class NewGameModel {

  int? id; 
  String? name;
  String? released;
  double? rating;
  List<String>? genres;
  List<String>? shortScreenshots;
  String? backgroundImage;
  List <String>? platforms;

  NewGameModel({
    required this.id,
    required this.name,
    required this.released,
    required this.genres,
    required this.shortScreenshots,
    required this.rating,
    required this.backgroundImage,
    required this.platforms
  });

  factory NewGameModel.fromJson(Map<String,dynamic>json){
    return NewGameModel(
      id: json['id'], 
      name: json['name'],
      released: json['released'], 
      genres: (json['genres'] as List).map((p)=>p['name'].toString()).toList(),
      shortScreenshots: (json['short_screenshots'] as List).map((p)=>p['image'].toString()).toList(), 
      rating: (json['rating'] as num).toDouble(), 
      backgroundImage: json['background_image'],
      platforms: (json['platforms'] as List).map((p)=>p['platform']['name'].toString()).toList());
  }

}