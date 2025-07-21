import 'package:flutter/widgets.dart';

class NewsModel {
  final int? id;
  final int? likes;
  final int? bookmarks;
  final bool bookmark;

  final int? comment;
  final int? any;

  final String? tag;
  final String? heading;
  final String? description;

  final Widget? icon;

  NewsModel({
    this.id,
    this.likes,
    this.bookmarks,
    this.bookmark = false,

    this.comment,
    this.any,
    this.tag,
    this.heading,
    this.description,
    this.icon,
  });
}
