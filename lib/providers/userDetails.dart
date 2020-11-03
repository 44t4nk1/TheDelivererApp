import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class User with ChangeNotifier {
  Map _userDetails;
  Map get userDetails {
    return _userDetails;
  }

  List<dynamic> _pendingOrdersList = [];
  List<dynamic> get pendingOrdersList {
    return _pendingOrdersList;
  }

  List<dynamic> _deliveredOrdersList = [];
  List<dynamic> get deliveredOrdersList {
    return _deliveredOrdersList;
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

  Future<int> updateDetails(Map<String, String> data, String token) async {
    final url = "https://thedeliverer.herokuapp.com/api/user/details/update";
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

  Future<void> pendingOrders(String token) async {
    final url =
        "https://thedeliverer.herokuapp.com/api/user/orders/fetch/pending";
    try {
      final response = await http.get(
        url,
        headers: {
          "Authorization": token,
        },
      );
      final resBody = json.decode(response.body);
      if (resBody["message"] != "You do not have any pending orders") {
        _pendingOrdersList = resBody["orders"];
      } else {
        _pendingOrdersList = [
          {"orders": 0}
        ];
      }
    } catch (error) {
      throw error;
    }
  }

  Future<void> deliveredOrders(String token) async {
    final url =
        "https://thedeliverer.herokuapp.com/api/user/orders/fetch/delivered";
    try {
      final response = await http.get(
        url,
        headers: {
          "Authorization": token,
        },
      );
      final resBody = json.decode(response.body);
      if (resBody["message"] != "You do not have any delivered orders") {
        _deliveredOrdersList = resBody["orders"];
      } else {
        _deliveredOrdersList = [
          {"orders": 0}
        ];
      }
    } catch (error) {
      throw error;
    }
  }
}
