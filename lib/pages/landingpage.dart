import 'package:connect/contr0ller/appcontroller.dart';
import 'package:connect/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingPage extends GetView {
  // final Categories categories = Get.put(Categories());
  final AppController appController = Get.put(AppController());
 LandingPage({super.key});
  @override
  Widget build(BuildContext context) {
    appController.redirect();
    return Scaffold(
      backgroundColor: Color(0XFFFFFFFF),

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
