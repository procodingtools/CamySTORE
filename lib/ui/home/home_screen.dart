import 'dart:collection';

import 'package:camy_store/ui/common/bottom_nav.dart';
import 'package:camy_store/utils/tools.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home_page/home_page.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  int _selectedPage;

  BuildContext _context;

  DateTime _popTime;

  bool _showBottomNav = true;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    _selectedPage = 0;
    //Tools.fullScreen(enabled: false);
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.bottom, SystemUiOverlay.top]);
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.black));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black, //or set color with: Color(0xFF0000FF)
    ));
    return WillPopScope(
      onWillPop: () {
        if (Tools.queue.isNotEmpty) {
          Navigator.pop(Tools.queue.removeLast());
          return Future.value(false);
        } else if (_popTime == null ||
            DateTime.now().difference(_popTime) > Duration(seconds: 2)) {
          _scaffoldKey.currentState.showSnackBar(SnackBar(
            content: Text("Appuyez une autre fois pour quitter"),
            duration: Duration(seconds: 2),
          ));
          _popTime = DateTime.now();
          return Future.value(false);
        }
        return Future.value(true);
      },
      child: Scaffold(
        key: _scaffoldKey,
        body: Stack(
          children: <Widget>[
            Positioned.fill(
                child: Opacity(
                    opacity: .0,
                    child: Image.asset("assets/accountup.png"))),
            Positioned.fill(child: SafeArea(
              child: Opacity(
                opacity: 1,
                child: Container(
                  child: Navigator(onGenerateRoute: (settings) {
                    return MaterialPageRoute(builder: (context) {
                      //_queue.addLast(context);
                      _context = context;
                      Tools.context = context;
                      return HomePage();
                    });
                  }),
                ),
              ),
            )),
            Positioned(
              bottom: 1.0,
              child: Opacity(
                opacity: 1.0,
                child: BottomNav(
                  selectedPage: _selectedPage,
                  parentContext: _context,
                  onPageChanged: (page) {
                    setState(() {
                      _selectedPage = page;
                    });
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}
