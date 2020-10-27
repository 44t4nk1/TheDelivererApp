import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 2 / 100,
          ),
          Container(
            padding: EdgeInsets.only(
              left: size.width * 5 / 100,
            ),
            child: Text(
              "Search",
              style: GoogleFonts.montserrat(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
          SizedBox(
            height: size.height * 1 / 100,
          ),
          Container(
            margin: EdgeInsets.only(
              left: size.width * 5 / 100,
              right: size.width * 5 / 100,
            ),
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 4 / 100,
              vertical: size.height * 0.8 / 100,
            ),
            width: double.infinity,
            height: size.height * 6 / 100,
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).accentColor),
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: TextFormField(
              cursorColor: Theme.of(context).accentColor,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: "Search",
                hintStyle: GoogleFonts.montserrat(
                  fontSize: size.height * 2 / 100,
                  fontWeight: FontWeight.w300,
                  textStyle: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
