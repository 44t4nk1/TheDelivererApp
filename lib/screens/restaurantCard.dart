import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RestaurantCard extends StatelessWidget {
  final String name;
  final String address;
  final String distance;

  RestaurantCard({
    @required this.name,
    @required this.address,
    @required this.distance,
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
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
                width: size.width * 45 / 100,
                margin: EdgeInsets.only(
                    top: size.height * 0.5 / 100, left: size.width * 6 / 100),
                child: Text(
                  address,
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(
                right: size.width * 6 / 100, top: size.height * 2 / 100),
            child: Text(
              distance + 'KM',
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
