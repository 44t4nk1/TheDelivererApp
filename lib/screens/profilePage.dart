import 'package:TheDeliverer/animations/BounceIn.dart';
import 'package:TheDeliverer/screens/editProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool newAddress = false;
  final maxLines = 5;
  String address = '';
  List<String> addresses = [
    'B-303, Kabir Astoria, Near Gayatri Party Plot, Gotri, Vadodara, Gujarat',
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 15 / 100,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: size.width * 4 / 100),
                    child: Icon(
                      FontAwesomeIcons.solidEnvelope,
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
                        "siddharthsingh3700@gmail.com",
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
              SizedBox(
                height: size.height * 1.5 / 100,
              ),
              Container(
                height: 0.3,
                width: double.infinity,
                color: Theme.of(context).backgroundColor,
                margin: EdgeInsets.symmetric(horizontal: size.width * 4 / 100),
              ),
              SizedBox(
                height: size.height * 1.5 / 100,
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
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).backgroundColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 1.5 / 100,
              ),
              Container(
                height: 0.3,
                width: double.infinity,
                color: Theme.of(context).backgroundColor,
                margin: EdgeInsets.symmetric(horizontal: size.width * 4 / 100),
              ),
              SizedBox(
                height: size.height * 1.5 / 100,
              ),
              for (var i in addresses)
                Container(
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
                            i,
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
              SizedBox(
                height: size.height * 1.5 / 100,
              ),
              newAddress
                  ? Container(
                      margin: EdgeInsets.only(
                        left: size.width * 8 / 100,
                        right: size.width * 8 / 100,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 5 / 100,
                        vertical: size.height * 0.8 / 100,
                      ),
                      width: double.infinity,
                      height: size.height * maxLines * 3.5 / 100,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Theme.of(context).accentColor),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: TextFormField(
                        maxLines: maxLines,
                        cursorColor: Theme.of(context).accentColor,
                        onChanged: (value) {
                          address = value;
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: "Enter another address",
                          hintStyle: GoogleFonts.montserrat(
                            fontSize: size.height * 2 / 100,
                            fontWeight: FontWeight.w300,
                            textStyle: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                      ),
                    )
                  : Container(height: 0),
              newAddress
                  ? SizedBox(
                      height: size.height * 1.5 / 100,
                    )
                  : Container(height: 0),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: size.width * 8 / 100,
                ),
                height: size.height * 6 / 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  border: Border.all(color: Theme.of(context).accentColor),
                ),
                padding: EdgeInsets.all(
                  size.height * 1 / 100,
                ),
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      newAddress = !newAddress;
                      if (newAddress == false && address != '') {
                        setState(() {
                          addresses.add(address);
                          address = '';
                        });
                      }
                    });
                  },
                  splashColor: Theme.of(context).canvasColor,
                  child: Center(
                    child: Text(
                      newAddress ? "Add" : "+ Address",
                      style: GoogleFonts.montserrat(
                        fontSize: size.height * 3 / 100,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          color: Theme.of(context).accentColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 4.5 / 100,
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: size.width * 4 / 100),
                    child: Text(
                      "Hello, Siddharth",
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.only(right: size.width * 4 / 100),
                    child: IconButton(
                      icon: Icon(FontAwesomeIcons.pencilAlt,
                          size: 20, color: Colors.white),
                      onPressed: () {
                        Navigator.push(
                          context,
                          BounceIn(
                            widget: EditProfile(),
                          ),
                        );
                      },
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
