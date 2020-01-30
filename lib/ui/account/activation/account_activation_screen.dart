import 'package:camy_store/ui/account/details/account_details_screen.dart';
import 'package:camy_store/ui/common/my_app_bar.dart';
import 'package:camy_store/utils/dimens.dart';
import 'package:camy_store/utils/tools.dart';
import 'package:camy_store/utils/values.dart';
import 'package:flutter/material.dart';

class AccountActivationScreen extends StatefulWidget {
  AccountActivationScreen({Key key}) : super(key: key);

  @override
  _AccountActivationScreenState createState() =>
      _AccountActivationScreenState();
}

class _AccountActivationScreenState extends State<AccountActivationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            top: Dimens.Height * .15,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Code d'activation\n",
                            style: TextStyle(
                                fontFamily: "Gotham",
                                color: Values.greyedTextMedium,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0)),
                        WidgetSpan(
                            child: SizedBox(
                              height: Dimens.Height * .05,
                            )),
                        TextSpan(
                            text:
                            "Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit.",
                            style: TextStyle(
                                fontFamily: "Gotham",
                                fontWeight: FontWeight.w300,
                                color: Values.greyedTextMedium,
                                fontSize: 12.0)),
                      ])),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 36.0),
                    child: Card(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 67.0, vertical: 19.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                              3,
                                  (i) => Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  SizedBox(
                                    height: 66.0,
                                    width: 30.0,
                                  ),
                                  Container(
                                    width: 45.0,
                                    height: 1.0,
                                    color: Values.greyedTextLight,
                                  )
                                ],
                              )),
                        ),
                      ),
                    ),
                  ),
                  MaterialButton(
                    padding: EdgeInsets.symmetric(vertical: 17.0, horizontal: 28.0),
                    onPressed: () {
                      _showAcountDialog();
                    },
                    child: Text("Activer mon compte".toUpperCase()),
                    color: Values.primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(500.0)),
                    textColor: Colors.white,
                    elevation: 3.0,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: .0,
            child: MyAppBar(
              title: "Inscription",
            ),
          )
        ],
      ),
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
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white),
                      width: Dimens.Width * .9,
                      //height: Dimens.Height * .22,
                      padding: EdgeInsets.all(5.0),
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
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: SizedBox(
                                width: Dimens.Width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(
                                            children: [
                                              TextSpan(
                                                  text: "Oops!\n",
                                                  style: TextStyle(
                                                      color: Values.greyedText,
                                                      fontFamily: 'Gotham',
                                                      fontSize: 16.5,
                                                      fontWeight: FontWeight.bold)),
                                              WidgetSpan(child: Container(height: 10.0,)),
                                              TextSpan(
                                                  text:
                                                  "Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit.",
                                                  style: TextStyle(
                                                      fontFamily: "Gotham",
                                                      color: Values.greyedText,
                                                      fontWeight: FontWeight.w300,
                                                      fontSize: 12.5)),
                                            ]
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                                      child: MaterialButton(
                                        onPressed: () {
                                          setState(() {
                                            Navigator.pop(context);
                                            _push();
                                          });;
                                        },
                                        color: Values.primaryColor,
                                        child: Text("Renvoyer".toUpperCase()),
                                        textColor: Colors.white,
                                        padding: EdgeInsets.symmetric(vertical: 8.0),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(500.0)),
                                        minWidth: Dimens.Width * .45,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  void _push() {
    Tools.queue.addLast(this.context);
    Navigator.push(context, MaterialPageRoute(builder: (context) => AccountDetailsScreen()));
  }


  void _pop() {
    Navigator.pop(context);
  }
}