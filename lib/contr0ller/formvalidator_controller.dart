// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';

// import 'package:connect/contr0ller/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
// import 'package:get/instance_manager.dart';

class FormvalidatorController extends GetxController {
  RxBool securedInput = false.obs;
  // RegisterController registerController = Get.put(RegisterController());
  List<FormFieldValidator<String>> validateForm(String fieldName) {
    switch (fieldName) {
      case 'email':
        return [
          FormBuilderValidators.required(),
          FormBuilderValidators.email(),
        ];
      case 'pwd':
        return [
          FormBuilderValidators.required(),
          FormBuilderValidators.password(
            minLength: 10,
            minSpecialCharCount: 2,
            minUppercaseCount: 2,
            minNumberCount: 3,
            minLowercaseCount: 2,
          ),
        ];
      case 'name':
        return [
          FormBuilderValidators.required(),
          FormBuilderValidators.minLength(3),
        ];
      case 'phoneNb':
        return [
          FormBuilderValidators.required(),
          FormBuilderValidators.phoneNumber(
            regex: RegExp(r'^\+?[0-9]{10,15}$'),
            errorText: 'Please enter a valid phone number',
          ),
        ];
      case 'rtypwd':
        return [
          FormBuilderValidators.required(),
          FormBuilderValidators.password(
            minLength: 10,
            minSpecialCharCount: 2,
            minUppercaseCount: 2,
            minNumberCount: 3,
            minLowercaseCount: 2,
          ),

          // FormBuilderValidators.equal(registerController.password.value)
        ];
      case 'pwd':
        return [FormBuilderValidators.required()];
      default:
        return [];
    }
  }
}
