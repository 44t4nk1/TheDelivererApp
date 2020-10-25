import 'package:TheDeliverer/animations/BounceIn.dart';
import 'package:TheDeliverer/screens/homePage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    );
  }
}
