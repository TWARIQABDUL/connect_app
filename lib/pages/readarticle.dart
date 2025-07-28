import 'package:connect/contr0ller/bookmark_controller.dart';
import 'package:connect/widgets/custom_widget.dart';
import 'package:connect/widgets/display_formated_post.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class Readarticle extends GetView {
  final BookmarkController bookmarkController = Get.put(BookmarkController());

  Readarticle({super.key});

  @override
  Widget build(BuildContext context) {
    const String testText = '''
In the words of Steve Jobs, "Innovation distinguishes between a leader and a follower ." 
Many entrepreneurs believe that Innovation distinguishes between a leader and a follower "failing fast is a strategy", but critics say "failure should not be glorified." 
During the conference, she boldly stated, " Innovation distinguishes between a leader and a follower We must act now to save our planet." 
Meanwhile, the document declared that "climate change is the biggest threat facing humanity today."

Some critics even argue that "technology is Innovation distinguishes between a leader and a follower evolving faster than our ethics." 
Remember what Einstein said? "Imagination Innovation distinguishes between a leader and a follower is more important than knowledge." 

Finally, always keep in mind, "You miss 100% of the shots you don’t take."
''';

    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            children: [
              TextButton(
                onPressed: () {
                  bookmarkController.addBookMark();
                },
                
                style: TextButton.styleFrom(
                  minimumSize: Size.zero, // Set this
                  padding: EdgeInsets.zero,
                ),
                child: Obx((){
                  return Icon(
                  Icons.bookmark,
                  color: bookmarkController.ismarked.value?Colors.amber:Colors.black,
                  size: 30,
                  );})
              ),
              // Icon(Icons.bookmark, size: 30),
              SizedBox(width: 10),
              Icon(Icons.more_vert, size: 30),
            ],
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RoundedBgImage(
              bgImage: ImageWidget(
                imagePath: "images/tgth.jpeg",
                imgHeight: 300,
                // imgHeight: 50,
                // imgWidth: 70,
              ),
              widgetActions: WidgetActions(
                opacity: 0.7,
                windowsAction: BotomInfo(
                  // buton: btn,
                  icon: FaIcon(
                    FontAwesomeIcons.squareHackerNews,
                    color: Colors.red,
                    size: 40,
                  ),

                  location: CustomText(
                    content: "Some",
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                // tags: tags,
              ),
            ),
          ),
          SizedBox(
            child: NewsBox(
              artTitle: CustomText(
                fontSize: 20,
                fontWeight: FontWeight.bold,

                content:
                    "Inspiring Sories of Peoples who overcame Challenges Through Skaet boarding",
              ),
              time: CustomText(content: "Politics 2 hours ago"),
              iconn: Icon(Icons.more_vert),
            ),
          ),
          PostContent(points: [], myString: testText),
        ],
      ),
    );
  }
}
