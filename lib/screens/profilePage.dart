import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 18 / 100,
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: size.width * 4 / 100),
                    child: Icon(
                      FontAwesomeIcons.phone,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: size.width * 4 / 100),
                    child: Text(
                      "+91 9909666900",
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).backgroundColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 5.5 / 100,
              ),
              Container(
                padding: EdgeInsets.only(left: size.width * 4 / 100),
                child: Text(
                  "Hello, Siddharth",
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: size.width * 4 / 100),
                    child: Text(
                      "siddharthsingh3700@gmail.com",
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).backgroundColor,
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.only(right: size.width * 4 / 100),
                    child: IconButton(
                      icon: Icon(
                        FontAwesomeIcons.pencilAlt,
                        size: 20,
                        color: Theme.of(context).accentColor,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              Container(
                height: 0.3,
                width: double.infinity,
                color: Theme.of(context).backgroundColor,
                margin: EdgeInsets.symmetric(horizontal: size.width * 4 / 100),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
