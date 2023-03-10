import 'package:arcore_example/models/Article.dart';
import 'package:arcore_example/services/IArticleAPI.dart';

class MockArticlesAPI implements IArticleAPI {
  final Article _machineACafeExample = const Article(
        name: "Machine à café",
        id: 0,
        price: 12,
        description: "Machine à servir du café de bon qualité !!",
        color: "noir",
        stock: 20,
        createdAt: "09/03/2023",
        image: null, 
        model: null);

  final Article _cafeExample = const Article(
        name: "Café",
        id: 1,
        price: 2,
        description: "Café venant de Colombie.",
        color: "noir",
        stock: 10000,
        createdAt: "10/03/2023",
        image: null, 
        model: null);

  @override
  Future<List<Article>> fetchArticles() async {
    List<Article> articles = [machineACafeExample, cafeExample];
    return Future.value(articles);
  }

  Article get machineACafeExample => _machineACafeExample;
  Article get cafeExample => _cafeExample;

}
