import 'package:camy_store/utils/dimens.dart';
import 'package:camy_store/utils/tools.dart';
import 'package:camy_store/utils/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latlong/latlong.dart' as latlong;
import 'package:rubber/rubber.dart';

class AboutStoreScreen extends StatefulWidget {
  AboutStoreScreen({Key key}) : super(key: key);

  @override
  _AboutStoreScreenState createState() => _AboutStoreScreenState();
}

class _AboutStoreScreenState extends State<AboutStoreScreen> with TickerProviderStateMixin{
  RubberAnimationController _rubberController;
  double rating = 3;

  @override
  void initState() {
    // TODO: implement initState
    _rubberController = RubberAnimationController(
      vsync: this,
      upperBoundValue: AnimationControllerValue(percentage: .95),
      lowerBoundValue: AnimationControllerValue(percentage: .37),
      duration: Duration(milliseconds: 300),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(
              child: FlutterMap(
            options: MapOptions(
                center: latlong.LatLng(34.7398, 10.7600), zoom: 17.0),
            layers: [
              TileLayerOptions(
                urlTemplate:
                    'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              ),
            ],
          )),
          AnimatedBuilder(
            animation: _rubberController,
            builder: (context, child) {
              return RubberBottomSheet(
                  animationController: _rubberController,
                  upperLayer: Stack(
                    children: <Widget>[
                      LayoutBuilder(builder: (context, constraints) {
                        return Container(
                          margin: EdgeInsets.only(top: Dimens.Height * .07),
                          //height: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 5.0)
                              ],
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0))),
                          padding: EdgeInsets.only(
                              top: 13.0, left: 15.0, right: 20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                width: Dimens.Width,
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: Values.greyedText,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 20.0,
                                    bottom: _rubberController.value < .5 ? constraints.biggest.height * .09 : constraints.biggest.height * .035),
                                child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text:
                                              "Zircon tours\n".toUpperCase(),
                                          style: TextStyle(
                                              color: Values.greyedText,
                                              fontFamily: 'Gotham',
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16.0)),
                                      WidgetSpan(
                                          child: SizedBox(
                                        height: 17.0,
                                      )),
                                      TextSpan(
                                          text: "El Eulma, Sétif\n",
                                          style: TextStyle(
                                              color: Values.greyedText,
                                              fontFamily: 'Gotham',
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12.0)),
                                      WidgetSpan(
                                          child: Padding(
                                        padding: EdgeInsets.only(top: 5.0),
                                        child: RatingBar(
                                          itemCount: 5,
                                          initialRating: 3,
                                          itemSize: 13.0,
                                          itemPadding: EdgeInsets.symmetric(
                                              horizontal: 2.5),
                                          ratingWidget: RatingWidget(
                                            half: Container(),
                                              full: SvgPicture.asset(
                                                  "assets/star_full.svg"),
                                              empty: SvgPicture.asset(
                                                  "assets/star_empty.svg")),
                                          allowHalfRating: false,
                                          onRatingUpdate: (double value) {
                                            setState(() {
                                              rating = value;
                                            });
                                          },
                                        ),
                                      ))
                                    ])),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Divider(
                                    color: Values.greyedText,
                                    thickness: 1.0,
                                    height: 1.0,
                                  ),
                                  Padding(
                                    padding:
                                    EdgeInsets.only(left: 9.0, top: 14.0, bottom: 14.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: <Widget>[
                                        SvgPicture.asset("assets/btn_fb.svg"),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 13.0),
                                          child: SvgPicture.asset(
                                              "assets/btn_instagram.svg"),
                                        ),
                                        SvgPicture.asset(
                                            "assets/btn_whatsapp.svg"),
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(left: 13.0),
                                          child: SvgPicture.asset(
                                              "assets/btn_qr.svg"),
                                        ),
                                        Expanded(child: Container()),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Values.primaryColor,
                                              borderRadius: BorderRadius.circular(500.0)
                                          ),
                                          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 12.0),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              SvgPicture.asset("assets/ic_routing.svg"),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 5.0),
                                                child: Text("Itinéraire", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: Values.greyedText,
                                    thickness: 1.0,
                                    height: 1.0,
                                  ),
                                ],
                              ),
                              Expanded(child: Container()),
                              Padding(
                                padding: EdgeInsets.only(top: _rubberController.value > .5 ? .0 : Dimens.Width * .3, bottom: _rubberController.value > .5 ? 15.0 : 20.0),
                                child: Image.asset("assets/qr_code.png", width: Dimens.Width * .55,),
                              ),
                              Expanded(child: Container()),
                            ],
                          ),
                        );
                      }),
                      SizedBox(
                        width: Dimens.Width,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: CircleAvatar(
                            backgroundImage: AssetImage("assets/ZStore.png"),
                            radius: 45.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  lowerLayer: Container());
            }
          )
        ],
      ),
    );
  }
}
