import 'package:connect/widgets/custom_input.dart';
import 'package:connect/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class ForgetPasswordPage extends GetView {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          content: "Forgot your Password",
          fontWeight: FontWeight.w700,
        ),
      ),
      body: Column(
        children: [
          FormBuilder(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  Column(
                    children: [
                      CustomTextInput(
                    inputContent: "Type in Your Email" , 
                    inputName: "email"),
                    ],
                  ),
                  SizedBox(height: 20,),
                  CustomButton(buttonText: "Submit",
                  action: (){
                    Get.toNamed('/otp');
                  },
                  
                  )
                ],
              ),
            )
          )
        ], 
      ),
    );
  }
}