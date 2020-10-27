import 'package:TheDeliverer/screens/landingPage.dart';
import 'package:TheDeliverer/screens/profilePage.dart';
import 'package:TheDeliverer/screens/searchPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  int currentIndex = 0;
  @override
  _HomePageState createState() => _HomePageState();
  HomePage({@required this.currentIndex});
}

class _HomePageState extends State<HomePage> {
  final tabs = [
    LandingPage(),
    SearchPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            widget.currentIndex = index;
          });
        },
        currentIndex: widget.currentIndex,
        showUnselectedLabels: false,
        selectedLabelStyle: GoogleFonts.montserrat(
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        unselectedItemColor: Theme.of(context).backgroundColor,
        selectedItemColor: Theme.of(context).accentColor,
        items: [
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.home,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.search,
            ),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.userAlt,
            ),
            label: "Profile",
          ),
        ],
      ),
      body: tabs[widget.currentIndex],
    );
  }
}
