class GamesModel{
  int? id;
  String? name;
  List<String>? platforms;
  String? released;
  String? backgroundImage;
  double? rating;
  List<String>? shortScreenshots;
  List<String>? genres;

  GamesModel({
    required this.id,
    required this.name,
    required this.platforms,
    required this.released,
    required this.backgroundImage,
    required this.rating,
    required this.shortScreenshots,
    required this.genres
  });

  factory GamesModel.fromJson(Map<String,dynamic>json){
    return GamesModel(
      id: json['id'],
      name: json['name'],
      platforms: (json['platforms'] as List).map((p)=>p['platform']["name"].toString()).toList(),
      released: json['released'], 
      backgroundImage: json['background_image'], 
      rating: (json['rating'] as double).toDouble(), 
      shortScreenshots: (json['short_screenshots'] as List).map((p)=>p['image'].toString()).toList(), 
      genres: (json['genres'] as List).map((p)=>p['name'].toString()).toList());
  }



  
}