import 'package:connect/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          
        ],
      ),
      body: ListView(
        children: [
              Padding(
      
                padding: const EdgeInsets.all(8.0),
                child: RoundedBgImage(
                bgImage:  ImageWidget(imagePath: "images/tgth.jpeg",imgHeight: 100,),
                widgetActions: WidgetActions(
                  title: CustomText(content: "Don't miss th hot News to day"),
                  tag: "Yoo",
                ),
                ),
              )

            ],
          )
    );
  }
}

