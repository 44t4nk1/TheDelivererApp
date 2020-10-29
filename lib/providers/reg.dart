import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Reg with ChangeNotifier {
  String _token;
  String _email;
  String _name;
  String _number;

  String get token {
    return _token;
  }

  String get name {
    return _name;
  }

  String get number {
    return _number;
  }

  String get email {
    return _email;
  }

  bool get isReg {
    return token != null;
  }

  Future<String> login(Map<String, String> data) async {
    final url = 'https://thedeliverer.herokuapp.com/api/user/login';
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(data),
      );
      final resBody = json.decode(response.body);
      if (response.statusCode == 200) {
        if (resBody["error"] != true) {
          _token = resBody["JWT"];
          final userDetails = resBody["userDetails"];
          _name = userDetails["name"];
          _email = userDetails["email"];
          _number = userDetails["phoneNumber"];
          final prefs = await SharedPreferences.getInstance();
          final _prefsData = jsonEncode({
            'token': _token,
            'email': _email,
            'name': _name,
            'number': _number,
          });
          await prefs.setString('userData', _prefsData);
          notifyListeners();
        }
      }
      return resBody["message"];
    } catch (error) {
      throw error;
    }
  }

  Future<String> signup(Map<String, dynamic> data) async {
    final url = 'https://thedeliverer.herokuapp.com/api/user/register';
    data["role"] = 1;
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(data),
      );
      final resBody = json.decode(response.body);
      return resBody["message"];
    } catch (error) {
      throw error;
    }
  }

  Future<void> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      return false;
    }
    final extractedUserData =
        json.decode(prefs.getString('userData')) as Map<String, Object>;
    _token = extractedUserData['token'];
    _email = extractedUserData['email'];
    _name = extractedUserData['name'];
    _number = extractedUserData['number'];
    notifyListeners();
    return true;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    _token = null;
    _email = null;
    _name = null;
    _number = null;
    notifyListeners();
  }
}
