import 'package:TheDeliverer/providers/reg.dart';
import 'package:TheDeliverer/providers/restaurants.dart';
import 'package:TheDeliverer/providers/userDetails.dart';
import 'package:TheDeliverer/screens/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import './screens/loginPage.dart';

void main() {
  runApp(
    RestartWidget(
      child: MyApp(),
    ),
  );
}

class RestartWidget extends StatefulWidget {
  RestartWidget({this.child});

  final Widget child;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>().restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Reg(),
        ),
        ChangeNotifierProvider.value(
          value: User(),
        ),
        ChangeNotifierProvider.value(
          value: Restaurant(),
        ),
      ],
      child: Consumer<Reg>(
        builder: (context, reg, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            brightness: Brightness.light,
            canvasColor: Color(0xffffffff),
            accentColor: Color(0xff0047ed),
            secondaryHeaderColor: Color(0xff595fff),
            backgroundColor: Color(0xff212121),
            textTheme: TextTheme(
              bodyText1: TextStyle(
                color: Color(0xff212121),
              ),
            ),
          ),
          home: reg.isReg
              ? HomePage(
                  currentIndex: 0,
                )
              : FutureBuilder(
                  future: reg.tryAutoLogin(),
                  builder: (context, res) {
                    if (res.connectionState == ConnectionState.waiting) {
                      return Scaffold(
                        body: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else {
                      if (res.data) {
                        return HomePage(
                          currentIndex: 0,
                        );
                      } else {
                        return LoginPage();
                      }
                    }
                  },
                ),
        ),
      ),
    );
  }
}
