import 'package:arcore_example/models/Article.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'PopUp.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({Key? key, required this.article}) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
          decoration: BoxDecoration(
              color: Color(0xFFF2A9D8F),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Padding(
              padding: EdgeInsets.all(10),
              child: Stack(
                children: [
                  Positioned(
                    top: -10,
                    right: -25,
                    child: Container(
                        alignment: Alignment.topRight,
                        child: Center(
                          child: TextButton.icon(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) => PopUp(
                                        key: key,
                                        title: "Description",
                                        message: article.description,
                                      ));
                            },
                            icon: Icon(
                              // <-- Icon
                              Icons.info_rounded,
                              color: Colors.white,
                            ),
                            label: Text(''), // <-- Text
                          ),
                        )),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              "https://picsum.photos/200",
                              height: 100.0,
                              width: 200.0,
                            ),
                          ),
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Nom : " + article.name,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 15)),
                                      Container(
                                        height: 15,
                                      ),
                                      Text("Prix : " + article.price,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 15)),
                                      Padding(
                                          padding: EdgeInsets.only(top: 8),
                                          child: ElevatedButton.icon(
                                            icon: Icon(
                                              // <-- Icon
                                              article.visibility
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                              size: 24.0,
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Color(0xFFFE76F51),
                                              shape: const StadiumBorder(),
                                            ),
                                            onPressed: () {},
                                            label: Text('Voir la modélisation'),
                                          )),
                                    ]),
                              ),
                              //Text("Description : " + article.description),
                            ])
                      ]),
                ],
              ))),
    );
  }
}
