import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Restaurant with ChangeNotifier {
  List _restaurantDetails;
  List get restaurantDetails {
    return _restaurantDetails;
  }

  Future<void> fetchRestaurants(String restaurantId, String token) async {
    final url =
        "https://thedeliverer.herokuapp.com/api/restaurant/fetch/all?addressId=$restaurantId";
    try {
      final response = await http.get(
        url,
        headers: {
          "Authorization": token,
        },
      );
      final resBody = json.decode(response.body);
      _restaurantDetails = resBody["restaurants"];
    } catch (error) {
      throw error;
    }
  }

  Future<List<dynamic>> fetchItems(String restaurantId, String token) async {
    final url =
        "https://thedeliverer.herokuapp.com/api/restaurant/items/fetch/all?restaurantId=$restaurantId";
    try {
      final response = await http.get(
        url,
        headers: {
          "Authorization": token,
        },
      );
      final resBody = json.decode(response.body);
      return resBody["items"];
    } catch (error) {
      throw error;
    }
  }

  Future<int> placeOrder(Map<String, dynamic> data, String token) async {
    final url = "https://thedeliverer.herokuapp.com/api/user/order/place";
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
}
