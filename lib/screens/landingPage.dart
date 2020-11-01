import 'package:TheDeliverer/animations/BounceIn.dart';
import 'package:TheDeliverer/main.dart';
import 'package:TheDeliverer/providers/reg.dart';
import 'package:TheDeliverer/screens/foodCard.dart';
import 'package:TheDeliverer/providers/userDetails.dart';
import 'package:TheDeliverer/screens/orderPage.dart';
import 'package:TheDeliverer/screens/restaurantCard.dart';
import 'package:TheDeliverer/screens/selectAddress.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'globals.dart' as globals;
import 'package:provider/provider.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  void initState() {
    super.initState();
    visitScreen();
  }

  bool isLoading = false;
  Future<void> visitScreen() async {
    setState(() {
      isLoading = true;
    });
    await Provider.of<User>(context, listen: false)
        .fetchDetails(Provider.of<Reg>(context, listen: false).token);
    setState(() {
      isLoading = false;
    });
  }

  final List specialOffers = [
    {
      "name": "Tandoori Momos",
      "description": "Veg Tandoori Momos made with special sauce.",
      "price": "299",
    },
    {
      "name": "Veg Lollipop",
      "description": "Spicy mix vegetable fried.",
      "price": "199",
    },
    {
      "name": "Paneer Butter Masala",
      "description": "Paneer with red rich butter gravy.",
      "price": "399",
    },
    {
      "name": "Monster",
      "description": "Monster Energy Drink.",
      "price": "90",
    },
    {
      "name": "Garlic Naan",
      "description": "Naan bread with butter and Garlic.",
      "price": "199",
    },
  ];
  final List restaurants = [
    {
      "name": "Raj Mahal",
      "address": "Raj Mahal, Akota Circle, Rajkot",
      "distance": "1.3",
      "items": [
        {
          "name": "Rajma Chawal",
          "price": "60",
          "description": "Your favourite rajma chawal!",
        },
        {
          "name": "Kadhi Chawal",
          "price": "40",
          "description": "Your favourite kadhi chawal!",
        },
      ],
    },
    {
      "name": "Surya Palace",
      "address": "Gotri",
      "distance": "7.2",
      "items": [
        {
          "name": "Dry Manchurian",
          "price": "60",
          "description": "Your favourite chinese balls!",
        },
        {
          "name": "Butter Naan",
          "price": "40",
          "description": "Indian Flatbread!",
        },
      ],
    },
    {
      "name": "McDonald's",
      "address": "Near FIITJEE, Sevasi",
      "distance": "3.7",
      "items": [
        {
          "name": "McVeggie",
          "price": "60",
          "description": "Burger!",
        },
        {
          "name": "McAloo Tikki",
          "price": "40",
          "description": "Burger!",
        },
      ],
    },
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return isLoading
        ? Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 15.5 / 100,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: size.width * 4 / 100),
                      child: Text(
                        "Our best Offers!",
                        style: GoogleFonts.montserrat(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: Theme.of(context).backgroundColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 2 / 100,
                    ),
                    Container(
                      height: size.height * 20 / 100,
                      width: double.maxFinite,
                      child: ListView.builder(
                        shrinkWrap: false,
                        scrollDirection: Axis.horizontal,
                        itemCount: specialOffers.length,
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 4 / 100),
                        itemBuilder: (context, index) {
                          return Container(
                            margin:
                                EdgeInsets.only(right: size.width * 4 / 100),
                            child: FoodCard(
                              name: specialOffers[index]['name'],
                              description: specialOffers[index]['description'],
                              price: specialOffers[index]['price'],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: size.height * 2 / 100,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: size.width * 4 / 100),
                      child: Text(
                        "Our favourite Restaurants!",
                        style: GoogleFonts.montserrat(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: Theme.of(context).backgroundColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 2 / 100,
                    ),
                    Container(
                      height: size.height * 20 / 100,
                      width: double.maxFinite,
                      child: ListView.builder(
                        shrinkWrap: false,
                        scrollDirection: Axis.horizontal,
                        itemCount: restaurants.length,
                        itemBuilder: (context, index) {
                          return Container(
                            child: FlatButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  BounceIn(
                                    widget: OrderPage(
                                      name: restaurants[index]['name'],
                                      items: restaurants[index]['items'],
                                    ),
                                  ),
                                );
                              },
                              child: RestaurantCard(
                                name: restaurants[index]['name'],
                                address: restaurants[index]['address'],
                                distance: restaurants[index]['distance'],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 4.5 / 100,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: size.width * 4 / 100),
                      child: Text(
                        "Now Delivering to",
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).backgroundColor,
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FlatButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              BounceIn(
                                widget: SelectAddressScreen(),
                              ),
                            );
                          },
                          child: Container(
                            child: Text(
                              globals.currentAddress.isEmpty
                                  ? "Select an Address"
                                  : globals.currentAddress["city"] +
                                      ', ' +
                                      globals.currentAddress["state"],
                              style: GoogleFonts.montserrat(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.only(right: size.width * 4 / 100),
                          child: IconButton(
                            icon: Icon(
                              FontAwesomeIcons.signOutAlt,
                              size: 20,
                              color: Theme.of(context).accentColor,
                            ),
                            onPressed: () async {
                              await Provider.of<Reg>(context, listen: false)
                                  .logout();
                              RestartWidget.restartApp(context);
                            },
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 0.3,
                      width: double.infinity,
                      color: Theme.of(context).backgroundColor,
                      margin: EdgeInsets.symmetric(
                          horizontal: size.width * 4 / 100),
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}
