import 'dart:ui';

import 'package:camy_store/ui/account/account_screen.dart';
import 'package:camy_store/ui/account/details/account_details_screen.dart';
import 'package:camy_store/ui/account/history/account_history_screen.dart';
import 'package:camy_store/ui/common/account_edit.dart';
import 'package:camy_store/ui/common/bottom_nav.dart';
import 'package:camy_store/ui/common/my_app_bar.dart';
import 'package:camy_store/utils/dimens.dart';
import 'package:camy_store/utils/tools.dart';
import 'package:camy_store/utils/tools.dart';
import 'package:camy_store/utils/values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rubber/rubber.dart';

class CreateAccount extends StatefulWidget {
  CreateAccount({Key key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount>{
  RubberAnimationController _rubberController;
  BuildContext thisContext;

  @override
  void initState() {
    // TODO: implement initState
    thisContext = context;
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _rubberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: SafeArea(
              child: _noAccount()
              /*IndexedStack(
                children: <Widget>[
                  //_noAccount(),
                  //_accountHistory(),
                  //_accountDetails(),
                  //_inputActivationCode(),
                  *//*AccountScreen(
                    vsync: this,
                  )*//*
                ],
              )*/,
            ),
          ),
          Positioned(
            top: .0,
            child: MyAppBar(title: "Mon comte",),
          ),
          /*_stackIndex != 1
              ? Positioned(
                  top: .0,
                  child: MyAppBar(
                    title: _stackIndex == 1
                        ? "Mon profile"
                        : "Inscription",
                    elevated: _stackIndex != 1,
                    actions: _stackIndex == 1
                        ? <Widget>[
                            InkWell(
                              onTap: () => print(''),
                              child: Image.asset("assets/ic_menu.png"),
                            )
                          ]
                        : [],
                    onTap: () {
                      if (_stackIndex > 0)
                        setState(() {
                          _stackIndex--;
                        });
                      else
                        Navigator.pop(Tools.queue.removeLast());
                    },
                  ),
                )
              : Container(),*/
        ],
      ),
    );
  }


  Widget _noAccount() {
    return LayoutBuilder(builder: (context, constraints) {
      final size = constraints.biggest;
      print(size.width);
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: Dimens.Height * .15, bottom: 10.0),
                child: Image.asset(
                  "assets/no_account_header.png",
                  width: size.width * .53,
                ),
              )),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              TextSpan(
                  text: "oops!",
                  style: TextStyle(
                      color: Values.greyedText,
                      fontFamily: 'Gotham',
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold)),
              WidgetSpan(child: Container(height: 5.0,)),
              TextSpan(
                  text:
                      "\nLorem ipsum dolor sit amet,\nconsectetur adipiscing elit.",
                  style: TextStyle(
                      fontFamily: "Gotham",
                      color: Values.greyedText,
                      fontWeight: FontWeight.w300,
                      fontSize: 12.0)),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0, bottom: 6.0),
            child: MaterialButton(
              onPressed: () {
                setState(() {
                  Tools.queue.addLast(this.context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AccountHistoryScreen()));
                });;
              },
              color: Values.primaryColor,
              child: Text("Se connecter".toUpperCase()),
              textColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 17.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(500.0)),
              minWidth: Dimens.Width * .6,
            ),
          ),
          MaterialButton(
            onPressed: () {
                Tools.queue.addLast(this.context);
                Navigator.push(Tools.context, MaterialPageRoute(builder: (context) => AccountDetailsScreen()));
            },
            color: Values.greyedTextMedium,
            child: Text("S'inscrire".toUpperCase()),
            textColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 17.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(500.0)),
            minWidth: Dimens.Width * .6,
          )
        ],
      );
    });
  }

}
