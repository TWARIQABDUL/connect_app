import 'package:connect/contr0ller/news_controler.dart';
import 'package:connect/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';

class CategoriesList extends GetView {
  final NewsControler newsControler = Get.put(NewsControler());
  CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        child: ListView(
          scrollDirection: Axis.horizontal,
          
          children: [
            
            Row(
              spacing: 10,
              children: [
                
                  CustomButton(
                  buttonText: "All",
                  backGroundColor: Colors.black,
                  color: Colors.white,
                  action: (){
                    newsControler.sortnews("Bussiness");
                  },
                  ),
                  
                  CustomButton(
                  buttonText: "Sport",
                  backGroundColor: Color(0XFFF5F5F5),
                  color: Color(0XFF1B5E20),
                  ),
                  CustomButton(
                  buttonText: "Bussiness",
                  backGroundColor: Color(0XFFF5F5F5),
                  color: Color(0XFF1B5E20),
                  ),
                  CustomButton(
                  buttonText: "E-Sport",
                  backGroundColor: Color(0XFFF5F5F5),
                  color: Color(0XFF1B5E20),
                  ),
                  CustomButton(
                  buttonText: "E-Sport",
                  backGroundColor: Color(0XFFF5F5F5),
                  color: Color(0XFF1B5E20),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}