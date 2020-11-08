import 'package:TheDeliverer/animations/BounceIn.dart';
import 'package:TheDeliverer/providers/reg.dart';
import 'package:TheDeliverer/providers/restaurants.dart';
import 'package:TheDeliverer/screens/orderPlaced.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatefulWidget {
  final String name;
  final String restaurantId;
  @override
  _OrderPageState createState() => _OrderPageState();
  OrderPage({
    @required this.name,
    @required this.restaurantId,
  });
}

class _OrderPageState extends State<OrderPage> {
  void initState() {
    super.initState();
    visitScreen();
  }

  bool _isButtonDisabled = false;
  List<dynamic> items = [];
  bool isLoading = false;
  Future<void> visitScreen() async {
    setState(() {
      isLoading = true;
    });
    items = await Provider.of<Restaurant>(context, listen: false).fetchItems(
        widget.restaurantId, Provider.of<Reg>(context, listen: false).token);
    for (var item in items) {
      item["quantity"] = 0;
    }
    setState(() {
      isLoading = false;
    });
  }

  List<Map> finalItems = [];
  int total = 0;
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
                widget.name,
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (var item in items)
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: size.width * 50 / 100,
                                    margin: EdgeInsets.only(
                                        top: size.height * 2 / 100,
                                        left: size.width * 6 / 100),
                                    child: Text(
                                      item["itemName"],
                                      style: GoogleFonts.montserrat(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: size.width * 50 / 100,
                                    margin: EdgeInsets.only(
                                        top: size.height * 0.2 / 100,
                                        left: size.width * 6 / 100),
                                    child: Text(
                                      item["itemDescription"],
                                      style: GoogleFonts.montserrat(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Container(
                                margin: EdgeInsets.only(
                                  top: size.height * 2 / 100,
                                ),
                                child: Text(
                                  '₹' + item["price"].toString(),
                                  style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        FontAwesomeIcons.minus,
                                        color: Color(0xfff55a42),
                                        size: 18,
                                      ),
                                      onPressed: () {
                                        if (item["quantity"] > 0) {
                                          setState(() {
                                            item["quantity"] =
                                                item["quantity"] - 1;
                                            total = 0;
                                            for (var i in items) {
                                              total = total +
                                                  i["quantity"] * i["price"];
                                            }
                                          });
                                        }
                                      },
                                    ),
                                    Container(
                                      width: size.width * 2 / 100,
                                      child: Text(
                                        item["quantity"].toString(),
                                        style: GoogleFonts.montserrat(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        FontAwesomeIcons.plus,
                                        color: Color(0xff42f59e),
                                        size: 18,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          item["quantity"] =
                                              item["quantity"] + 1;
                                          total = 0;
                                          for (var i in items) {
                                            total = total +
                                                i["quantity"] * i["price"];
                                          }
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      SizedBox(
                        height: size.height * 2 / 100,
                      ),
                      Container(
                        height: 0.3,
                        margin: EdgeInsets.symmetric(
                            horizontal: size.width * 4 / 100),
                        color: Theme.of(context).backgroundColor,
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: size.height * 2 / 100,
                            left: size.width * 6 / 100),
                        child: Text(
                          "Your total amount",
                          style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: size.height * 1 / 100,
                            left: size.width * 6 / 100),
                        child: Text(
                          '₹ ' + total.toString(),
                          style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 20 / 100,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: size.height * 75 / 100,
                    left: size.width * 10 / 100,
                    right: size.width * 10 / 100,
                  ),
                  height: size.height * 7 / 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                    color: Theme.of(context).accentColor,
                  ),
                  child: FlatButton(
                    onPressed: _isButtonDisabled
                        ? null
                        : () {
                            setState(() {
                              _isButtonDisabled = true;
                            });
                            for (var i in items) {
                              if (i["quantity"] > 0) {
                                var item = {
                                  "itemId": i["itemId"],
                                  "quantity": i["quantity"],
                                };
                                finalItems.add(item);
                              }
                            }

                            Navigator.push(
                              context,
                              BounceIn(
                                widget: OrderPlaced(
                                  restaurantId: widget.restaurantId,
                                  items: finalItems,
                                  total: total,
                                ),
                              ),
                            );
                          },
                    splashColor: Theme.of(context).accentColor,
                    child: Center(
                      child: Text(
                        "Place Order",
                        style: GoogleFonts.montserrat(
                          fontSize: size.height * 2.2 / 100,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).canvasColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
