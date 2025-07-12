import 'package:connect/widgets/custom_input.dart';
import 'package:connect/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class RegisterPage extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          content: "Setup Your Acount",
          fontWeight: FontWeight.w700,
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              CustomText(
                content:
                    "Please Complete all Information To create Account on Connect",
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
                        inputContent: "Full Name",
                        inputName: "name",
                      ),
                      SizedBox(height: 30),

                      CustomTextInput(
                        inputContent: "Email or Phone Number",
                        inputName: "phoneNb",
                      ),
                      SizedBox(height: 30),

                      CustomTextInput(
                        inputContent: "Password",
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
                      CustomButton(buttonText: "Register"),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(content: "Already Have Account"),
                      TextButton(
                        onPressed: () {
                          Get.offAllNamed('/login');
                        },
                        child: CustomText(
                          content: "Login",
                          color: Color(0XFF1B5E20),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  CustomButton(
                    buttonText: "Sign Up with Apple",
                    icon: Icons.apple,
                    backGroundColor: Colors.black,
                    iconColor: Colors.white,
                  ),
                  CustomButton(
                    buttonText: "Sign Up with Google",
                    icon: Icons.apple,
                    backGroundColor: Colors.white,
                    iconColor: Colors.black,
                    color: Colors.amber,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
