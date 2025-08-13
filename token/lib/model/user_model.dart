class UserModel {
  String? firstName;
  String? lastName;
  String? genter;
  String? image;
  String? accessToken;
  String? refreshToken;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.genter,
    required this.image,
    required this.accessToken,
    required this.refreshToken,
  });

  factory UserModel.fromjson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      genter: json['gender'],
      image: json['image'],
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );

  }

  Map<String,dynamic>tojson(){
    return{
      'accessToken':accessToken,
      'refreshToken':refreshToken
    };
  }
}
