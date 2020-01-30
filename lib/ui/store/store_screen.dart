import 'package:camy_store/ui/common/bottom_nav.dart';
import 'package:camy_store/ui/store/product_card_item.dart';
import 'package:camy_store/utils/dimens.dart';
import 'package:camy_store/utils/tools.dart';
import 'package:camy_store/utils/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StoreScreen extends StatefulWidget {
  StoreScreen({Key key}) : super(key: key);

  @override
  _StoreScreenState createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> with TickerProviderStateMixin{
  AnimationController _scrollAnimController;

  @override
  void initState() {
    // TODO: implement initState
    _scrollAnimController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: AnimatedBuilder(
                animation: _scrollAnimController,
                builder: (context, child) {
                  return CustomScrollView(
                    slivers: <Widget>[
                      SliverAppBar(
                        expandedHeight: (Dimens.Height * .41) + 35.0,
                        backgroundColor: Colors.white,
                        automaticallyImplyLeading: false,
                        leading: InkWell(
                          onTap: () => Navigator.pop(Tools.queue.removeLast()),
                          child: _scrollAnimController.value <= .3
                              ? Padding(
                                  padding: EdgeInsets.only(
                                      top: 5.0, bottom: 5.0, left: 15.0),
                                  child: Image.asset(
                                    "assets/ZStore.png",
                                  ),
                                )
                              : Icon(
                                  Icons.arrow_back,
                                ),
                        ),
                        elevation: 5.0,
                        forceElevated: true,
                        pinned: true,
                        floating: false,
                        actions: <Widget>[
                          SvgPicture.asset(
                            "assets/ic_share.svg",
                            width: 20.0,
                            color: _scrollAnimController.value <= .3
                                ? Colors.black
                                : Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            child: SvgPicture.asset(
                              "assets/ic_like.svg",
                              //width: 20.0,
                              color: _scrollAnimController.value <= .3
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ),
                        ],
                        flexibleSpace:
                            LayoutBuilder(builder: (context, constraint) {
                          _scrollAnimController.animateTo(
                              (constraint.biggest.height - 80.0) /
                                  (Dimens.Height * .41 - 80.0));

                          return FlexibleSpaceBar(
                            titlePadding: EdgeInsets.only(
                                left: 75.0 -
                                    (25.0 * _scrollAnimController.value * 2),
                                bottom: 50.0 +
                                    (.0 -
                                        (.0 * _scrollAnimController.value))),
                            background: SizedBox(
                              height: Dimens.Height * .41,
                              child: Stack(
                                children: <Widget>[
                                  Positioned.fill(
                                    bottom: 95.0,
                                      child: Image.asset(
                                    "assets/bg1.png",
                                    fit: BoxFit.cover,
                                  )),
                                  Positioned(
                                    bottom: (Dimens.Height * .04) + 35.0,
                                    right: 29.0,
                                    child: Image.asset(
                                      "assets/ZStore.png",
                                      width: 70.0,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            collapseMode: CollapseMode.parallax,
                            title: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "Zircon Tours\n".toUpperCase(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                        fontSize:
                                            _scrollAnimController.value <= .3
                                                ? 16.0
                                                : 10.5,
                                        fontFamily: 'Gotham')),
                                TextSpan(
                                    text: "Voyage & Tourism",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                        fontSize:
                                            _scrollAnimController.value >= .3
                                                ? 8.0
                                                : 11.5,
                                        fontFamily: 'Gotham')),
                              ]),
                            ),
                          );
                        }),


                        bottom: PreferredSize(
                            child: Container(
                              width: Dimens.Width,
                              height: 35.0,
                              color: Values.primaryColor,
                              child: TabBar(tabs: [
                                Tab(text: "collenction", iconMargin: EdgeInsets.symmetric(vertical: .0)),
                                Tab(text: "voyage organisé", iconMargin: EdgeInsets.symmetric(vertical: .0)),
                                Tab(text: "hadj & omra", iconMargin: EdgeInsets.symmetric(vertical: .0)),
                                Tab(text: "à la file", iconMargin: EdgeInsets.symmetric(vertical: .0),)
                              ],
                                labelPadding: EdgeInsets.symmetric(horizontal: 9.0, vertical: 4.0),
                                labelColor: Colors.white,
                                unselectedLabelColor: Colors.white.withOpacity(.7),
                                indicatorSize: TabBarIndicatorSize.label,
                                indicatorColor: Colors.white,
                                isScrollable: true,
                                controller: TabController(initialIndex: 0, length: 4, vsync: this),
                                labelStyle: TextStyle(fontFamily: "Gotham", fontWeight: FontWeight.bold),),
                            ),
                            preferredSize: Size(Dimens.Width, 35.0)),
                      ),



                      SliverList(
                          delegate: SliverChildListDelegate([
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: ProductCardItem(),
                            ),
                            ProductCardItem(),
                            ProductCardItem(),
                            ProductCardItem(),
                            ProductCardItem(),
                            ProductCardItem(),
                          ],
                        )
                      ]))
                    ],
                  );
                }),
          ),
          Positioned(
            bottom: .0,
            child: BottomNav(
              selectedPage: 0,
            ),
          )
        ],
      ),
    );
  }
}
