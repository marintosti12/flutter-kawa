class Article {
  final String name;
  final String description;
  final String createdAt;
  final String color;
  final int stock;
  final String price;
  final String id;
  final bool visibility;

  const Article(
      {required this.name,
      required this.id,
      required this.price,
      required this.description,
      required this.color,
      required this.stock,
      required this.createdAt,
      required this.visibility});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
        name: json['name'],
        createdAt: json['createdAt'],
        price: json["details"]['price'],
        id: json['id'],
        description: json["details"]['description'],
        color: json["details"]['color'],
        stock: json['stock'],
        visibility: false);
  }
}
