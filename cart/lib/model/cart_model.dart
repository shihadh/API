class CartModel {
  String? id;
  String? title;
  String? prize;
  String? qaundity;
  String? total;
  String? thumbnail;

  CartModel({
    required this.id,
    required this.title,
    required this.prize,
    required this.qaundity,
    required this.total,
    required this.thumbnail,
  });

  factory CartModel.fromjson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'].toString(),
      title: json['title'],
      prize: json['price'].toString(),
      qaundity: json['quantity'].toString(),
      total: json['total'].toString(),
      thumbnail: json['thumbnail'],
    );
  }
}
