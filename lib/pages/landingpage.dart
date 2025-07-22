import 'package:connect/contr0ller/category_controller.dart';
import 'package:connect/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingPage extends GetView {
  final Categories categories = Get.put(Categories());
 LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFFFFFF),

      // body: ListView.builder(
      //   itemCount: categories.categories.length,

      //   itemBuilder: (context, index){
      //     final category = categories.categories[index];
      //     return Text(category.title);
      //   },
      // ),

      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomIcon(
              icon: Icons.control_point_duplicate_outlined,
              color: Color(0XFF1B5E20),
               iconWeight: 10,
               size: 30,
            ),
            SizedBox(width: 5,),
            CustomText(content: "Connect",
            color: Color(0XFF1B5E20),
            fontWeight: FontWeight.bold,
            fontSize: 30,
            )
          ],
        ),
      ),
    );
  }
}
