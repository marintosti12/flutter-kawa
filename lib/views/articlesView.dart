import 'package:arcore_example/widgets/ArticleItem.dart';
import 'package:flutter/material.dart';

import '../models/Article.dart';

class ArticlesView extends StatelessWidget {
  final String title;
  final Future<List<Article>> articles;

  const ArticlesView({required this.title, required this.articles, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF264653),
        body: FutureBuilder(
          future: articles,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final articleList = snapshot.data as List<Article>;
              return ListView.builder(
                  itemCount: articleList.length,
                  itemBuilder: (context, index) {
                    return ArticleItem(article: articleList[index]);
                  });
            } else if (snapshot.hasError) {
              // handle error here
              return Text('${snapshot.error}');
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              ); // displays while loading data
            }
          },
        ));
  }
}
