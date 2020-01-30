import 'package:camy_store/utils/dimens.dart';
import 'package:camy_store/utils/tools.dart';
import 'package:camy_store/utils/values.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {

  final String title;
  Function onTap;
  List<Widget> actions;
  Color backgroundColor;
  bool elevated;

  MyAppBar({Key key, this.title, this.onTap, this.actions, this.backgroundColor, this.elevated}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if (this.onTap == null) {
      this.onTap = () => Navigator.pop(Tools.queue.removeLast());
    }

    if (elevated == null) elevated = true;

    actions = actions == null ? [] : actions;

    if(backgroundColor == null) backgroundColor = Colors.white;

    return SafeArea(
      child: Opacity(
        opacity: 1.0,
        child: Container(
          width: Dimens.Width,
          decoration: BoxDecoration(
            color: backgroundColor,
            boxShadow: elevated ? [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5.0
              )
            ] : null
          ),
          padding: EdgeInsets.only(right: 23.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: onTap,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 7, top: 10.0, bottom: 10.0),
                  child: Icon(
                    Icons.arrow_back,
                    color: Values.greyedText,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: .0),
                child: Text(
                  title,
                  style: TextStyle(fontFamily: 'Gotham', color: Values.greyedText, fontWeight: FontWeight.w600, fontSize: 15.0),
                ),
              ),

              Expanded(child: Container(),),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: actions,
              )


            ],
          ),
        ),
      ),
    );
  }
}
