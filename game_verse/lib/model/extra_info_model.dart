class ExtraInfoModel {
  String? website;
  String? link;
  String? description;
  List<String>? developers;
  String? minimum;
  String? maximum;


  ExtraInfoModel({
    required this.website,
    required this.link,
    required this.description,
    required this.developers,
    required this.minimum,
    required this.maximum
  });

  factory ExtraInfoModel.fromJson(Map<String,dynamic>json){
    final platforms = json['platforms'] as List?;
    final firstPlatform = platforms?.isNotEmpty == true ? platforms![0] : null;
    final requirements = firstPlatform?['requirements'] as Map?;
    return ExtraInfoModel(
      website: json['website'],
      link: json['metacritic_url'],
      description: json['description_raw'],
      developers: (json['developers'] as List).map((p)=>p['name'].toString()).toList(),
      minimum:requirements?['minimum'],
      maximum: requirements?['recommended']);
  }

  }