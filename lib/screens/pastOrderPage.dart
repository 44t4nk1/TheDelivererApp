import 'package:TheDeliverer/screens/previousOrderCard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PastOrder extends StatefulWidget {
  final String restaurantname;
  final List items;
  final Map<String, dynamic> userAddress;
  final String total;
  final DateTime date;
  @override
  _PastOrderState createState() => _PastOrderState();
  PastOrder({
    @required this.restaurantname,
    @required this.items,
    @required this.userAddress,
    @required this.total,
    @required this.date,
  });
}

class _PastOrderState extends State<PastOrder> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var item in widget.items)
              PastItem(
                name: item["FoodItem"]["itemName"],
                price: item["FoodItem"]["price"].toString(),
                description: item["FoodItem"]["itemDescription"],
                quantity: item["quantity"].toString(),
              ),
            SizedBox(height: size.height * 2 / 100),
            Container(
              height: 0.3,
              color: Theme.of(context).backgroundColor,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: size.width * 4 / 100),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: size.height * 2 / 100, left: size.width * 6 / 100),
              child: Text(
                "Your total amount",
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: size.height * 1 / 100, left: size.width * 6 / 100),
              child: Text(
                '₹ ' + widget.total,
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: size.height * 2 / 100),
            Container(
              height: 0.3,
              color: Theme.of(context).backgroundColor,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: size.width * 4 / 100),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: size.height * 2 / 100, left: size.width * 6 / 100),
              child: Text(
                "The order will be delivered at",
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: size.height * 1 / 100, left: size.width * 6 / 100),
              child: Text(
                widget.userAddress["addressLine1"] +
                    ', ' +
                    widget.userAddress["addressLine2"] +
                    ', ' +
                    widget.userAddress["city"] +
                    ', ' +
                    widget.userAddress["state"] +
                    ', ' +
                    widget.userAddress["pinCode"].toString(),
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: size.height * 2 / 100),
            Container(
              height: 0.3,
              color: Theme.of(context).backgroundColor,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: size.width * 4 / 100),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: size.height * 2 / 100, left: size.width * 6 / 100),
              child: Text(
                "Order placed at",
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: size.height * 1 / 100, left: size.width * 6 / 100),
              child: Text(
                widget.date.hour.toString() +
                    ':' +
                    widget.date.minute.toString() +
                    ':' +
                    widget.date.second.toString() +
                    ' on ' +
                    widget.date.day.toString() +
                    '/' +
                    widget.date.month.toString() +
                    '/' +
                    widget.date.year.toString(),
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
