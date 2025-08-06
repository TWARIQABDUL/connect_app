import 'package:connect/contr0ller/news_controler.dart';
import 'package:connect/widgets/categories.dart';
import 'package:connect/widgets/custom_widget.dart';
import 'package:connect/widgets/news_preview_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView {
  final NewsControler newsControler = Get.put(NewsControler());
  // List<String> list = <String>['One', 'Two', 'Three', 'Four'];
  @override
  Widget build(BuildContext context) {
    newsControler.fetchNews();
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            spacing: 10,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.red,
                ),
                height: 50,
                width: 50,
                child: ClipOval(
                  child: Image.asset('images/tgth.jpeg', fit: BoxFit.cover),
                ),
              ),

              Expanded(
                child: SearchBar(
                  leading: Icon(Icons.search),
                  onTapOutside: (event) {
                    // print("you can exit keyboard");
                  },
                ),
              ),
              // MenuBar(children: list.map<DropdownMenuItem<String>>((String value) {
              //     return DropdownMenuItem<String>(
              //       value: value,
              //       child: Text(value),
              //     );
              //   }).toList(),),
              // DropdownButton(
              //   items: list.map<DropdownMenuItem<String>>((String value) {
              //     return DropdownMenuItem<String>(
              //       value: value,
              //       child: Text(value),
              //     );
              //   }).toList(),
              //   onChanged: (String? value){},
              // ),

              // Icon(
              // Icons.notifications_none_sharp
              // )
            ],
          ),
        ),
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
                opacity: 0.7,
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
            child: Obx(() {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: newsControler.dynNewsList.length,
                itemBuilder: (context, index) {
                  final news = newsControler.dynNewsList[index];

                  return NewsContainer(
                    image: news.imagepath,
                    locations: news.title,
                    tags: news.tag,
                    newsmeta: {
                      "coment": news.comments,
                      "likes": news.likes,
                      "bookmarks": news.bookMark,
                      "reach": news.populality,
                    },
                  );
                },
              );
            }), //list view end here
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
