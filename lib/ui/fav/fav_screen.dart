import 'package:camy_store/ui/common/bottom_nav.dart';
import 'package:camy_store/ui/common/my_app_bar.dart';
import 'package:camy_store/ui/fav/fav_item.dart';
import 'package:camy_store/ui/fav/no_fav_widget.dart';
import 'package:camy_store/utils/dimens.dart';
import 'package:camy_store/utils/values.dart';
import 'package:flutter/material.dart';

class FavScreen extends StatefulWidget {
  FavScreen({Key key}) : super(key: key);

  @override
  _FavScreenState createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  int _stackIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          IndexedStack(
            index: _stackIndex,
            children: <Widget>[
              Positioned.fill(
                top: Dimens.Height * .165,
                child: NoFavWidget(
                  onTap: (){
                    setState(() {
                      _stackIndex = 1;
                    });
                  },
                ),
              ),
              _favProducts(),
            ],
          ),
          Positioned(
            child: MyAppBar(
              title: "Mes favoris",
            ),
            top: .0,
          ),
          Positioned(
            bottom: .0,
            child: BottomNav(
              selectedPage: 2,
            ),
          )
        ],
      ),
    );
  }

  Widget _favProducts() {
    return Positioned.fill(
      top: Dimens.Height * .125,
        child: SingleChildScrollView(
      child: LimitedBox(
        maxHeight: Dimens.Height - Dimens.Height * .1,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                  itemCount: 2,
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return FavItemWidget();
                  },
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: MaterialButton(
                onPressed: () => print(''),
                color: Values.primaryColor,
                child: Text("Faire unr refraiche".toUpperCase()),
                textColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 17.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(500.0)),
                minWidth: Dimens.Width * .6,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
