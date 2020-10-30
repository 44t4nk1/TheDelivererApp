import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class User with ChangeNotifier {
  Future<void> fetchDetails(String token) async {
    final url = "https://thedeliverer.herokuapp.com/api/user/details/fetch";
    try {
      final response = await http.get(
        url,
        headers: {
          "Authorization": token,
        },
      );
      final resBody = json.decode(response.body);
      print(resBody);
    } catch (error) {
      throw error;
    }
  }
}
