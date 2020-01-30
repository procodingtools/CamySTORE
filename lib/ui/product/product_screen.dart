import 'package:camy_store/ui/common/bottom_nav.dart';
import 'package:camy_store/ui/common/bullet.dart';
import 'package:camy_store/ui/store/about/about_store_screen.dart';
import 'package:camy_store/utils/dimens.dart';
import 'package:camy_store/utils/tools.dart';
import 'package:camy_store/utils/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rubber/rubber.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({Key key}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> with TickerProviderStateMixin{
  RubberAnimationController _rubberController;

  @override
  void initState() {
    // TODO: implement initState
    _rubberController = RubberAnimationController(
        vsync: this,
        duration: Duration(milliseconds: 300),
        lowerBoundValue: AnimationControllerValue(percentage: .5),
        upperBoundValue: AnimationControllerValue(percentage: .94));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: Opacity(
            opacity: 0.7,
            child: Container(
              child: Image.asset(
                "assets/ProductUp.png",
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Opacity(
            opacity: 1.0,
            child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Maldive\n".toUpperCase(),
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            fontFamily: 'Gotham')),
                    TextSpan(
                        text: "Voyage organisé",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Gotham',
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500)),
                  ])),
                ),
                backgroundColor: Colors.white,
                actions: <Widget>[
                  SvgPicture.asset(
                    "assets/ic_share.svg",
                    width: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 33.0, left: 20.0),
                    child: SvgPicture.asset(
                      "assets/ic_like.sgv",
                      //width: 20.0,
                    ),
                  ),
                ],
              ),
              body: Stack(
                children: <Widget>[
                  Positioned.fill(
                      child: Container(
                    height: Dimens.Height * .6,
                    child: Image.asset(
                      "assets/bg1.png",
                      fit: BoxFit.cover,
                    ),
                  )),
                  RubberBottomSheet(
                      animationController: _rubberController,
                      upperLayer: Stack(
                        children: <Widget>[
                          Positioned.fill(
                              child: Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: 10.0,
                                ),
                                _indicators(),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20.0),
                                            topRight: Radius.circular(20.0))),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 18.0, horizontal: 27.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        _priceWidget("150 000", "DZD", true),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10.0),
                                          child: Divider(
                                            thickness: 1.0,
                                          ),
                                        ),
                                        AnimatedSize(
                                          vsync: this,
                                          duration:
                                              Duration(milliseconds: 300),
                                          child: AnimatedBuilder(
                                              animation: _rubberController,
                                              builder: (context, child) {
                                                return _rubberController
                                                            .value >
                                                        .6
                                                    ? _productInfos()
                                                    : Container();
                                              }),
                                        ),
                                        _bottomSheetContent(),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )),
                          _storeLogo(),
                          Positioned(
                              bottom: .0,
                              child: BottomNav(
                                selectedPage: 0,
                              ))
                        ],
                      ),
                      lowerLayer: Container()),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _rubberController.dispose();
    super.dispose();
  }

  Widget _storeLogo() {
    return Positioned(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          InkWell(
            onTap: () {
              Tools.queue.addLast(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AboutStoreScreen()));
              print('tappfed');
            },
            child: Image.asset(
              "assets/go_voyage.png",
              fit: BoxFit.cover,
              width: 72.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "Go voyage",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Gotham',
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0),
            ),
          ),
        ],
      ),
      top: .0,
      right: 25.0,
    );
  }

  Widget _priceWidget(String price, String currency, bool available) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Text(
                price,
                style: TextStyle(
                    color: Values.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 26.0,
                    fontFamily: 'Gotham'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 2.0),
              child: Text(
                currency,
                style: TextStyle(
                    color: Values.primaryColor,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Gotham',
                    fontSize: 16.0),
              ),
            )
          ],
        ),
        Text(
          available ? "Disponible" : "Indisponible",
          style: TextStyle(
              color: Colors.black, fontSize: 12.7, fontFamily: 'Gotham'),
        )
      ],
    );
  }

  Widget _bottomSheetContent() {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 7.0, bottom: 5.0),
            child: MaterialButton(
              onPressed: () => print(''),
              color: Values.primaryColor,
              child: Text(
                'Ajouter au panier'.toUpperCase(),
              ),
              minWidth: double.infinity,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(500.0)),
              padding: EdgeInsets.symmetric(vertical: 15.0),
            ),
          ),
          Divider(
            thickness: 1.0,
          ),
          Flexible(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 3.0, top: 10.0),
                child: RichText(
                    overflow: TextOverflow.clip,
                    text: TextSpan(children: [
                      TextSpan(
                          text: "Lorem ipsum dolor sit amet",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Values.greyedTextLight,
                              fontSize: 15.6)),
                      TextSpan(
                          text:
                              ", consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. sed do eiusmod tempor",
                          style:
                              TextStyle(color: Values.greyedTextLight, fontSize: 15.6)),
                      WidgetSpan(
                          child: Container(
                        height: 30.0,
                      )),
                      TextSpan(
                          text: "Qui ne enim quaestio oportere,\n",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Values.greyedTextLight,
                              fontSize: 15.6)),
                      WidgetSpan(
                          child: Container(
                        height: 13.0,
                      )),
                      Bullet("Duo id augue lobortis.",
                          style:
                              TextStyle(color: Values.greyedTextLight, fontSize: 15.6)),
                      Bullet("Cum ei minim iisque",
                          style:
                              TextStyle(color: Values.greyedTextLight, fontSize: 15.6)),
                      Bullet("Nominavi, fierent adipiscing",
                          style:
                              TextStyle(color: Values.greyedTextLight, fontSize: 15.6)),
                      Bullet("Duo id augue lobortis.",
                          style:
                              TextStyle(color: Values.greyedTextLight, fontSize: 15.6)),
                    ])),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _productInfos() {
    return Padding(
      padding: const EdgeInsets.only(top: .0, left: 3.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                "assets/ic_truck.svg",
                //width: 27.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 2.0),
                child: Text(
                  'Gratuit',
                  style: TextStyle(
                      color: Values.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 11.0),
                ),
              ),
              Expanded(child: Container()),
              pair("ic_share.svg", "190"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: pair("ic_view.svg", "190"),
              ),
              pair("ic_like.svg", "150")
            ],
          ),
          Divider(
            thickness: 1.0,
          )
        ],
      ),
    );
  }

  Widget pair(String image, String str) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SvgPicture.asset(
          "assets/$image",
          width: 15.0,
          color: Values.greyedTextLight,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 2.0),
          child: Text(
            str,
            style: TextStyle(fontWeight: FontWeight.bold, color: Values.greyedText),
          ),
        ),
      ],
    );
  }

  Widget _indicators() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
              5,
              (index) => Container(
                    width: 8.0,
                    height: 8.0,
                    margin: EdgeInsets.symmetric(horizontal: 1.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index == 0 ? Colors.white : Colors.white70,
                    ),
                  )).toList(),
        ),
      ),
    );
  }
}
