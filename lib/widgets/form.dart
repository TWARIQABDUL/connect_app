import 'package:connect/contr0ller/loginController.dart';
import 'package:connect/widgets/custom_input.dart';
import 'package:connect/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class FormWidget extends GetView {
final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: loginController.formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomTextInput(
              inputContent: "Email Or Phone Number", 
              inputName: "email"),
            SizedBox(height: 30),

            CustomTextInput(
              inputContent: "Password", 
              inputName: "pwd",
              securedInput: true,
              ),
              
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Get.toNamed('/resetpwd');
                  },
                  child: CustomText(
                    content: "Forgot Password",
                    color: Color(0XFF1B5E20),
                    fontWeight: FontWeight.w400,
                  ),
                  
                ),
              ],
            ),
            // SizedBox(height: 30),

            Obx((){
              return CustomButton(
              buttonText: loginController.loading.value? "Loading":"Login",
              action: (){
                loginController.login();
              },
              loading: loginController.loading.value,

            );
            }),
           
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  content: "Or",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            CustomButton(
              buttonText: "Sign Up with Apple",
              icon: Icons.apple,
              backGroundColor: Colors.black,
              iconColor: Colors.white,
            ),
            SizedBox(height: 10,),
            CustomFaButton(
              buttonText: "Sign Up with Google",
              icon: FaIcon(
                FontAwesomeIcons.google,
                color: Colors.red,
                size: 30,

                ),
              backGroundColor: Colors.white,
              // iconColor: Colors.black,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          ],
        ),
      ),
    );
  }
}
