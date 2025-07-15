import 'package:connect/widgets/categories.dart';
import 'package:connect/widgets/custom_widget.dart';
import 'package:connect/widgets/news-preview-container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
          
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RoundedBgImage(
              bgImage: ImageWidget(
                imagePath: "images/tgth.jpeg",
                imgHeight: 150,
              ),

              widgetActions: WidgetActions(
                butons: CustomButton(
                  buttonText: "Read More",
                  action: () {
                    Get.toNamed("/readarticle");
                  },
                ),
                title: CustomText(
                  content: "Don't miss \nthe hot news to day",
                  color: Colors.white,

                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),

          CategoriesList(),
          SizedBox(
            height: 300,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              children: const [
                NewsContainer(
                  locations: "CNN News",
                  tags: "Sport",
                  newsmeta: {
                    "coment": 12,
                    "likes": 20,
                    "bookmarks": 30,
                    "reach": 19,
                  },
                ),
                SizedBox(width: 16),
                NewsContainer(
                  locations: "IDN News",
                  tags: "Sport",
                  newsmeta: {
                    "coment": 12,
                    "likes": 20,
                    "bookmarks": 30,
                    "reach": 19,
                  },
                ),
                SizedBox(width: 16),
                NewsContainer(
                  locations: "TEST loation",
                  tags: "Sport",
                  newsmeta: {
                    "coment": 102,
                    "likes": 200,
                    "bookmarks": 300,
                    "reach": 193,
                  },
                ),
                SizedBox(width: 16),
                NewsContainer(
                  locations: "Here",
                  tags: "Sport",
                  newsmeta: {
                    "coment": 12,
                    "likes": 20,
                    "bookmarks": 30,
                    "reach": 19,
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  content: "Treding",
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
                CustomText(
                  content: "See More",
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ],
            ),
          ),
          NewsBox(
            artTitle: CustomText(
              content: "Free Palestine",
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            iconn: Icon(Icons.more_vert),
            time: CustomText(
              content: "Politics 2 hours ago",
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 167, 166, 166),
            ),
          ),
          
          // NewsBox(),
        ],
      ),
    );
  }
}
