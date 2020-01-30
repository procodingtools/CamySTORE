import 'package:flutter/material.dart';

class Bullet extends TextSpan {
  const Bullet(
      String data, {
        TextStyle style,
        String semanticsLabel,
      }) : super(
    text: '• ${data}\n',
    //key: key,
    style: style,
    //textAlign: textAlign,
    //textDirection: textDirection,
    //locale: locale,
    //softWrap: softWrap,
    //overflow: overflow,
    //textScaleFactor: textScaleFactor,
    //maxLines: maxLines,
    semanticsLabel: semanticsLabel,
  );
}