import 'package:arcore_example/views/QRCodeView.dart';
import 'package:arcore_example/views/localAndWebObjectsView.dart';
import 'package:arcore_example/views/loginView.dart';
import 'package:arcore_example/widgets/ArticleItem.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/Article.dart';
import '../services/ArticleAPI.dart';

class ArticlesView extends StatelessWidget {
  final String title;

  const ArticlesView({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF264653),
        body: FutureBuilder(
          future: ArticleAPI().fetchArticles(),
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
              return Center(
                child: CircularProgressIndicator(),
              ); // displays while loading data
            }
          },
        ));
  }
}
