import 'dart:convert';

import '../models/Article.dart';
import 'package:http/http.dart' as http;

class CustomerAPI {
  Future<bool> createUser(String email) async {
    final response = await http.put(
      Uri.parse('http://10.0.2.2:5000/customers'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
      }),
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> loginUser(String token) async {
    final response = await http.get(
      Uri.parse('http://10.0.2.2:5000/customers/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      },
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
