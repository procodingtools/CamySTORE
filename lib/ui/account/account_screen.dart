import 'dart:ui';

import 'package:camy_store/ui/common/account_edit.dart';
import 'package:camy_store/ui/common/my_app_bar.dart';
import 'package:camy_store/utils/dimens.dart';
import 'package:camy_store/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rubber/rubber.dart';

class AccountScreen extends StatefulWidget {

  AccountScreen({Key key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> with TickerProviderStateMixin{
  RubberAnimationController _rubberController;
  TextEditingController _nameController = TextEditingController(text: "ABID");
  bool _scrolling;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    _rubberController = RubberAnimationController(
        vsync: this,
        duration: Duration(milliseconds: 300),
        upperBoundValue: AnimationControllerValue(percentage: .835),
        lowerBoundValue: AnimationControllerValue(percentage: .590));

    _rubberController.addListener(() {
      _scrolling = _rubberController.value > .8;
    });

    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward &&
          _scrollController.position.pixels == .0)
        setState(() {
          _scrolling = false;
        });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          body: Stack(
            children: <Widget>[
              Positioned.fill(
                //top: 50.0,
                child: AnimatedBuilder(
                    animation: _rubberController,
                    builder: (context, child) {
                      return Stack(
                        children: <Widget>[
                          Positioned(child: Image.asset(
                            "assets/porfile_pic.png", fit: BoxFit.cover,
                            width: Dimens.Width,
                            height: _rubberController.value >= .652 ? Dimens.Height *
                                .28 : Dimens.Height *
                                (.28 + (.652 - _rubberController.value)),), top: Dimens.Height * .075),
                          RubberBottomSheet(
                              animationController: _rubberController,
                              lowerLayer: Container(),
                              upperLayer: Container(
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey, blurRadius: 5.0)
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10.0),
                                          topLeft: Radius.circular(10.0))),
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 25.0, vertical: 19.0),
                                  child: SingleChildScrollView(
                                    controller: _scrollController,
                                    physics:
                                    _rubberController.value > .8 && _scrolling
                                        ? AlwaysScrollableScrollPhysics()
                                        : NeverScrollableScrollPhysics(),
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom: 10.0),
                                      child: AccountEdit(nameController: _nameController,),
                                    ),
                                  )
                              )),
                        ],
                      );
                    }
                ),
              ),
              Positioned(top: .0, child: MyAppBar(title: "Mon profile",))
            ],
          ),
        )
      ],
    );
  }


}
