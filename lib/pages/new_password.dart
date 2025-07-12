import 'package:connect/widgets/custom_input.dart';
import 'package:connect/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
// import 'package:get/utils.dart';

class NewPasswordPage extends GetView {
  const NewPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          content: "Create New Password",
          fontWeight: FontWeight.w700,
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              CustomText(
                content:
                    "Type In your New Password",
                fontSize: 16,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
                // Optional if CustomText supports it
              ),
              FormBuilder(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                     
                      CustomTextInput(
                        inputContent: "New Password",
                        inputName: "pwd",
                        securedInput: true,
                      ),

                      SizedBox(height: 30),

                      CustomTextInput(
                        inputContent: "Re-type Password",
                        inputName: "rtpwd",
                        securedInput: true,
                      ),

                      SizedBox(height: 30),
                      // SizedBox(height: 30),
                      CustomButton(buttonText: "Submit",
                      action: (){
                        Get.offAllNamed('/login');
                      },
                      ),
                    ],
                  ),
                ),
              ),
              
            ],
          ),
        ],
      ),
    );
  }
}