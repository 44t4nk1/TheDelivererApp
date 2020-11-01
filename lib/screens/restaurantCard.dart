import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RestaurantCard extends StatelessWidget {
  final String name;
  final String id;
  final String addressLine1;
  final String addressLine2;
  final String state;
  final String city;
  final String pinCode;

  RestaurantCard({
    @required this.name,
    @required this.id,
    @required this.addressLine1,
    @required this.addressLine2,
    @required this.state,
    @required this.city,
    @required this.pinCode,
  });
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).accentColor,
            Theme.of(context).secondaryHeaderColor,
          ],
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: size.width * 45 / 100,
            margin: EdgeInsets.only(
                top: size.height * 2 / 100, left: size.width * 6 / 100),
            child: Text(
              name,
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            width: size.width * 60 / 100,
            margin: EdgeInsets.only(
                top: size.height * 0.5 / 100,
                left: size.width * 6 / 100,
                right: size.width * 6 / 100),
            child: Text(
              addressLine1 +
                  ', ' +
                  addressLine2 +
                  ', ' +
                  city +
                  ', ' +
                  state +
                  ', ' +
                  pinCode,
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
