import 'package:camy_store/utils/dimens.dart';
import 'package:camy_store/utils/values.dart';
import 'package:flutter/material.dart';

class NoFavWidget extends StatelessWidget {

  final VoidCallback onTap;

  const NoFavWidget({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final size = constraints.biggest;
      print(size.width);
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 10.0,),
                child: Image.asset(
                  "assets/img_no_fav.png",
                  width: size.width * .7,
                ),
              )),
          Padding(
            padding: EdgeInsets.only(top: Dimens.Height * .03, bottom: Dimens.Height * .07),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                TextSpan(
                    text: "oops!",
                    style: TextStyle(
                        color: Values.greyedText,
                        fontFamily: 'Gotham',
                        fontSize: 16.5,
                        fontWeight: FontWeight.bold)),
                WidgetSpan(child: Container(height: 7.0,)),
                TextSpan(
                    text:
                    "\nLorem ipsum dolor sit amet,\nconsectetur adipiscing elit.",
                    style: TextStyle(
                        fontFamily: "Gotham",
                        fontWeight: FontWeight.w500,
                        color: Values.greyedText,
                        fontSize: 11.5)),
              ]),
            ),
          ),
          MaterialButton(
            onPressed: onTap,
            color: Values.primaryColor,
            child: Text("Faire unr refraiche".toUpperCase()),
            textColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 17.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(500.0)),
            minWidth: Dimens.Width * .65,
          ),
        ],
      );
    });
  }
}
