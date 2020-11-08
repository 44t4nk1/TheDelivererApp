import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderCard extends StatelessWidget {
  final String name;
  final String status;
  final String price;
  final DateTime date;

  OrderCard({
    @required this.name,
    @required this.status,
    @required this.price,
    @required this.date,
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
        borderRadius: BorderRadius.circular(15),
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
                  status,
                  style: GoogleFonts.montserrat(
                    color: status == "Pending"
                        ? Color(0xfff3ff0a)
                        : Color(0xff42f59e),
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
                  status == "Pending"
                      ? 'Ordered on ' +
                          date.day.toString() +
                          '/' +
                          date.month.toString() +
                          '/' +
                          date.year.toString()
                      : 'Delivered on ' +
                          date.day.toString() +
                          '/' +
                          date.month.toString() +
                          '/' +
                          date.year.toString(),
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 2 / 100,
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
