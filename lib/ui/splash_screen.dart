import 'package:camy_store/ui/home/home_screen.dart';
import 'package:camy_store/utils/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _width, _height;

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.black
    ));
    SystemChrome.setEnabledSystemUIOverlays ([]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.black
    ));
    // TODO: implement initState
    Future.delayed(Duration(seconds: 3)).then((_) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    Dimens.Height = _height;
    Dimens.Width = _width;
    return Container(
      color: Colors.white,
      width: _width,
      height: _height,
      child: Image.asset(
        "assets/splash_screen.png",
        width: _width,
        height: _height,
        repeat: ImageRepeat.noRepeat,
        fit: BoxFit.cover,
      ),
    );
  }
}
