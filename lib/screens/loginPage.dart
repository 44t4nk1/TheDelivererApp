import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Theme.of(context).canvasColor,
          ),
          Column(
            children: [
              SizedBox(
                height: size.height * 15 / 100,
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: size.width * 8 / 100),
                child: Text(
                  "Login",
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
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: size.width * 4 / 100),
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
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: "Email-ID",
                    hintStyle: GoogleFonts.montserrat(
                      fontSize: size.height * 2.5 / 100,
                      fontWeight: FontWeight.w300,
                      textStyle: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
