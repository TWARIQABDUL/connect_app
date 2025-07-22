import 'package:connect/model/newsModel.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class HashTagsControllers extends GetxController {
  List hashtags = <HashTagsModel>[].obs;
  @override
  void onInit() {
    hashtags.add(
      HashTagsModel(
      id: 123,
      title: "#FREE Palastine",
      icon: Icon(Icons.more_vert),
    )
    );
    super.onInit();
  }
}
