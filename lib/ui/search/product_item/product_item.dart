import 'package:camy_store/ui/store/store_screen.dart';
import 'package:camy_store/utils/tools.dart';
import 'package:camy_store/utils/values.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final bool expanded;

  const ProductItem({Key key, this.expanded}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Tools.queue.addLast(context);
        Navigator.push(context, MaterialPageRoute(builder: (context) => StoreScreen()));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: Colors.grey, width: .50)),
        width: 268.0,
        height: expanded ? 115.0 : 105.0,
        margin: EdgeInsets.only(
            right: expanded ? 17.0 : 7.0,
            bottom: expanded ? 15.0 : .0,
            left: expanded ? 7.0 : .0),
        padding: EdgeInsets.only(right: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  "assets/bg1.png",
                  width: expanded ? 120.0 : 100.0,
                  fit: BoxFit.cover,
                )),
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 12.0,
                  top: expanded ? 13.0 : 10.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Maldive\n".toUpperCase(),
                            style: TextStyle(
                                fontFamily: 'Gotham',
                                fontWeight: FontWeight.bold,
                                color: Values.greyedText,
                                fontSize: expanded ? 19.0 : 16.0)),
                        TextSpan(
                            text: " Par: ",
                            style: TextStyle(
                                color: Values.greyedText,
                                fontSize: expanded ? 11.0 : 10.0)),
                        TextSpan(
                            text: "Go Voyage\n",
                            style: TextStyle(
                                color: Values.greyedText,
                                fontSize: expanded ? 11.0 : 10.0,
                                fontWeight: FontWeight.w500)),

                        TextSpan(
                            text:
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco",
                            style: TextStyle(
                                color: Values.greyedText,
                                fontSize: expanded ? 12.0 : 10.0)),
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
                      padding: EdgeInsets.only(right: expanded ? 1.0 : 0.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              "150 000",
                              style: TextStyle(
                                  fontFamily: 'Gotham',
                                  color: Values.primaryColor,
                                  fontSize: expanded ? 17.0 : 13.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              " DZD",
                              style: TextStyle(
                                fontFamily: 'Gotham',
                                color: Values.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: expanded ? 10.0 : 8.0,
                              ),
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
      ),
    );
  }
}
