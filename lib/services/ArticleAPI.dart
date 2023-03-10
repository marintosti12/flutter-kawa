import 'dart:convert';

import '../models/Article.dart';
import 'package:http/http.dart' as http;
import '../config.dart';

class ArticleAPI {
  Future<List<Article>> fetchArticles() async {
    List<Article> articles;

    final response =
        await http.get(Uri.parse('${Config.productsApiUrl}/products'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      Iterable list = json.decode(response.body);
      articles = list.map((model) => Article.fromJson(model)).toList();
      return articles;
    } else {
      throw Exception('Failed to load articles');
    }
  }
}
