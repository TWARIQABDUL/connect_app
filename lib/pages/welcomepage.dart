import 'package:connect/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomePage extends GetView {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 50, 10, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,  // Align text center horizontally
          children: [
            CustomText(
              content: "Welcome To Connect",
              fontSize: 30,
              fontWeight: FontWeight.w800,
            ),
            SizedBox(height: 20),  // Add spacing between texts
            CustomText(
              content:
                  "We welcome you to the world of up-to-date News Information all over the world",
              fontSize: 16,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.center,
               // Optional if CustomText supports it
            ),
            SizedBox(height: 20,),
            ItemBox(itemTitle: "News Personalization",icon: Icons.ac_unit_rounded,),
            Spacer(),
            CustomButton(buttonText: "Continue",action: (){
              Get.offAllNamed('/login');
              // Navigator.pushNamed(context, "/login");
            },)

           

            
          ],
        ),
      ),
    );
  }
}

