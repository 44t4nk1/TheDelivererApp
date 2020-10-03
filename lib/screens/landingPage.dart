import 'package:TheDeliverer/screens/foodCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
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
  final List restaurants = [];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
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
                  padding:
                      EdgeInsets.symmetric(horizontal: size.width * 4 / 100),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(right: size.width * 4 / 100),
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
                  itemCount: specialOffers.length,
                  padding:
                      EdgeInsets.symmetric(horizontal: size.width * 4 / 100),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(right: size.width * 4 / 100),
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
                  padding:
                      EdgeInsets.symmetric(horizontal: size.width * 4 / 100),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(right: size.width * 4 / 100),
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
                  padding:
                      EdgeInsets.symmetric(horizontal: size.width * 4 / 100),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(right: size.width * 4 / 100),
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
                  padding:
                      EdgeInsets.symmetric(horizontal: size.width * 4 / 100),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(right: size.width * 4 / 100),
                      child: FoodCard(
                        name: specialOffers[index]['name'],
                        description: specialOffers[index]['description'],
                        price: specialOffers[index]['price'],
                      ),
                    );
                  },
                ),
              )
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
                  Container(
                    padding: EdgeInsets.only(left: size.width * 4 / 100),
                    child: Text(
                      "Rajkot, Gujarat",
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.only(right: size.width * 4 / 100),
                    child: IconButton(
                      icon: Icon(
                        FontAwesomeIcons.shoppingBasket,
                        size: 20,
                        color: Theme.of(context).accentColor,
                      ),
                      onPressed: () {},
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
