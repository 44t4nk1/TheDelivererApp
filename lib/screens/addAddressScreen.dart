import 'package:TheDeliverer/animations/BounceOut.dart';
import 'package:TheDeliverer/providers/reg.dart';
import 'package:TheDeliverer/providers/userDetails.dart';
import 'package:TheDeliverer/screens/homePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddAddress extends StatefulWidget {
  @override
  _AddAddressState createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  Map<String, String> _data = {};
  TextEditingController addln1 = TextEditingController();
  TextEditingController addln2 = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController pincode = TextEditingController();
  int code;
  bool isLoading = false;

  Future<void> _submit() async {
    setState(() {
      isLoading = true;
    });
    code = await Provider.of<User>(context, listen: false)
        .addAddress(_data, Provider.of<Reg>(context, listen: false).token);
    if (code == 201) {
      Navigator.push(
        context,
        BounceOut(
          widget: HomePage(
            currentIndex: 1,
          ),
        ),
      );
    } else {
      setState(() {
        isLoading = false;
      });
      await showDialog(
        context: context,
        child: AlertDialog(
          title: Text('Message'),
          content: Text("There was an error"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return isLoading
        ? Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
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
                        onPressed: () async {
                          _data["addressLine1"] = addln1.text;
                          _data["addressLine2"] = addln2.text;
                          _data["state"] = state.text;
                          _data["city"] = city.text;
                          _data["pinCode"] = pincode.text;
                          await _submit();
                        },
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
