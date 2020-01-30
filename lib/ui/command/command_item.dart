import 'package:camy_store/utils/dimens.dart';
import 'package:camy_store/utils/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommandItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      elevation: 5.0,
      child: SizedBox(
        height: Dimens.Width * .32,
        child: Stack(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.asset(
                      "assets/bg1.png",
                      width: Dimens.Width * .34,
                      height: Dimens.Width * .32,
                      fit: BoxFit.cover,
                    )),
                Flexible(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 15.0, top: 15.0, right: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "Maldive\n".toUpperCase(),
                                style: TextStyle(
                                    fontFamily: 'Gotham',
                                    fontWeight: FontWeight.bold,
                                    color: Values.greyedText,
                                    fontSize: 17.5)),
                            TextSpan(
                                text: "Par: ",
                                style: TextStyle(
                                    color: Values.greyedText, fontSize: 10.0)),
                            TextSpan(
                                text: "Go Voyage\n",
                                style: TextStyle(
                                    color: Values.greyedText,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500)),
                            TextSpan(
                                text:
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco",
                                style: TextStyle(
                                    color: Values.greyedText, fontSize: 10.0)),
                          ]),
                          maxLines: 4,
                          softWrap: true,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.clip,
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        Divider(
                          height: 2.0,
                          thickness: 1.0,
                        ),
                        Expanded(child: Container()),
                        Padding(
                          padding: EdgeInsets.only(bottom: .0),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Row(
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      "150 000",
                                      style: TextStyle(
                                          fontFamily: 'Gotham',
                                          color: Values.primaryColor,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      " DZD",
                                      style: TextStyle(
                                        fontFamily: 'Gotham',
                                        color: Values.primaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 9.0,
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(child: Container()),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(onTap: () => print(''),child: SvgPicture.asset("assets/ic_plus.svg", )),
                                ),
                                ConstrainedBox(
                                  constraints: BoxConstraints(minWidth: 9.0),
                                    child: Center(
                                        child: Text(
                                  "5",
                                  style: TextStyle(
                                      color: Values.greyedText,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17.0),
                                ))),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(onTap: () => print(''),child: SvgPicture.asset("assets/ic_minus.svg")),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(child: Container()),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Positioned(child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: Icon(Icons.close, size: 22.0, color: Values.greyedTextLight,),
            ), top: .0, right: .0,)
          ],
        ),
      ),
    );
  }
}
