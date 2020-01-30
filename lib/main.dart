import 'package:camy_store/ui/splash_screen.dart';
import 'package:camy_store/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
          fontFamily: "Gotham"
        );

    //Tools.fullScreen();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.

          textTheme: TextTheme(
            body1: TextStyle(),
            body2: TextStyle(),
          ).apply(bodyColor: Colors.white, displayColor: Colors.white),
          primarySwatch: Colors.blue,
          fontFamily: 'Gotham'),
      home: SplashScreen(),
    );
  }
}
