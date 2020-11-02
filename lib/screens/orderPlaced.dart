import 'package:flutter/material.dart';

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

  Future<void> placeOrder() async {}
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
