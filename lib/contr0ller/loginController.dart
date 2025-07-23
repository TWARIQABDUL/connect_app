import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool loading = false.obs;
  final formKey = GlobalKey<FormBuilderState>();
  Future login() async {
    if (formKey.currentState!.saveAndValidate(autoScrollWhenFocusOnInvalid: true)) {
      loading.value = true;
      return Future.delayed(Duration(seconds: 3), () {
        loading.value = false;
        Get.offNamed('/home');
      });
    }
  }
}
