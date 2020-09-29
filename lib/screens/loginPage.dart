import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isHidden = true;
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
                height: size.height * 25 / 100,
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
                padding: EdgeInsets.only(left: size.width * 1 / 100),
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
                      fontSize: size.height * 2.5 / 100,
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
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(
                  left: size.width * 1 / 100,
                  right: size.width * 1 / 100,
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
                  obscureText: _isHidden,
                  cursorColor: Theme.of(context).accentColor,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      FontAwesomeIcons.lock,
                      color: Theme.of(context).accentColor,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isHidden
                            ? FontAwesomeIcons.eye
                            : FontAwesomeIcons.eyeSlash,
                        color: Theme.of(context).accentColor,
                      ),
                      onPressed: () {
                        setState(() {
                          _isHidden = !_isHidden;
                        });
                      },
                    ),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: "Password",
                    hintStyle: GoogleFonts.montserrat(
                      fontSize: size.height * 2.5 / 100,
                      fontWeight: FontWeight.w300,
                      textStyle: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 8 / 100,
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
                      "Login",
                      style: GoogleFonts.montserrat(
                        fontSize: size.height * 3 / 100,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).canvasColor,
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
