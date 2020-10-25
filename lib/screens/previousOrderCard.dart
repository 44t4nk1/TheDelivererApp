import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PastItem extends StatelessWidget {
  final String name;
  final String description;
  final String quantity;
  final String price;
  @override
  PastItem({
    @required this.name,
    @required this.description,
    @required this.quantity,
    @required this.price,
  });
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
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
                    quantity + "x " + name,
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  width: size.width * 45 / 100,
                  margin: EdgeInsets.only(
                      top: size.height * 0.5 / 100, left: size.width * 6 / 100),
                  child: Text(
                    description,
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.only(
                  right: size.width * 6 / 100, top: size.height * 2 / 100),
              child: Text(
                '₹' + price,
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
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
