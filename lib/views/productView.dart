import 'package:arcore_example/models/Article.dart';
import 'package:arcore_example/views/QRCodeView.dart';
import 'package:arcore_example/views/localAndWebObjectsView.dart';
import 'package:arcore_example/views/loginView.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'articlesView.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final Article article;
  const ProductPage({required this.title, required this.article, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF264653),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                article.image != null
                    ? Image.network(
                        article.image!,
                        fit: BoxFit.fitWidth,
                      )
                    : Container(
                        width: double.infinity,
                        height: 100,
                        color: Colors.white,
                        child: Icon(
                          Icons.error,
                          color: Colors.black,
                          size: 40.0,
                        ),
                      ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Center(
                      child: Text(article.name,
                          overflow: TextOverflow.fade,
                          style: GoogleFonts.montserrat(
                              fontSize: 20, color: Colors.white))),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Center(
                      child: Text(article.description.toString(),
                          overflow: TextOverflow.fade,
                          style: GoogleFonts.montserrat(
                              fontSize: 20, color: Colors.white))),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Row(
                    children: [
                      Text("Prix :  " + article.price.toString() + " ",
                          overflow: TextOverflow.fade,
                          style: GoogleFonts.montserrat(
                              fontSize: 20, color: Colors.white)),
                      Icon(Icons.euro, color: Colors.white),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Row(
                    children: [
                      Text("Stock :  " + article.stock.toString() + " ",
                          overflow: TextOverflow.fade,
                          style: GoogleFonts.montserrat(
                              fontSize: 20, color: Colors.white)),
                      Icon(Icons.inventory, color: Colors.white),
                    ],
                  ),
                ),
              ]),
        ));
  }
}
