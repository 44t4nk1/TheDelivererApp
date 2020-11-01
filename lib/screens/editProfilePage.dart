import 'package:TheDeliverer/animations/BounceIn.dart';
import 'package:TheDeliverer/animations/BounceOut.dart';
import 'package:TheDeliverer/providers/reg.dart';
import 'package:TheDeliverer/providers/userDetails.dart';
import 'package:TheDeliverer/screens/homePage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool isLoading = false;
  Map userDetails;
  final GlobalKey<FormState> _formKey = GlobalKey();
  int code;
  Map<String, String> _data = {};
  @override
  void initState() {
    super.initState();
    userDetails = Provider.of<User>(context, listen: false).userDetails;
  }

  Future<void> _submit() async {
    setState(() {
      isLoading = true;
    });
    code = await Provider.of<User>(context, listen: false)
        .updateDetails(_data, Provider.of<Reg>(context, listen: false).token);
    if (code == 200) {
      Navigator.push(
        context,
        BounceOut(
          widget: HomePage(
            currentIndex: 2,
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

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return isLoading
        ? Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            body: Stack(
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Theme.of(context).canvasColor,
                ),
                SingleChildScrollView(
                  child: Form(
                    key: _formKey,
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
                            onPressed: () {
                              Navigator.push(
                                context,
                                BounceIn(
                                  widget: HomePage(
                                    currentIndex: 2,
                                  ),
                                ),
                              );
                            },
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
                            "Edit Profile",
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
                          child: TextFormField(
                            style: GoogleFonts.montserrat(
                              color: Colors.black,
                            ),
                            initialValue: userDetails["name"],
                            onChanged: (value) => userDetails["name"] = value,
                            cursorColor: Theme.of(context).accentColor,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0.5),
                              prefixIcon: Icon(
                                FontAwesomeIcons.userAlt,
                                color: Theme.of(context).accentColor,
                              ),
                              border: OutlineInputBorder(
                                gapPadding: 1,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(22),
                                ),
                                borderSide: BorderSide(
                                  color: Theme.of(context).accentColor,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                gapPadding: 1,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(22)),
                                borderSide: BorderSide(
                                  color: Theme.of(context).accentColor,
                                  width: 1,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                gapPadding: 1,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(22)),
                                borderSide: BorderSide(
                                  color: Theme.of(context).accentColor,
                                  width: 1,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                gapPadding: 1,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(22)),
                                borderSide: BorderSide(
                                  color: Theme.of(context).accentColor,
                                  width: 1,
                                ),
                              ),
                              disabledBorder: OutlineInputBorder(
                                gapPadding: 1,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(22)),
                                borderSide: BorderSide(
                                  color: Theme.of(context).accentColor,
                                  width: 1,
                                ),
                              ),
                              hintText: "Name",
                              hintStyle: GoogleFonts.montserrat(
                                fontSize: size.height * 2 / 100,
                                fontWeight: FontWeight.w300,
                                textStyle:
                                    Theme.of(context).textTheme.bodyText1,
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
                            style: GoogleFonts.montserrat(
                              color: Colors.black,
                            ),
                            initialValue: userDetails["email"],
                            onChanged: (value) => userDetails["email"] = value,
                            cursorColor: Theme.of(context).accentColor,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0.5),
                              prefixIcon: Icon(
                                FontAwesomeIcons.solidEnvelope,
                                color: Theme.of(context).accentColor,
                              ),
                              border: OutlineInputBorder(
                                gapPadding: 1,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(22),
                                ),
                                borderSide: BorderSide(
                                  color: Theme.of(context).accentColor,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                gapPadding: 1,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(22)),
                                borderSide: BorderSide(
                                  color: Theme.of(context).accentColor,
                                  width: 1,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                gapPadding: 1,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(22)),
                                borderSide: BorderSide(
                                  color: Theme.of(context).accentColor,
                                  width: 1,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                gapPadding: 1,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(22)),
                                borderSide: BorderSide(
                                  color: Theme.of(context).accentColor,
                                  width: 1,
                                ),
                              ),
                              disabledBorder: OutlineInputBorder(
                                gapPadding: 1,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(22)),
                                borderSide: BorderSide(
                                  color: Theme.of(context).accentColor,
                                  width: 1,
                                ),
                              ),
                              hintText: "Email-ID",
                              hintStyle: GoogleFonts.montserrat(
                                fontSize: size.height * 2 / 100,
                                fontWeight: FontWeight.w300,
                                textStyle:
                                    Theme.of(context).textTheme.bodyText1,
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
                            style: GoogleFonts.montserrat(
                              color: Colors.black,
                            ),
                            initialValue: userDetails["phoneNumber"],
                            onChanged: (value) =>
                                userDetails["phoneNumber"] = value,
                            cursorColor: Theme.of(context).accentColor,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0.5),
                              prefixIcon: Icon(
                                FontAwesomeIcons.phone,
                                color: Theme.of(context).accentColor,
                              ),
                              border: OutlineInputBorder(
                                gapPadding: 1,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(22),
                                ),
                                borderSide: BorderSide(
                                  color: Theme.of(context).accentColor,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                gapPadding: 1,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(22)),
                                borderSide: BorderSide(
                                  color: Theme.of(context).accentColor,
                                  width: 1,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                gapPadding: 1,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(22)),
                                borderSide: BorderSide(
                                  color: Theme.of(context).accentColor,
                                  width: 1,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                gapPadding: 1,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(22)),
                                borderSide: BorderSide(
                                  color: Theme.of(context).accentColor,
                                  width: 1,
                                ),
                              ),
                              disabledBorder: OutlineInputBorder(
                                gapPadding: 1,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(22)),
                                borderSide: BorderSide(
                                  color: Theme.of(context).accentColor,
                                  width: 1,
                                ),
                              ),
                              hintText: "Phone Number",
                              hintStyle: GoogleFonts.montserrat(
                                fontSize: size.height * 2 / 100,
                                fontWeight: FontWeight.w300,
                                textStyle:
                                    Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 5 / 100,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: size.width * 15 / 100,
                          ),
                          height: size.height * 8 / 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            color: Theme.of(context).accentColor,
                          ),
                          padding: EdgeInsets.all(
                            size.height * 1 / 100,
                          ),
                          child: FlatButton(
                            onPressed: () {
                              _data["name"] = userDetails["name"];
                              _data["email"] = userDetails["email"];
                              _data["phoneNumber"] = userDetails["phoneNumber"];
                              _submit();
                            },
                            splashColor: Theme.of(context).accentColor,
                            child: Center(
                              child: Text(
                                "Save Changes",
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
                ),
              ],
            ),
          );
  }
}
