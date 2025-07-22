import 'package:flutter/widgets.dart';

class Newsmodel {
  final Widget icon;
  final String title,header,tag,imagepath;
  final int likes,bookMark,comments,populality;

  Newsmodel({
    required this.tag,
    required this.icon,
    required this.title,
    required this.header,
    required this.likes,
    required this.bookMark,
    required this.comments,
    required this.populality,
    required this.imagepath
  });
}
