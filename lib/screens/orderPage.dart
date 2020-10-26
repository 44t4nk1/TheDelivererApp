import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderPage extends StatefulWidget {
  final String name;
  final List<Map<String, dynamic>> items;
  @override
  _OrderPageState createState() => _OrderPageState();
  OrderPage({
    @required this.name,
    @required this.items,
  });
}

class _OrderPageState extends State<OrderPage> {
  void initState() {
    super.initState();
    for (var item in widget.items) {
      item["quantity"] = "0";
    }
  }

  int total = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
                for (var item in widget.items)
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: size.width * 35 / 100,
                              margin: EdgeInsets.only(
                                  top: size.height * 2 / 100,
                                  left: size.width * 6 / 100),
                              child: Text(
                                item["name"],
                                style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Container(
                              width: size.width * 45 / 100,
                              margin: EdgeInsets.only(
                                  top: size.height * 0.2 / 100,
                                  left: size.width * 6 / 100),
                              child: Text(
                                item["description"],
                                style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Container(
                          margin: EdgeInsets.only(
                            right: size.width * 1 / 100,
                            top: size.height * 2 / 100,
                          ),
                          child: Text(
                            '₹' + item["price"],
                            style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: size.height * 1 / 100,
                          ),
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
                                  if (int.parse(item["quantity"]) > 0) {
                                    setState(() {
                                      item["quantity"] =
                                          (int.parse(item["quantity"]) - 1)
                                              .toString();
                                      total = 0;
                                      for (var i in widget.items) {
                                        total = total +
                                            (int.parse(i["quantity"]) *
                                                int.parse(i["price"]));
                                      }
                                    });
                                  }
                                },
                              ),
                              Container(
                                width: size.width * 2 / 100,
                                child: Text(
                                  item["quantity"],
                                  style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
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
                                        (int.parse(item["quantity"]) + 1)
                                            .toString();
                                    total = 0;
                                    for (var i in widget.items) {
                                      total = total +
                                          (int.parse(i["quantity"]) *
                                              int.parse(i["price"]));
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
                  margin:
                      EdgeInsets.symmetric(horizontal: size.width * 4 / 100),
                  color: Theme.of(context).backgroundColor,
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: size.height * 2 / 100, left: size.width * 6 / 100),
                  child: Text(
                    "Your total amount",
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: size.height * 1 / 100, left: size.width * 6 / 100),
                  child: Text(
                    '₹ ' + total.toString(),
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: size.width * 25 / 100,
              right: size.width * 25 / 100,
              top: size.height * 75 / 100,
            ),
            height: size.height * 7 / 100,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
              color: Theme.of(context).accentColor,
            ),
            padding: EdgeInsets.all(
              size.height * 1 / 100,
            ),
            child: FlatButton(
              onPressed: () {
                print(widget.items.toString());
              },
              splashColor: Theme.of(context).accentColor,
              child: Center(
                child: Text(
                  "Place Order",
                  style: GoogleFonts.montserrat(
                    fontSize: size.height * 2.6 / 100,
                    fontWeight: FontWeight.w400,
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
