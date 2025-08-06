import 'package:connect/model/newsModel.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
// import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NewsControler extends GetxController {
  final RxList<Newsmodel> dynNewsList = <Newsmodel>[].obs;
  RxBool loading = false.obs;
  final supabase = Supabase.instance.client;

  fetchNews() async {
    loading.value = true;
    try {
      final data = await supabase.from('news_table').select('news');
      if (data != null) {
        dynNewsList.assignAll(
          data.map((item) {
            final jsonItem = item['news'];
            print("JSON Item: $jsonItem");
            return Newsmodel.fromJson(jsonItem);
          }).toList(),
        );
      } else {
        loading.value = false;

        print("${loading.value}No news found");
      }
    } catch (e) {
      print("Exception while fetching news: $e");
    }
  }
}