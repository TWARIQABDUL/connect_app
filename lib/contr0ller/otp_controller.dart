// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  final otp = "".obs;
  final loading = false.obs;
  Future otpValidation() async {
    if (otp.isNotEmpty && otp.value.length == 6) {
      loading.value = true;
      await Future.delayed(Duration(seconds: 2));
      loading.value = false;
      Get.snackbar("Success", "OTP validated successfully",animationDuration: Duration(seconds: 4));
      print("OTP validated: ${otp.value}");
      // Get.snackbar("Success", "OTP validated successfully");
    } else {

      Get.snackbar("Error", "Please enter a valid OTP ${otp.value}");
      print("OTP invalidated: ${otp.value}");

    }
  }
}
