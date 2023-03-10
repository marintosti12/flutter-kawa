import 'package:arcore_example/views/localAndWebObjectsView.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../forms/userForm.dart';

class LoginPage extends StatelessWidget {
  final String title;

  const LoginPage({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF264653),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [UserForm()]),
        ));
  }
}
