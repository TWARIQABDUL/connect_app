import 'package:connect/widgets/custom_input.dart';
import 'package:connect/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class OtpValidation extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          content: "Verify your OTP",
          fontWeight: FontWeight.w700,
        ),
      ),
      body: Column(
        children: [
          Flexible(
            child: FormBuilder(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Column(
                          
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 10,
                        children: [
                          SizedBox(
                            width: 50,
                            child: CustomTextInput(
                              inputName: "otp1",
                              maxLength: 1,
                              keyboardType: TextInputType.number,
                              ),
                          ),
                          SizedBox(
                            width: 50,
                            child: CustomTextInput(
                              inputName: "otp2",
                              maxLength: 1,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          SizedBox(
                            width: 50,
                            child: CustomTextInput(
                              inputName: "otp3",
                              maxLength: 1,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          SizedBox(
                            width: 50,
                            child: CustomTextInput(
                              inputName: "otp4",
                              maxLength: 1,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // SizedBox(height: 20),
                  CustomButton(
                    buttonText: "Submit",
                    action: () {
                      Get.toNamed('/newpassword');
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
