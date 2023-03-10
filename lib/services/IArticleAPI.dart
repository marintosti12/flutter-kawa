import 'package:arcore_example/models/Article.dart';

abstract class IArticleAPI {
  Future<List<Article>> fetchArticles();
}