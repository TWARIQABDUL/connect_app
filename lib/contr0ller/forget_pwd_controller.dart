import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class ForgetPwdController extends GetxController {
  final formKey = GlobalKey<FormBuilderState>();
  RxBool loading = false.obs;
  Future submitForm () async{
    if (formKey.currentState!.saveAndValidate(autoScrollWhenFocusOnInvalid: true)) {
      loading.value = true;
      return Future.delayed(Duration(seconds: 3), () {
        loading.value = false;
        Get.offNamed('/otp');
      });
    }
  
  }

}