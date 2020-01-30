import 'dart:collection';

import 'package:camy_store/ui/search/search_results_screen.dart';
import 'package:camy_store/utils/dimens.dart';
import 'package:camy_store/utils/tools.dart';
import 'package:camy_store/utils/values.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class HomePage extends StatefulWidget {
  HomePage({Key key,}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: () {
        if (Tools.queue.isNotEmpty) {
          Navigator.pop(Tools.queue.removeLast());
          return Future.value(false);
        }
        return Future.value(true);
      },
      child: Navigator(
          onGenerateRoute: (settings){
        return MaterialPageRoute(builder: (context){
          return _HomePage();
        }, );
      }),
    );
  }
}

class _HomePage extends StatefulWidget{

  createState() => _HomePage_State();
}

class _HomePage_State extends State<_HomePage> {
  int _selectedSlide = 0;
  int _slidesCount = 4;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: Opacity(
            opacity: 1.0,
            child: Stack(
              children: <Widget>[
                CarouselSlider.builder(
                  itemCount: _slidesCount,
                  autoPlay: false,
                  autoPlayCurve: Curves.decelerate,
                  autoPlayAnimationDuration: Duration(milliseconds: 500),
                  autoPlayInterval: Duration(seconds: 3),
                  onPageChanged: (index) =>
                      setState(() => _selectedSlide = index),
                  itemBuilder: (context, index) {
                    return _sliderConent();
                  },
                  height: Dimens.Height,
                  viewportFraction: 1.0,
                ),
                Positioned(
                    bottom: Dimens.Height * .107,
                    left: 0,
                    right: .0,
                    child: _SliderIndicators(
                      count: _slidesCount,
                      selected: _selectedSlide,
                    ))
              ],
            ),
          ),
        ),
        Positioned.fill(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              appBar(),
              Expanded(child: Container()),
              Padding(
                padding: EdgeInsets.only(
                  left: Dimens.Width * .12,
                ),
                child: greeting(),
              ),
              searchWidget(),
              Expanded(child: Container()),
            ],
          ),
        ),
      ],
    );
  }

  Widget appBar() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 13.0, horizontal: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset("assets/ic_drawer.svg"),
          Padding(
            padding: const EdgeInsets.only(left: 21.0),
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "Camy",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      fontFamily: "Gotham")),
              TextSpan(
                  text: "Store",
                  style: TextStyle(fontSize: 16.0, fontFamily: "Gotham"))
            ])),
          ),
          Expanded(child: Container()),
          SvgPicture.asset(
            "assets/ic_notif.svg",
          ),
        ],
      ),
    );
  }

  Widget greeting() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Image.asset("assets/Symbole.png"),
        Padding(
          padding: EdgeInsets.only(left: Dimens.Width * .02),
          child: RichText(
            text: TextSpan(style: TextStyle(fontSize: 16.0), children: [
              TextSpan(
                  text: "  Bonjour Karim\n",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: "Gotham",
                      fontSize: 15.0)),
              WidgetSpan(
                  child: SizedBox(
                height: 20.0,
              )),
              TextSpan(
                  text: "Comment vous allez",
                  style: TextStyle(
                      fontWeight: FontWeight.w200,
                      fontFamily: "Gotham",
                      fontSize: 14.50)),
            ]),
          ),
        ),
      ],
    );
  }

  Widget searchWidget() {
    return Opacity(
      opacity: 1.0,
      child: Padding(
        padding: EdgeInsets.only(bottom: Dimens.Height * .285, top: 30.0),
        child: Center(
          child: Container(
            width: Dimens.Width * .84,
            height: Dimens.Height * .073,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(500.0)),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Recherche",
                        hintStyle: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.w400),
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(4.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(500.0),
                    child: InkWell(
                      onTap: () {
                        Tools.queue.addLast(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchResultsScreen()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Values.primaryColor, shape: BoxShape.circle),
                        child: Padding(
                            padding: EdgeInsets.all(13.0),
                            child: SvgPicture.asset(
                              "assets/ic_search.svg",
                              width: 17.0,
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _sliderConent() {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: Image.asset(
            "assets/bg1.png",
            width: Dimens.Width,
            fit: BoxFit.fill,
            height: Dimens.Height,
          ),
        ),
        Positioned.fill(
          child: Container(
            color: Colors.black38,
          ),
        ),
        Positioned.fill(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                SizedBox(
                  width: Dimens.Width * .55,
                  child: RichText(
                      softWrap: true,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Voyage de rêve\n",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14.5,
                                color: Colors.white,
                                fontFamily: "Gotham")),
                        WidgetSpan(
                            child: Container(
                          height: 8.0,
                        )),
                        TextSpan(
                          text:
                              "Lorem ipsum dolor sit amet, et nam quaeque principes",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 11.0,
                              fontFamily: "Gotham"),
                        )
                      ])),
                ),
                Container(
                  //onPressed: () => print("ok"),
                  decoration: BoxDecoration(
                      color: Values.primaryColor,
                      borderRadius: BorderRadius.circular(50.0)),
                  //textColor: Colors.white,
                  child: Row(
                    children: <Widget>[
                      SvgPicture.asset(
                        "assets/ic_link.svg",
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "voir l'offre",
                          style: TextStyle(
                              fontSize: 9.0,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Gotham"),
                        ),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
                  margin: EdgeInsets.only(right: 5.0, top: 5.0),
                )
              ],
            ),
          ),
          top: Dimens.Height * .577,
        ),
      ],
    );
  }
}

class _SliderIndicators extends StatelessWidget {
  final int count;
  final int selected;

  const _SliderIndicators({Key key, this.count, this.selected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3.0),
          child: Container(
            color: selected == index
                ? Values.primaryColor
                : Values.unselectedColor,
            width: Dimens.Width * .04,
            height: 2.0,
          ),
        );
      }),
    );
  }
}
