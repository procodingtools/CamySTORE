import 'package:camy_store/ui/product/product_screen.dart';
import 'package:camy_store/utils/dimens.dart';
import 'package:camy_store/utils/tools.dart';
import 'package:flutter/material.dart';

class ProductCardItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0, left: 18.0, right: 18.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: InkWell(
          onTap: () {
            Tools.queue.addLast(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen()));
          },
          child: Card(
            elevation: 5.0,
            child: SizedBox(
              height: Dimens.Height * .31,
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                      child: Container(
                          foregroundDecoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Colors.black54, Colors.transparent],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter)),
                          child: Image.asset(
                            "assets/bg1.png",
                            fit: BoxFit.cover,
                          ))),
                  Positioned(
                      bottom: 15.0,
                      left: 10.0,
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "Tunisie\n".toUpperCase(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Gotham',
                                  fontSize: 18.0)),
                          TextSpan(
                              text: "Voyage organisé",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.0,
                                  fontFamily: 'Gotham'))
                        ]),
                      ))
                ],
              ),
            ),
            margin: EdgeInsets.all(.0),
          ),
        ),
      ),
    );
  }
}
