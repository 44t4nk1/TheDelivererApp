import 'dart:convert';

import 'package:TheDeliverer/animations/BounceIn.dart';
import 'package:TheDeliverer/providers/reg.dart';
import 'package:TheDeliverer/providers/restaurants.dart';
import 'package:TheDeliverer/screens/homePage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
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

  int code;
  Map<String, dynamic> orderData = {};
  Map extractedUserData = {};
  bool isLoading = false;
  Future<void> placeOrder() async {
    final prefs = await SharedPreferences.getInstance();
    extractedUserData = await json.decode(
        prefs.getString('currentAddress') ?? json.encode({'addressId': ''}));
    orderData["addressId"] = extractedUserData["addressId"];
    orderData["restaurantId"] = widget.restaurantId;
    orderData["items"] = widget.items;
    orderData["total"] = widget.total.toString();
    setState(() {
      isLoading = true;
    });
    code = await Provider.of<Restaurant>(context, listen: false)
        .placeOrder(orderData, Provider.of<Reg>(context, listen: false).token);
    print(code);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
        child: isLoading
            ? CircularProgressIndicator()
            : Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.check,
                        color: Theme.of(context).accentColor,
                        size: 40,
                      ),
                      SizedBox(
                        height: size.height * 2 / 100,
                      ),
                      Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Text(
                          "Your order has been placed!",
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).backgroundColor,
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: size.height * 75 / 100,
                      left: size.width * 10 / 100,
                      right: size.width * 10 / 100,
                    ),
                    height: size.height * 7 / 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                      color: Theme.of(context).accentColor,
                    ),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          BounceIn(
                            widget: HomePage(
                              currentIndex: 0,
                            ),
                          ),
                        );
                      },
                      splashColor: Theme.of(context).accentColor,
                      child: Center(
                        child: Text(
                          "Home Screen",
                          style: GoogleFonts.montserrat(
                            fontSize: size.height * 2.2 / 100,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).canvasColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
