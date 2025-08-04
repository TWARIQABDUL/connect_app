import 'package:connect/contr0ller/forget_pwd_controller.dart';
import 'package:connect/widgets/custom_input.dart';
import 'package:connect/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class ForgetPasswordPage extends GetView {
  final ForgetPwdController forgetPwdController = Get.put(ForgetPwdController());

  ForgetPasswordPage({super.key});

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
          Flexible(
            child: FormBuilder(
              key: forgetPwdController.formKey,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
            
                  children: [
                    Column(
                      children: [
                        CustomTextInput(
                      inputContent: "Type in Your Email" , 
                      inputName: "email",
                      ),
                      ],
                    ),
                    // SizedBox(height: 20,),
                    Obx(() {
                      return CustomButton(
                        buttonText: forgetPwdController.loading.value
                            ? "Loading"
                            : "Submit",
                        action: () {
                          forgetPwdController.submitForm();
                        },
                        loading: forgetPwdController.loading.value,
                      );
                    }),
                    // CustomButton(buttonText: "Submit",
                    // action: (){
                    //   forgetPwdController.submitForm();
                    // },
                    
                    //)
                  ],
                ),
              )
            ),
          )
        ], 
      ),
    );
  }
}