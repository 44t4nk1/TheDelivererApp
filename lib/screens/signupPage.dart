import 'package:TheDeliverer/animations/BounceIn.dart';
import 'package:TheDeliverer/providers/reg.dart';
import 'package:TheDeliverer/screens/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  Map<String, dynamic> _data = {};
  bool _isHidden = true;
  bool _isLoading = false;
  String response;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  Future<void> _submit() async {
    setState(() {
      _isLoading = true;
    });
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    response = await Provider.of<Reg>(context, listen: false).signup(_data);
    await showDialog(
      context: context,
      child: AlertDialog(
        title: Text('Message'),
        content: Text(response),
      ),
    );
    if (response == "Your Account Has Been Created Successfully") {
      Navigator.push(
        context,
        BounceIn(
          widget: LoginPage(),
        ),
      );
    }
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return _isLoading
        ? Scaffold(body: Center(child: CircularProgressIndicator()))
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
                                  widget: LoginPage(),
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
                          child: TextFormField(
                            style: GoogleFonts.montserrat(
                              color: Colors.black,
                            ),
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
                            controller: name,
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
                            controller: email,
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
                            obscureText: _isHidden,
                            cursorColor: Theme.of(context).accentColor,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0.5),
                              prefixIcon: Icon(
                                FontAwesomeIcons.lock,
                                color: Theme.of(context).accentColor,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isHidden
                                      ? FontAwesomeIcons.eyeSlash
                                      : FontAwesomeIcons.eye,
                                  color: Theme.of(context).accentColor,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isHidden = !_isHidden;
                                  });
                                },
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
                              hintText: "Password",
                              hintStyle: GoogleFonts.montserrat(
                                fontSize: size.height * 2 / 100,
                                fontWeight: FontWeight.w300,
                                textStyle:
                                    Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                            controller: password,
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
                            controller: number,
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
                            onPressed: () {
                              _data["name"] = name.text;
                              _data["email"] = email.text;
                              _data["password"] = password.text;
                              _data["phone"] = number.text;
                              _submit();
                            },
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
                ),
              ],
            ),
          );
  }
}
