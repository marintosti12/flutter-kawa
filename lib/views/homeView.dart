import 'package:arcore_example/views/QRCodeView.dart';
import 'package:arcore_example/views/localAndWebObjectsView.dart';
import 'package:arcore_example/views/loginView.dart';
import 'package:arcore_example/views/productView.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:arcore_example/services/CustomersAPI.dart';

import 'articlesView.dart';

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF264653),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 50),
                  child: Image(image: AssetImage('assets/images/logo.png')),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 30),
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.all(16.0),
                        textStyle: GoogleFonts.montserrat(fontSize: 20)),
                    onPressed: () async {
                      await CustomerAPI()
                          .loginUser(
                              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1hcmludG9zdGkxMkBnbWFpbC5jb20iLCJpYXQiOjE2NzgzNjk4OTgsImV4cCI6MTY3ODM3MzQ5OH0.BsTfmHE-Eci7qSoG2_rHNQVLBtl33v4pVjk_QLOqGPc')
                          .then((bool result) {
                        if (result) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  const ArticlesView(title: "ssss")));
                        }
                      });
                    },
                    child: const Text('Scanner QR Code'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.all(16.0),
                        textStyle: GoogleFonts.montserrat(fontSize: 20)),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const LoginPage(
                          title: 'Login Page',
                        ),
                      ));
                    },
                    child: const Text('Inscription utilisateur'),
                  ),
                )
              ]),
        ));
  }
}
