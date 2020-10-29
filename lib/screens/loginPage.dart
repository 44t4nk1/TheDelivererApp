import 'package:TheDeliverer/animations/BounceIn.dart';
import 'package:TheDeliverer/providers/reg.dart';
import 'package:TheDeliverer/screens/homePage.dart';
import 'package:TheDeliverer/screens/signupPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  Map<String, String> _data = {};
  bool _isHidden = true;
  bool _isLoading = false;
  String response;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  Future<void> _submit() async {
    setState(() {
      _isLoading = true;
    });
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    response = await Provider.of<Reg>(context, listen: false).login(_data);
    await showDialog(
      context: context,
      child: AlertDialog(
        title: Text('Message'),
        content: Text(response),
      ),
    );
    if (response == "Login Successful") {
      Navigator.push(
        context,
        BounceIn(
          widget: HomePage(
            currentIndex: 0,
          ),
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
                          alignment: Alignment.center,
                          child: TextFormField(
                            controller: email,
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
                            controller: password,
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
                            onPressed: () {
                              _data['email'] = email.text;
                              _data['password'] = password.text;
                              _submit();
                            },
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
                        ),
                        SizedBox(
                          height: size.height * 3 / 100,
                        ),
                        Center(
                          child: Text("----  OR  ----"),
                        ),
                        SizedBox(
                          height: size.height * 3 / 100,
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
                            border: Border.all(
                                color: Theme.of(context).accentColor),
                          ),
                          padding: EdgeInsets.all(
                            size.height * 1 / 100,
                          ),
                          child: FlatButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                BounceIn(
                                  widget: SignUpPage(),
                                ),
                              );
                            },
                            splashColor: Theme.of(context).canvasColor,
                            child: Center(
                              child: Text(
                                "Sign Up",
                                style: GoogleFonts.montserrat(
                                  fontSize: size.height * 3 / 100,
                                  fontWeight: FontWeight.w400,
                                  color: Theme.of(context).accentColor,
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
                )
              ],
            ),
          );
  }
}
