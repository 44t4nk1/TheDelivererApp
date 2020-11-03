import 'package:TheDeliverer/animations/BounceIn.dart';
import 'package:TheDeliverer/providers/reg.dart';
import 'package:TheDeliverer/providers/userDetails.dart';
import 'package:TheDeliverer/screens/addAddressScreen.dart';
import 'package:TheDeliverer/screens/editProfilePage.dart';
import 'package:TheDeliverer/screens/orderCard.dart';
import 'package:TheDeliverer/screens/pastOrderPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int code;
  bool isLoading = false;
  Map userDetails;
  List<dynamic> addresses = [];
  List<dynamic> pendingOrders = [];
  List<Map<String, dynamic>> orders = [
    {
      "name": "Taara Maa",
      "status": "Delivered",
      "price": "200",
      "date": "27/10/20",
      "items": [
        {
          "name": "Rajma Chawal",
          "price": "60",
          "quantity": "2",
          "description": "Your favourite rajma chawal!",
        },
        {
          "name": "Kadhi Chawal",
          "price": "40",
          "quantity": "3",
          "description": "Your favourite kadhi chawal!",
        },
      ],
    },
    {
      "name": "Limra",
      "status": "Pending",
      "price": "135",
      "date": "27/10/20",
      "items": [
        {
          "name": "Rajma Chawal",
          "price": "40",
          "quantity": "2",
          "description": "Your favourite rajma chawal!",
        },
        {
          "name": "Kadhi Chawal",
          "price": "50",
          "quantity": "3",
          "description": "Your favourite kadhi chawal!",
        },
      ],
    },
    {
      "name": "Taara Maa",
      "status": "Delivered",
      "price": "399",
      "date": "27/10/20",
      "items": [
        {
          "name": "Rajma Chawal",
          "price": "60",
          "quantity": "1",
          "description": "Your favourite rajma chawal!",
        },
        {
          "name": "Kadhi Chawal",
          "price": "40",
          "quantity": "1",
          "description": "Your favourite kadhi chawal!",
        },
      ],
    },
  ];

  void initState() {
    super.initState();
    visitScreen();
  }

  Future<void> visitScreen() async {
    setState(() {
      isLoading = true;
    });
    code = await Provider.of<User>(context, listen: false)
        .fetchDetails(Provider.of<Reg>(context, listen: false).token);
    userDetails = Provider.of<User>(context, listen: false).userDetails;
    await Provider.of<User>(context, listen: false)
        .pendingOrders(Provider.of<Reg>(context, listen: false).token);
    addresses = userDetails["UserAddresses"];
    pendingOrders =
        Provider.of<User>(context, listen: false).pendingOrdersList ?? [];
    setState(() {
      isLoading = false;
    });
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
        : Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                              userDetails["email"],
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
                      margin: EdgeInsets.symmetric(
                          horizontal: size.width * 4 / 100),
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
                            userDetails["phoneNumber"],
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
                      margin: EdgeInsets.symmetric(
                          horizontal: size.width * 4 / 100),
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
                              padding:
                                  EdgeInsets.only(left: size.width * 4 / 100),
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
                                  i["addressLine1"] +
                                      ', ' +
                                      i["addressLine2"] +
                                      ', ' +
                                      i["city"] +
                                      ', ' +
                                      i["state"] +
                                      ', ' +
                                      i["pinCode"].toString(),
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
                        border:
                            Border.all(color: Theme.of(context).accentColor),
                      ),
                      padding: EdgeInsets.all(
                        size.height * 1 / 100,
                      ),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            BounceIn(
                              widget: AddAddress(),
                            ),
                          );
                        },
                        splashColor: Theme.of(context).canvasColor,
                        child: Center(
                          child: Text(
                            "+ Address",
                            style: GoogleFonts.montserrat(
                              fontSize: size.height * 2 / 100,
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 3 / 100,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: size.width * 4 / 100),
                      child: Text(
                        "Pending Orders",
                        style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    for (var item in pendingOrders)
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: size.height * 1 / 100,
                        ),
                        child: pendingOrders[0]["orders"] == 0
                            ? Container(
                                height: size.height * 5 / 100,
                                width: double.infinity,
                                child: Center(
                                  child: Text(
                                    "You have no pending orders!",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              )
                            : FlatButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    BounceIn(
                                        widget: PastOrder(
                                      restaurantname: item["Restaurant"]
                                          ["restaurantName"],
                                      items: item["OrderItems"],
                                    )),
                                  );
                                },
                                child: OrderCard(
                                  name: item["Restaurant"]["restaurantName"],
                                  status: item["orderStatus"],
                                  price: item["total"],
                                  date: DateTime.parse(item["orderDate"]),
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
                            "Hello, " + userDetails["name"],
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
