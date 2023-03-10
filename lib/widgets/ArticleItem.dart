import 'package:arcore_example/models/Article.dart';
import 'package:arcore_example/views/productView.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../views/localAndWebObjectsView.dart';
import 'PopUp.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({Key? key, required this.article}) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0xFFF2A9D8F)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ))),
          onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductPage(
                            title: 'eee',
                            article: article,
                          )),
                )
              },
          child: Padding(
              padding: EdgeInsets.all(10),
              child: Stack(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: article.image != null
                                ? Image.network(
                                    article.image!,
                                    height: 100.0,
                                    width: 200.0,
                                  )
                                : Container(
                                    width: 200,
                                    height: 100,
                                    color: Colors.white,
                                    child: Icon(
                                      Icons.music_note,
                                      color: Colors.black,
                                      size: 40.0,
                                    ),
                                  ),
                          ),
                        ),
                        Flexible(
                            child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Nom : " + article.name,
                                    softWrap: false,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.montserrat(
                                        fontSize: 15, color: Colors.white)),
                                Container(
                                  height: 15,
                                ),
                                Text("Prix : " + article.price.toString(),
                                    overflow: TextOverflow.fade,
                                    style: GoogleFonts.montserrat(
                                        fontSize: 15, color: Colors.white)),
                                Padding(
                                    padding: EdgeInsets.only(top: 8),
                                    child: ElevatedButton.icon(
                                      icon: Icon(
                                        // <-- Icon
                                        article.model!.isNotEmpty
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        size: 24.0,
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xFFFE76F51),
                                        shape: const StadiumBorder(),
                                      ),
                                      onPressed: () => {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LocalAndWebObjectsView(
                                                      object: article.model!)),
                                        )
                                      },
                                      label: Text('Voir la modélisation'),
                                    )),
                              ]),
                        )),
                      ]),
                ],
              ))),
    );
  }
}
