import 'dart:collection';

import 'package:camy_store/ui/account/account_screen.dart';
import 'package:camy_store/ui/account/details/account_details_screen.dart';
import 'package:camy_store/utils/dimens.dart';
import 'package:camy_store/utils/tools.dart';
import 'package:camy_store/utils/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccountHistoryScreen extends StatefulWidget {
  AccountHistoryScreen({Key key}) : super(key: key);

  @override
  _AccountHistoryScreenState createState() => _AccountHistoryScreenState();
}

class _AccountHistoryScreenState extends State<AccountHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          height: Dimens.Height * .307,
          width: Dimens.Width,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5.0)]),
            child: Stack(
              children: <Widget>[
                Positioned(
                    top: .0,
                    child: Container(
                      height: Dimens.Height * .19,
                      width: Dimens.Width,
                      decoration: BoxDecoration(
                          color: Values.primaryColor.withOpacity(.3),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(500.0))),
                    )),
                Positioned(
                  top: .0,
                  left: .0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        width: Dimens.Width,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            InkWell(
                              onTap: () => Navigator.pop(Tools.queue.removeLast()),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0,
                                    bottom: 10.0,
                                    left: 10.0,
                                    right: 6.0),
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Values.greyedText,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 2.0),
                              child: Text(
                                "Mon comte",
                                style: TextStyle(
                                    color: Values.greyedText,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.0,
                                    fontFamily: 'Gotham'),
                              ),
                            ),
                            Expanded(child: Container()),
                            InkWell(
                              onTap: () => _showAcountDialog(),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 22.0, top: 10.0, bottom: 10.0),
                                child: SvgPicture.asset(
                                  "assets/ic_menu_dots.svg",
                                  //width: 6.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: Dimens.Height * .03, left: 20.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage:
                              AssetImage("assets/porfile_pic.png"),
                              radius: 37.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "Karim Abid\n",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Gotham',
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                        text: "El Eulma, Sétif",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Gotham',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12.0))
                                  ])),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 28.0, left: 20.0, right: 20.0),
                        child: SizedBox(
                          width: Dimens.Width - 45.0,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Mon historique",
                                style: TextStyle(
                                    color: Values.greyedTextMedium,
                                    fontWeight: FontWeight.bold),
                              ),
                              Expanded(child: Container()),
                              Container(
                                margin: EdgeInsets.only(right: 13.0),
                                padding: EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 10.0),
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(500.0),
                                    border: Border.all(
                                        width: .5, color: Values.greyedTextMedium)),
                                child: Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    SvgPicture.asset(
                                      "assets/ic_filter.svg",
                                      //width: 12.0,
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(left: 6.0),
                                      child: Text(
                                        "Filtre par",
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            color: Values.greyedTextMedium,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Gotham'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 5.0),
                                child: SvgPicture.asset(
                                  "assets/ic_delete.svg",
                                  color: Values.greyedTextMedium,
                                  //width: 12.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: Dimens.Height - (Dimens.Height * .41),
          width: Dimens.Width,
          child: ListView.builder(
            itemCount: 5,
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  elevation: 5.0,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Values.primaryColor,
                                      shape: BoxShape.circle,
                                    ),
                                    padding: EdgeInsets.all(12.0),
                                    child: SvgPicture.asset(
                                      "assets/ic_search.svg",
                                      color: Colors.white,
                                      width: 13.0,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0, top: 3.0),
                                    child: RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text: "Voyage matie\n",
                                              style: TextStyle(
                                                  color: Values.greyedTextMedium,
                                                  fontFamily: 'Gotham',
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.bold)),
                                          WidgetSpan(
                                              child: Container(
                                                height: 18.0,
                                              )),
                                          TextSpan(
                                              text: "Recherche",
                                              style: TextStyle(
                                                  color: Values.greyedTextMedium,
                                                  fontFamily: 'Gotham',
                                                  fontSize: 12.0)),
                                        ])),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(child: Container()),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Icon(
                                Icons.close,
                                color: Values.greyedTextMedium,
                              ),
                            )
                          ],
                        ),
                        Divider(
                          color: Values.greyedText,
                          height: 16.0,
                          thickness: .5,
                        ),
                        Text(
                          "Le 18-02-2019",
                          style: TextStyle(
                              color: Values.greyedText, fontSize: 11.0),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  void _showAcountDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: Dimens.Width,
              height: Dimens.Height,
              decoration:
              BoxDecoration(color: Values.primaryColor.withOpacity(.6)),
              child: GestureDetector(
                onTap: () => print(''),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white),
                    width: Dimens.Width * .9,
                    //height: Dimens.Height * .22,
                    padding: EdgeInsets.all(20.0),
                    child: Material(
                      textStyle: TextStyle(color: Colors.black),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                                onTap: () => Navigator.pop(context),
                                child: Icon(
                                  Icons.clear,
                                  color: Colors.grey,
                                )),
                          ),
                          InkWell(
                            onTap: () {
                              print('pressed');
                              Navigator.pop(context);
                              _push(AccountDetailsScreen());
                            },
                            child: Container(
                              child: Center(child: Text("Mon profle", style: TextStyle(color: Values.greyedText, fontSize: 14.0, fontWeight: FontWeight.w600, fontFamily:'Gotham'),)),
                              padding: EdgeInsets.only(top: 1.0, bottom: 15.0),
                              width: Dimens.Width,
                            ),
                          ),
                          Divider(height: 1.0, thickness: 1.0,),
                          MaterialButton(
                            onPressed: () {
                              Navigator.pop(context);
                              _push(AccountScreen());
                            },
                            child: Text("Deconnecter"),
                            textColor: Values.greyedText,
                            minWidth: Dimens.Width,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  void _push(Widget route) {
    Tools.queue.addLast(this.context);
    Navigator.push(this.context, MaterialPageRoute(builder: (context) => route));
  }


}