import 'package:connect/contr0ller/loginController.dart';
import 'package:connect/widgets/custom_widget.dart';
import 'package:connect/widgets/form.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
class LoginScreen extends GetView {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [Column(
          children: [
            SizedBox(
              height: 200,
              child: Stack(
                children: [
                  ImageWidget(
                    imagePath: 'images/tgth.jpeg',
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),

            SizedBox(
              // flex: 2,
              child: Column(
                children: [
                  CustomText(
                    content: "Let's Connect with Us !",
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(height: 10,),
                  FormWidget(),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        CustomText(content: "Don't Have Account"),
                        TextButton(
                          onPressed: (){
                            Get.toNamed('/register');
                          }, 
                          child: CustomText(
                            content: "Create Account",
                            color: Color(0XFF1B5E20),
                            fontWeight: FontWeight.w700,
                            )
                            )
                      ],)
                    ],
                  )
                  
                ],
              ),
            ),
          ],
        ),
        ]
      ),
    );
  }
}


