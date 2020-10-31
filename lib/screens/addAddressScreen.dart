import 'package:TheDeliverer/animations/BounceOut.dart';
import 'package:TheDeliverer/screens/profilePage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AddAddress extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final Map<String, String> _data = {};
  final TextEditingController addln1 = TextEditingController();
  final TextEditingController addln2 = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController state = TextEditingController();
  final TextEditingController pincode = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        title: Text(
          "Add an Address",
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: size.height * 5 / 100,
              ),
              Container(
                margin: EdgeInsets.only(
                  left: size.width * 8 / 100,
                  right: size.width * 8 / 100,
                ),
                alignment: Alignment.center,
                child: TextFormField(
                  controller: addln1,
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                  ),
                  cursorColor: Theme.of(context).accentColor,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: size.width * 5 / 100,
                    ),
                    border: OutlineInputBorder(
                      gapPadding: 1,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide(
                        color: Theme.of(context).accentColor,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      gapPadding: 1,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Theme.of(context).accentColor,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      gapPadding: 1,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Theme.of(context).accentColor,
                        width: 1,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      gapPadding: 1,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Theme.of(context).accentColor,
                        width: 1,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      gapPadding: 1,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Theme.of(context).accentColor,
                        width: 1,
                      ),
                    ),
                    hintText: "Address line 1",
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
                child: TextFormField(
                  controller: addln2,
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                  ),
                  cursorColor: Theme.of(context).accentColor,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: size.width * 5 / 100,
                    ),
                    border: OutlineInputBorder(
                      gapPadding: 1,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide(
                        color: Theme.of(context).accentColor,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      gapPadding: 1,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Theme.of(context).accentColor,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      gapPadding: 1,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Theme.of(context).accentColor,
                        width: 1,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      gapPadding: 1,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Theme.of(context).accentColor,
                        width: 1,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      gapPadding: 1,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Theme.of(context).accentColor,
                        width: 1,
                      ),
                    ),
                    hintText: "Address line 2",
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
                child: TextFormField(
                  controller: city,
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                  ),
                  cursorColor: Theme.of(context).accentColor,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: size.width * 5 / 100,
                    ),
                    border: OutlineInputBorder(
                      gapPadding: 1,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide(
                        color: Theme.of(context).accentColor,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      gapPadding: 1,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Theme.of(context).accentColor,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      gapPadding: 1,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Theme.of(context).accentColor,
                        width: 1,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      gapPadding: 1,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Theme.of(context).accentColor,
                        width: 1,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      gapPadding: 1,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Theme.of(context).accentColor,
                        width: 1,
                      ),
                    ),
                    hintText: "City",
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
                child: TextFormField(
                  controller: state,
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                  ),
                  cursorColor: Theme.of(context).accentColor,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: size.width * 5 / 100,
                    ),
                    border: OutlineInputBorder(
                      gapPadding: 1,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide(
                        color: Theme.of(context).accentColor,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      gapPadding: 1,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Theme.of(context).accentColor,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      gapPadding: 1,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Theme.of(context).accentColor,
                        width: 1,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      gapPadding: 1,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Theme.of(context).accentColor,
                        width: 1,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      gapPadding: 1,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Theme.of(context).accentColor,
                        width: 1,
                      ),
                    ),
                    hintText: "State",
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
                child: TextFormField(
                  controller: pincode,
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                  ),
                  cursorColor: Theme.of(context).accentColor,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: size.width * 5 / 100,
                    ),
                    border: OutlineInputBorder(
                      gapPadding: 1,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide(
                        color: Theme.of(context).accentColor,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      gapPadding: 1,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Theme.of(context).accentColor,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      gapPadding: 1,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Theme.of(context).accentColor,
                        width: 1,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      gapPadding: 1,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Theme.of(context).accentColor,
                        width: 1,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      gapPadding: 1,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Theme.of(context).accentColor,
                        width: 1,
                      ),
                    ),
                    hintText: "Pincode",
                    hintStyle: GoogleFonts.montserrat(
                      fontSize: size.height * 2 / 100,
                      fontWeight: FontWeight.w300,
                      textStyle: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 4 / 100,
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
                      "Add",
                      style: GoogleFonts.montserrat(
                        fontSize: size.height * 3 / 100,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).canvasColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
