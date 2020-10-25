import 'package:TheDeliverer/screens/previousOrderCard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PastOrder extends StatefulWidget {
  final String restaurantname;
  final List items;
  @override
  _PastOrderState createState() => _PastOrderState();
  PastOrder({
    @required this.restaurantname,
    @required this.items,
  });
}

class _PastOrderState extends State<PastOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        title: Text(
          widget.restaurantname,
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          for (var item in widget.items)
            PastItem(
              name: item["name"],
              price: item["price"],
              description: item["description"],
              quantity: item["quantity"],
            ),
        ],
      ),
    );
  }
}
