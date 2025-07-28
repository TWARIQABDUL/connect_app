import 'package:connect/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/state_manager.dart';

class NewsContainer extends GetView {
  final String locations;
  final String? tags,image;
  final Map<String, dynamic> newsmeta;
  final TextButton? btn;
 NewsContainer({
    required this.locations,
    this.tags,
    required this.newsmeta,
    this.btn,
    this.image
  });

  @override
  Widget build(BuildContext context) {
    // print("coments$newsmeta");
    return SizedBox(
      width: 290,

      // height: 40,
      child: Container(
        height: 500,
        decoration: BoxDecoration(
          color: Color(0XFFF5F5F5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Column(
                children: [
                  RoundedBgImage(
                    bgImage: ImageWidget(
                      imagePath: image??"images/tgth.jpeg",
                      imgHeight: 150,
                      // imgHeight: 50,
                      // imgWidth: 70,
                    ),
                    widgetActions: WidgetActions(
                      opacity: 0.7,
                      windowsAction: BotomInfo(
                        buton: btn,
                        icon: FaIcon(
                          FontAwesomeIcons.squareHackerNews,
                          color: Colors.red,
                          size: 40,
                        ),

                        location: CustomText(
                          content: locations,
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      tags: tags,
                    ),
                  ),
                  SizedBox(height: 10),
                  CustomText(
                    content:
                        "Inspiring Stories of People Who Overcame challenges through Skate boarding",
                        
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(height: 10),

                  Row(
                    spacing: 10,
                    children: [
                      Row(
                        children: [
                          FaIcon(FontAwesomeIcons.heart, size: 20),
                          SizedBox(width: 5),
                          CustomText(content: "${newsmeta['likes']}k"),
                          
                        ],
                      ),
                      Row(
                        children: [
                          FaIcon(FontAwesomeIcons.bookmark, size: 20),
                          SizedBox(width: 5),
                          CustomText(content: "${newsmeta['bookmarks']}k"),
                        ],
                      ),
                      Row(
                        children: [
                          FaIcon(FontAwesomeIcons.comment, size: 20),
                          SizedBox(width: 5),
                          CustomText(content: "${newsmeta['coment']}k"),
                        ],
                      ),
                      Row(
                        children: [
                          FaIcon(FontAwesomeIcons.angular, size: 20),
                          SizedBox(width: 5),
                          CustomText(content: "${newsmeta['reach']}k"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
