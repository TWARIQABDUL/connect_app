import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Newsmodel {
  final Widget icon;
  final String title, header, tag, imagepath;
  final int likes, bookMark, comments, populality;

  Newsmodel({
    required this.tag,
    required this.icon,
    required this.title,
    required this.header,
    required this.likes,
    required this.bookMark,
    required this.comments,
    required this.populality,
    required this.imagepath,
  });

  factory Newsmodel.fromJson(Map<String, dynamic> json) {
    return Newsmodel(
      tag: json['tag'],
      icon: FaIcon(
        FontAwesomeIcons.squareHackerNews,
        color: Colors.red,
        size: 40,
      ),
      title: json['title'],
      header: json['header'],
      likes: json['likes'],
      bookMark: json['bookMark'],
      comments: json['comments'],
      populality: json['populality'].toInt(),
      imagepath: json['imagepath'],
    );
  }
  // dynNewsList.assignAll(
  //         data.map((item) {
  //           final jsonItem = item['news_data'];
  //           return Newsmodel.fromJson(jsonItem);
  //         }).toList(),
  //       );
}
