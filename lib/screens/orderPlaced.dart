import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class OrderPlaced extends StatefulWidget {
  List<dynamic> items;
  String restaurantId;
  int total;

  @override
  OrderPlaced({
    @required this.items,
    @required this.restaurantId,
    @required this.total,
  });
  _OrderPlacedState createState() => _OrderPlacedState();
}

class _OrderPlacedState extends State<OrderPlaced> {
  void initState() {
    super.initState();
    placeOrder();
  }

  Map<String, dynamic> orderData = {};
  Map extractedUserData = {};
  Future<void> placeOrder() async {
    final prefs = await SharedPreferences.getInstance();
    extractedUserData = await json.decode(
        prefs.getString('currentAddress') ?? json.encode({'addressId': ''}));
    orderData["addressId"] = extractedUserData["addressId"];
    orderData["restaurantId"] = widget.restaurantId;
    orderData["items"] = widget.items;
    orderData["total"] = widget.total.toString();
    print(orderData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        title: Text(
          "Placing Order",
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Text("placing"),
      ),
    );
  }
}
