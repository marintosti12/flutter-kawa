class Article {
  final String name;
  final String description;
  final String createdAt;
  final String color;
  final int stock;
  final int price;
  final int id;
  final String? image;
  final String? model;

  const Article(
      {required this.name,
      required this.id,
      required this.price,
      required this.description,
      required this.color,
      required this.stock,
      required this.createdAt,
      required this.image,
      required this.model});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
        name: json['name'],
        createdAt: json['createAt'],
        price: json['price'],
        id: json['id'],
        description: json['description'],
        color: json['color'],
        stock: json['stock'],
        image: json['image'],
        model: json['modelRA']);
  }
}
