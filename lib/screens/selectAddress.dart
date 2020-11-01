import 'dart:convert';

import 'package:TheDeliverer/animations/BounceOut.dart';
import 'package:TheDeliverer/providers/userDetails.dart';
import 'package:TheDeliverer/screens/homePage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectAddressScreen extends StatefulWidget {
  @override
  _SelectAddressScreenState createState() => _SelectAddressScreenState();
}

class _SelectAddressScreenState extends State<SelectAddressScreen> {
  @override
  void initState() {
    super.initState();
    visitScreen();
  }

  Map userDetails;
  List<dynamic> addresses;
  Future<void> visitScreen() async {
    userDetails = Provider.of<User>(context, listen: false).userDetails;
    addresses = userDetails["UserAddresses"];
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        title: Text(
          "Select an Address",
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: size.height * 1.5 / 100,
          ),
          for (var i in addresses)
            FlatButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                final _prefsData = jsonEncode({
                  'addressId': i["addressId"],
                  'addressLine1': i["addressLine1"],
                  'addressLine2': i["addressLine2"],
                  'state': i["state"],
                  'city': i["city"],
                  'pinCode': i["pinCode"],
                });
                await prefs.setString('currentAddress', _prefsData);
                Navigator.push(
                  context,
                  BounceOut(
                    widget: HomePage(
                      currentIndex: 0,
                    ),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.only(bottom: size.height * 1 / 100),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: size.width * 4 / 100),
                      child: Icon(
                        FontAwesomeIcons.home,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    Flexible(
                      child: Container(
                        margin: EdgeInsets.only(
                          left: size.width * 4 / 100,
                          right: size.width * 4 / 100,
                        ),
                        child: Text(
                          i["addressLine1"] +
                              ', ' +
                              i["addressLine2"] +
                              ', ' +
                              i["city"] +
                              ', ' +
                              i["state"] +
                              ', ' +
                              i["pinCode"].toString(),
                          style: GoogleFonts.montserrat(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).backgroundColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
