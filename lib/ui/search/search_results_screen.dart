import 'package:camy_store/ui/common/my_app_bar.dart';
import 'package:camy_store/ui/search/product_item/product_item.dart';
import 'package:camy_store/utils/dimens.dart';
import 'package:camy_store/utils/tools.dart';
import 'package:camy_store/utils/values.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latlong/latlong.dart' as latlong;
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:rubber/rubber.dart';

class SearchResultsScreen extends StatefulWidget {
  SearchResultsScreen({Key key}) : super(key: key);

  @override
  _SearchResultsScreenState createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> with TickerProviderStateMixin{
  RubberAnimationController _rubberAnimaController;

  @override
  void initState() {
    // TODO: implement initState


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _rubberAnimaController = RubberAnimationController(
        vsync: this,
        duration: Duration(milliseconds: 300),
        lowerBoundValue: AnimationControllerValue(percentage: .27),
        upperBoundValue: AnimationControllerValue(percentage: .836));
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
                )
              ],
            ),
          ),
          Positioned(
            top: .0,
            child: SafeArea(
              child: Container(
                width: Dimens.Width,
                color: Colors.white,
                padding: EdgeInsets.only(top: 11.0, bottom: 11.0, left: 10.0, right: 23.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      onTap: () => Navigator.pop(Tools.queue.removeLast()),
                      child: Icon(
                        Icons.arrow_back,
                        color: Values.greyedText,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 7.0),
                      child: Text(
                        "Recherche",
                        style: TextStyle(fontFamily: 'Gotham', color: Values.greyedText, fontWeight: FontWeight.w600, fontSize: 15.0),
                      ),
                    ),

                    Expanded(child: Container(),),



                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: .0,
            child: MyAppBar(
              title: 'Recherche',
              actions: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Values.greyedTextLight, width: .5),
                    borderRadius: BorderRadius.circular(500.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: SvgPicture.asset(
                              "assets/ic_filter.svg",
                              //width: 12.0,
                            )),
                        Text(
                          "Filtre par",
                          style: TextStyle(
                              fontFamily: 'Gotham',
                              color: Values.greyedText,
                              fontWeight: FontWeight.w600,
                              fontSize: 12.0),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              child: RubberBottomSheet(
                animationController: _rubberAnimaController,
                lowerLayer: Container(),
                upperLayer: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          topLeft: Radius.circular(20.0)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 2.0,
                            blurRadius: 10.0)
                      ]),
                  width: double.infinity,
                  child: AnimatedBuilder(
                    animation: _rubberAnimaController,
                    builder: (BuildContext context, Widget child) {
                      final expanded = _rubberAnimaController.value > .3;
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: () => _rubberAnimaController.value > .3
                                  ? _rubberAnimaController.collapse()
                                  : _rubberAnimaController.expand(),
                              child: Padding(
                                padding: EdgeInsets.only(top: 8.0, bottom: expanded ? 23.0 : 3.0),
                                child: Image.asset(
                                  "assets/ic_expand.png",
                                  width: 26.0,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 15.0,
                            ),
                            child: Text(
                              "150 Resulta",
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontFamily: 'Gotham',
                                  color: Values.greyedTextLight,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          expanded
                              ? Expanded(
                            child: _bottomSheetItems(expanded),
                          )
                              : SizedBox(
                            child: _bottomSheetItems(expanded),
                            height: 105.0,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ))
        ],
      ),
    );
  }

  Widget _bottomSheetItems(bool expanded) {
    return Padding(
      padding: EdgeInsets.only(
        top: expanded ? 15.0 : 11.5,
        left: 12.0,
      ),
      child: ListView.builder(
        physics: !expanded ? CustomScrollPhysics(itemDimension: 268.0) : null,
        itemBuilder: (context, index) {
          return ProductItem(expanded: expanded,);
        },
        shrinkWrap: true,
        scrollDirection: expanded ? Axis.vertical : Axis.horizontal,
        itemCount: 50,
        //controller: PageController(viewportFraction: .8, keepPage: true),
      ),
    );
  }
}

class CustomScrollPhysics extends ScrollPhysics {
  final double itemDimension;

  CustomScrollPhysics({this.itemDimension, ScrollPhysics parent})
      : super(parent: parent);

  @override
  CustomScrollPhysics applyTo(ScrollPhysics ancestor) {
    return CustomScrollPhysics(
        itemDimension: itemDimension, parent: buildParent(ancestor));
  }

  double _getPage(ScrollMetrics position, double portion) {
    // <--
    return (position.pixels + portion) / itemDimension;
    // -->
  }

  double _getPixels(double page, double portion) {
    // <--
    return (page * itemDimension) - portion;
    // -->
  }

  double _getTargetPixels(
    ScrollPosition position,
    Tolerance tolerance,
    double velocity,
    double portion,
  ) {
    // <--
    double page = _getPage(position, portion);
    // -->
    if (velocity < -tolerance.velocity) {
      page -= 0.5;
    } else if (velocity > tolerance.velocity) {
      page += 0.5;
    }
    // <--
    return _getPixels(page.roundToDouble(), portion);
    // -->
  }

  @override
  Simulation createBallisticSimulation(
      ScrollMetrics position, double velocity) {
    // If we're out of range and not headed back in range, defer to the parent
    // ballistics, which should put us back in range at a page boundary.
    if ((velocity <= 0.0 && position.pixels <= position.minScrollExtent) ||
        (velocity >= 0.0 && position.pixels >= position.maxScrollExtent))
      return super.createBallisticSimulation(position, velocity);

    final Tolerance tolerance = this.tolerance;
    // <--
    final portion = (position.extentInside - itemDimension) / 2;
    final double target =
        _getTargetPixels(position, tolerance, velocity, portion);
    // -->
    if (target != position.pixels)
      return ScrollSpringSimulation(spring, position.pixels, target, velocity,
          tolerance: tolerance);
    return null;
  }

  @override
  bool get allowImplicitScrolling => false;
}
