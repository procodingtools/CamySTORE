import 'package:camy_store/utils/dimens.dart';
import 'package:camy_store/utils/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FavItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        elevation: 5.0,
        child: Padding(
          padding: const EdgeInsets.only(left: 13.0, right: 23.0),
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top:22.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/ZStore.png"),
                      radius: 27.0,
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding:
                      const EdgeInsets.only(left: 10.0, top: 25.0, right: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: "Zircontours\n".toUpperCase(),
                                  style: TextStyle(
                                      fontFamily: 'Gotham',
                                      fontWeight: FontWeight.bold,
                                      color: Values.greyedText,
                                      fontSize: 16.0)),

                              TextSpan(
                                  text: "Voyage & tourism\n",
                                  style: TextStyle(
                                      color: Values.greyedText,
                                      fontSize: 12.0,
                                      fontFamily: 'Gotham',
                                      fontWeight: FontWeight.w500)),
                              WidgetSpan(child: Container(height: 5.0,)),
                              TextSpan(
                                  text:
                                  "Lorem ipsum dolor sit amet, facer adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco",
                                  style: TextStyle(
                                    fontFamily: 'Gotham',
                                      fontWeight: FontWeight.w200,
                                      color: Values.greyedText, fontSize: 12.0)),
                            ]),
                            maxLines: 5,
                            softWrap: true,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.clip,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(top: 17.0, left: 5.0, right: 5.0, bottom: 10.0),
                child: Divider(
                  height: 2.0,
                  thickness: 1.0,
                ),
              ),

              Padding(
                padding: EdgeInsets.only(bottom: 13.0, right: 5.0, left: 5.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SvgPicture.asset("assets/ic_share.svg",
                            //width: 20.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text("Partager", style: TextStyle(color: Values.greyedText, fontWeight: FontWeight.w400, fontSize: 11.5, fontFamily: 'Gotham'),),
                          )
                        ],
                      ),
                      Expanded(child: Container()),
                      SvgPicture.asset("assets/ic_menu_dots.svg",),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
