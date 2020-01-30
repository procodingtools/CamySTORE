import 'package:camy_store/ui/account/activation/account_activation_screen.dart';
import 'package:camy_store/ui/common/account_edit.dart';
import 'package:camy_store/ui/common/my_app_bar.dart';
import 'package:camy_store/utils/dimens.dart';
import 'package:camy_store/utils/tools.dart';
import 'package:camy_store/utils/values.dart';
import 'package:flutter/material.dart';
import 'package:rubber/rubber.dart';

class AccountDetailsScreen extends StatefulWidget {
  AccountDetailsScreen({Key key}) : super(key: key);

  @override
  _AccountDetailsScreenState createState() => _AccountDetailsScreenState();
}

class _AccountDetailsScreenState extends State<AccountDetailsScreen>  with TickerProviderStateMixin{

  RubberAnimationController _rubberController;

  @override
  void initState() {
    // TODO: implement initState
    _rubberController = RubberAnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
      lowerBoundValue: AnimationControllerValue(percentage: .915),
      upperBoundValue: AnimationControllerValue(percentage: .915),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          RubberBottomSheet(
              animationController: _rubberController,
              upperLayer: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0)),
                    boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5.0)]),
                child: SingleChildScrollView(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          AccountEdit(
                            nameController: TextEditingController(),
                            formKey: GlobalKey<FormState>(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 50.0),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                                child: MaterialButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () => Navigator.pop(context),
                                            child: Container(
                                              width: Dimens.Width,
                                              height: Dimens.Height,
                                              decoration: BoxDecoration(
                                                  color: Values.primaryColor
                                                      .withOpacity(.6)),
                                              child: GestureDetector(
                                                onTap: () => print(''),
                                                child: Center(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                        color: Colors.white),
                                                    width: Dimens.Width * .9,
                                                    height: Dimens.Height * .75,
                                                    padding: EdgeInsets.all(20.0),
                                                    child: Material(
                                                      color: Colors.white,
                                                      textStyle: TextStyle(
                                                          color: Colors.black),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        children: <Widget>[
                                                          Align(
                                                            alignment:
                                                            Alignment.centerRight,
                                                            child: InkWell(
                                                                onTap: () =>
                                                                    Navigator.pop(
                                                                        context),
                                                                child: Icon(
                                                                  Icons.clear,
                                                                  color: Colors.grey,
                                                                )),
                                                          ),
                                                          Text(
                                                            "Terms & conditions",
                                                            style: TextStyle(
                                                                fontFamily: 'Gotham',
                                                                fontSize: 15.0,
                                                                fontWeight:
                                                                FontWeight.bold),
                                                          ),
                                                          Flexible(
                                                            child: Padding(
                                                              padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  top: 17.0,
                                                                  bottom: 25.0,
                                                                  left: 5.0),
                                                              child: Scrollbar(
                                                                child:
                                                                SingleChildScrollView(
                                                                  child: Padding(
                                                                    padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        right:
                                                                        15.0),
                                                                    child: RichText(
                                                                        text: TextSpan(
                                                                            children: [
                                                                              TextSpan(
                                                                                  text:
                                                                                  "Lorem ipsum dolor sit amet ",
                                                                                  style: TextStyle(
                                                                                      fontWeight:
                                                                                      FontWeight.bold,
                                                                                      color: Colors.grey,
                                                                                      fontSize: 15.0)),
                                                                              TextSpan(
                                                                                  text:
                                                                                  "his ad elitr phaedrum. Ei pro illum alterum pertinacia, accusamus adipiscing ea quo. Pro cu putant fabulas. Ullum recteque te nam, aeterno inermis vis ut, graeco omittam disputationi eos cu.",
                                                                                  style: TextStyle(
                                                                                      color:
                                                                                      Colors.grey,
                                                                                      fontSize: 15.0)),
                                                                              WidgetSpan(
                                                                                  child:
                                                                                  Container(
                                                                                    height:
                                                                                    30.0,
                                                                                  )),
                                                                              TextSpan(
                                                                                  text:
                                                                                  "Qui ne enim quaestio oportere, ",
                                                                                  style: TextStyle(
                                                                                      fontWeight:
                                                                                      FontWeight.bold,
                                                                                      color: Colors.grey,
                                                                                      fontSize: 15.0)),
                                                                              TextSpan(
                                                                                  text:
                                                                                  " duo id augue lobortis. Cum ei minim iisque nominavi, fierent adipiscing conclusionemque in",
                                                                                  style: TextStyle(
                                                                                      color:
                                                                                      Colors.grey,
                                                                                      fontSize: 15.0)),
                                                                              TextSpan(
                                                                                  text:
                                                                                  "Lorem ipsum dolor sit amet ",
                                                                                  style: TextStyle(
                                                                                      fontWeight:
                                                                                      FontWeight.bold,
                                                                                      color: Colors.grey,
                                                                                      fontSize: 15.0)),
                                                                              TextSpan(
                                                                                  text:
                                                                                  "his ad elitr phaedrum. Ei pro illum alterum pertinacia, accusamus adipiscing ea quo. Pro cu putant fabulas. Ullum recteque te nam, aeterno inermis vis ut, graeco omittam disputationi eos cu.",
                                                                                  style: TextStyle(
                                                                                      color:
                                                                                      Colors.grey,
                                                                                      fontSize: 15.0)),
                                                                              WidgetSpan(
                                                                                  child:
                                                                                  Container(
                                                                                    height:
                                                                                    30.0,
                                                                                  )),
                                                                              TextSpan(
                                                                                  text:
                                                                                  "Qui ne enim quaestio oportere, ",
                                                                                  style: TextStyle(
                                                                                      fontWeight:
                                                                                      FontWeight.bold,
                                                                                      color: Colors.grey,
                                                                                      fontSize: 15.0)),
                                                                              TextSpan(
                                                                                  text:
                                                                                  " duo id augue lobortis. Cum ei minim iisque nominavi, fierent adipiscing conclusionemque in",
                                                                                  style: TextStyle(
                                                                                      color:
                                                                                      Colors.grey,
                                                                                      fontSize: 15.0)),
                                                                              TextSpan(
                                                                                  text:
                                                                                  "Lorem ipsum dolor sit amet ",
                                                                                  style: TextStyle(
                                                                                      fontWeight:
                                                                                      FontWeight.bold,
                                                                                      color: Colors.grey,
                                                                                      fontSize: 15.0)),
                                                                              TextSpan(
                                                                                  text:
                                                                                  "his ad elitr phaedrum. Ei pro illum alterum pertinacia, accusamus adipiscing ea quo. Pro cu putant fabulas. Ullum recteque te nam, aeterno inermis vis ut, graeco omittam disputationi eos cu.",
                                                                                  style: TextStyle(
                                                                                      color:
                                                                                      Colors.grey,
                                                                                      fontSize: 15.0)),
                                                                              WidgetSpan(
                                                                                  child:
                                                                                  Container(
                                                                                    height:
                                                                                    30.0,
                                                                                  )),
                                                                              TextSpan(
                                                                                  text:
                                                                                  "Qui ne enim quaestio oportere, ",
                                                                                  style: TextStyle(
                                                                                      fontWeight:
                                                                                      FontWeight.bold,
                                                                                      color: Colors.grey,
                                                                                      fontSize: 15.0)),
                                                                              TextSpan(
                                                                                  text:
                                                                                  " duo id augue lobortis. Cum ei minim iisque nominavi, fierent adipiscing conclusionemque in",
                                                                                  style: TextStyle(
                                                                                      color:
                                                                                      Colors.grey,
                                                                                      fontSize: 15.0)),
                                                                            ])),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                            Alignment.center,
                                                            child: MaterialButton(
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      500.0)),
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                                _push();
                                                              },
                                                              color:
                                                              Values.primaryColor,
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                  vertical: 15.0),
                                                              child: Text(
                                                                  'Envoyer le code'
                                                                      .toUpperCase()),
                                                              textColor: Colors.white,
                                                              minWidth:
                                                              Dimens.Width * .6,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        });
                                  },
                                  color: Values.primaryColor,
                                  child: Text("Activer mon compte".toUpperCase()),
                                  textColor: Colors.white,
                                  padding: EdgeInsets.symmetric(vertical: 17.0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(500.0)),
                                  minWidth: Dimens.Width * .7,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              lowerLayer: Container()),
          Positioned(
            top: .0,
            child: MyAppBar(title: "Iscription",),
          ),
        ],
      ),
    );
  }

  void _push() {
    Tools.queue.addLast(this.context);
    Navigator.push(context, MaterialPageRoute(builder: (context) => AccountActivationScreen()));
  }
}