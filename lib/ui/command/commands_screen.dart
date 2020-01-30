import 'package:camy_store/ui/command/command_item.dart';
import 'package:camy_store/ui/common/bottom_nav.dart';
import 'package:camy_store/ui/common/my_app_bar.dart';
import 'package:camy_store/utils/dimens.dart';
import 'package:camy_store/utils/values.dart';
import 'package:flutter/material.dart';

class CommandsScreen extends StatefulWidget {
  CommandsScreen({Key key}) : super(key: key);

  @override
  _CommandsScreenState createState() => _CommandsScreenState();
}

class _CommandsScreenState extends State<CommandsScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
            child: Scaffold(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  MyAppBar(
                    title: "Mes commande",
                    actions: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Total",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Gotham',
                                  fontSize: 14.0)),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "152 020",
                                style: TextStyle(
                                    color: Values.greyedText,
                                    fontFamily: 'Gotham',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19.0),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 2.0),
                                child: Text(
                                  "DZD",
                                  style: TextStyle(
                                      color: Values.greyedText,
                                      fontFamily: 'Gotham',
                                      fontSize: 11.0,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return CommandItem();
                            },
                            itemCount: 3,
                            padding: EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 15.0),
                            shrinkWrap: true,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: Dimens.Height * .05, bottom: Dimens.Height * .1),
                            child: MaterialButton(
                              onPressed: () => print(''),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(500.0)),
                              child: Text("Etape suivant".toUpperCase()),
                              padding: EdgeInsets.symmetric(vertical: 15.0),
                              textColor: Colors.white,
                              color: Values.primaryColor,
                              minWidth: Dimens.Width * .6,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  BottomNav(
                    selectedPage: 4,
                  )
                ],
              ),
            ))
      ],
    );
  }
}
