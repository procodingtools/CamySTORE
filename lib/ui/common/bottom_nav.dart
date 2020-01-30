import 'package:camy_store/ui/account/auth/signup/create_account.dart';
import 'package:camy_store/ui/command/commands_screen.dart';
import 'package:camy_store/ui/fav/fav_screen.dart';
import 'package:camy_store/ui/home/home_page/home_page.dart';
import 'package:camy_store/ui/qr_scanner/qr_scanner_widget.dart';
import 'package:camy_store/utils/dimens.dart';
import 'package:camy_store/utils/tools.dart';
import 'package:camy_store/utils/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class BottomNav extends StatelessWidget {
  
  final int selectedPage;
  final BuildContext parentContext;
  final Function(int page) onPageChanged;

  const BottomNav({Key key, this.selectedPage, this.parentContext, this.onPageChanged}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return _bottomNavBar(context);
  }

  Widget _bottomNavBar(BuildContext context) {
    return Container(
      width: Dimens.Width,
      height: Dimens.Height * .08,
      decoration: BoxDecoration(
          boxShadow: [
            new BoxShadow(
              color: Colors.grey,
              blurRadius: 5.0,
              //spreadRadius: 2.0
              //offset: new Offset(20.0, 10.0),
            )
          ],
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: .0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _bottomBarItem(
              icon: "assets/ic_search.svg",
              title: "Recherche",
              page: 0,
                onTap: () => Navigator.push(parentContext, MaterialPageRoute(builder: (context) => HomePage()))
            ),
            _bottomBarItem(
                icon: "assets/ic_qrcode.svg", title: "Scanner", page: 1, onTap: () => Navigator.push(parentContext, MaterialPageRoute(builder: (context) => QrScannerScreen()))),
            _bottomBarItem(
                icon: "assets/ic_like.svg", title: "Mes favoris", page: 2, onTap: () => Navigator.push(parentContext, MaterialPageRoute(builder: (context) => FavScreen()))),
            _bottomBarItem(
                icon: "assets/ic_user.svg", title: "Mon compte", page: 3, onTap: () => Navigator.push(parentContext, MaterialPageRoute(builder: (context) => CreateAccount()))),
            _bottomBarItem(
                icon: "assets/ic_cart.svg", title: "Mes favoris", page: 4, onTap: () => Navigator.push(parentContext, MaterialPageRoute(builder: (context) => CommandsScreen()))),
          ],
        ),
      ),
    );
  }

  Widget _bottomBarItem({String icon, String title, int page, VoidCallback onTap}) {
    final selected = page == selectedPage;
    return InkWell(
      onTap: () {
        Tools.queue.clear();
        this.onPageChanged(page);
        onTap();
      },
      child: SizedBox(
        width: Dimens.Width * .18,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: SvgPicture.asset(icon,
                  color: selected ? Values.primaryColor : Colors.grey,
                  width: 18.0),
            ),
            !selected
                ? Container()
                : Text(
              title,
              style: TextStyle(color: Values.primaryColor, fontSize: 10.0),
            )
          ],
        ),
      ),
    );
  }
}
