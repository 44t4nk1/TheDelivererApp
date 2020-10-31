import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class User with ChangeNotifier {
  Map _userDetails;
  Map get userDetails {
    return _userDetails;
  }

  Future<int> fetchDetails(String token) async {
    final url = "https://thedeliverer.herokuapp.com/api/user/details/fetch";
    try {
      final response = await http.get(
        url,
        headers: {
          "Authorization": token,
        },
      );
      final resBody = json.decode(response.body);
      _userDetails = resBody["userDetails"];
      return resBody["code"];
    } catch (error) {
      throw error;
    }
  }

  Future<int> addAddress(Map<String, String> data, String token) async {
    final url = "https://thedeliverer.herokuapp.com/api/user/address/add";
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          "Authorization": token,
        },
        body: json.encode(data),
      );
      final resBody = json.decode(response.body);
      return resBody["code"];
    } catch (error) {
      throw error;
    }
  }

  Future<int> fetchAddress(String token) async {
    final url = "https://thedeliverer.herokuapp.com/api/user/address/fetch";
    try {
      final response = await http.get(
        url,
        headers: {
          "Authorization": token,
        },
      );
      final resBody = json.decode(response.body);
      return resBody["code"];
    } catch (error) {
      throw error;
    }
  }
}
