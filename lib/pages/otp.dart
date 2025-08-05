import 'package:connect/contr0ller/otp_controller.dart';
// import 'package:connect/widgets/custom_input.dart';
import 'package:connect/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
// import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpValidation extends GetView {
  final OtpController otpController = Get.put(OtpController());
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Center(
                  child: PinCodeTextField(

                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(8),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeColor: Colors.green,
                      selectedColor: Colors.blue,
                      inactiveColor: Colors.grey,
                      fieldOuterPadding: EdgeInsetsGeometry.all(3)
                      // borderWidth: 2,

                    ),
                    appContext: context,
                    length: 6,
                    onChanged: (value) {
                      otpController.otp.value = value;
                      // print("Code entered is $value");
                    },
                    onCompleted: (value) {
                      otpController.otpValidation();
                    },
                  ),
                ),
                
                CustomButton(
                  buttonText: "Submit",
                  action: () {
                    otpController.otpValidation();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
