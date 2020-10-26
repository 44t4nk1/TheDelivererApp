import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
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
      body: Center(
        child: FlatButton(
          child: Text("view list"),
          onPressed: () {
            print(widget.items.toString());
          },
        ),
      ),
    );
  }
}
