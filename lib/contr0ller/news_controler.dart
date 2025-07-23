import 'package:connect/model/newsModel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class NewsControler {
  List<Newsmodel> newsLists = [
    Newsmodel(
      tag: "Sport",
      icon: FaIcon(
        FontAwesomeIcons.squareHackerNews,
        color: Colors.red,
        size: 40,
      ),
      title: "CNN News",
      header:
          "Inspiring Stories of People Who Overcame challenges through Skate boarding",
      likes: 20,
      bookMark: 30,
      comments: 18,
      populality: 70,
      imagepath: "images/tgth.jpeg",
    ),
    Newsmodel(
      tag: "Bussiness",
      icon: FaIcon(
        FontAwesomeIcons.squareHackerNews,
        color: Colors.red,
        size: 40,
      ),
      title: "Wall Streat",
      header:
          "Inspiring Stories of People Who Overcame challenges through Skate boarding",
      likes: 20,
      bookMark: 30,
      comments: 18,
      populality: 70,
      imagepath: "images/tgth.jpeg",
    ),
    Newsmodel(
      tag: "Entertainment",
      icon: FaIcon(
        FontAwesomeIcons.squareHackerNews,
        color: Colors.red,
        size: 40,
      ),
      title: "Twariki News",
      header:
          "Inspiring Stories of People Who Overcame challenges through Skate boarding",
      likes: 20,
      bookMark: 30,
      comments: 18,
      populality: 70,
      imagepath: "images/tgth.jpeg",
    ),
    Newsmodel(
      tag: "Politics",
      icon: FaIcon(
        FontAwesomeIcons.squareHackerNews,
        color: Colors.red,
        size: 40,
      ),
      title: "CNN News",
      header:
          "Inspiring Stories of People Who Overcame challenges through Skate boarding",
      likes: 20,
      bookMark: 30,
      comments: 18,
      populality: 70,
      imagepath: "images/tgth.jpeg",
    ),
  ];

  RxList<Newsmodel> myNewsList = [
    Newsmodel(
      tag: "Sport",
      icon: FaIcon(
        FontAwesomeIcons.squareHackerNews,
        color: Colors.red,
        size: 40,
      ),
      title: "CNN News",
      header:
          "Inspiring Stories of People Who Overcame challenges through Skate boarding",
      likes: 20,
      bookMark: 30,
      comments: 18,
      populality: 70,
      imagepath: "images/tgth.jpeg",
    ),
  ].obs;
  sortnews(String query) {
    final sorted = newsLists.where((news) {
      return news.tag == query;
    });
    myNewsList.assignAll(sorted);
  }
}
