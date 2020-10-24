import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Theme.of(context).canvasColor,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 4 / 100,
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: size.width * 4 / 100),
                  child: IconButton(
                    icon: Icon(
                      FontAwesomeIcons.arrowLeft,
                      color: Theme.of(context).accentColor,
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  height: size.height * 2 / 100,
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: size.width * 8 / 100),
                  child: Text(
                    "Sign Up",
                    style: GoogleFonts.montserrat(
                      fontSize: size.height * 5 / 100,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 5 / 100,
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: size.width * 8 / 100,
                    right: size.width * 8 / 100,
                  ),
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 1 / 100,
                    vertical: size.height * 0.8 / 100,
                  ),
                  width: double.infinity,
                  height: size.height * 6 / 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).accentColor),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: TextFormField(
                    cursorColor: Theme.of(context).accentColor,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        FontAwesomeIcons.userAlt,
                        color: Theme.of(context).accentColor,
                      ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintText: "Name",
                      hintStyle: GoogleFonts.montserrat(
                        fontSize: size.height * 2 / 100,
                        fontWeight: FontWeight.w300,
                        textStyle: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 2 / 100,
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: size.width * 8 / 100,
                    right: size.width * 8 / 100,
                  ),
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 1 / 100,
                    vertical: size.height * 0.8 / 100,
                  ),
                  width: double.infinity,
                  height: size.height * 6 / 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).accentColor),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: TextFormField(
                    cursorColor: Theme.of(context).accentColor,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        FontAwesomeIcons.solidEnvelope,
                        color: Theme.of(context).accentColor,
                      ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintText: "Email-ID",
                      hintStyle: GoogleFonts.montserrat(
                        fontSize: size.height * 2 / 100,
                        fontWeight: FontWeight.w300,
                        textStyle: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 2 / 100,
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: size.width * 8 / 100,
                    right: size.width * 8 / 100,
                  ),
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 1 / 100,
                    vertical: size.height * 0.8 / 100,
                  ),
                  width: double.infinity,
                  height: size.height * 6 / 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).accentColor),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: TextFormField(
                    cursorColor: Theme.of(context).accentColor,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        FontAwesomeIcons.phone,
                        color: Theme.of(context).accentColor,
                      ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintText: "Phone Number",
                      hintStyle: GoogleFonts.montserrat(
                        fontSize: size.height * 2 / 100,
                        fontWeight: FontWeight.w300,
                        textStyle: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 7 / 100,
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: size.width * 25 / 100,
                  ),
                  height: size.height * 8 / 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    color: Theme.of(context).accentColor,
                  ),
                  padding: EdgeInsets.all(
                    size.height * 1 / 100,
                  ),
                  child: FlatButton(
                    onPressed: () {},
                    splashColor: Theme.of(context).accentColor,
                    child: Center(
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.montserrat(
                          fontSize: size.height * 3 / 100,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).canvasColor,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 20 / 100,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
