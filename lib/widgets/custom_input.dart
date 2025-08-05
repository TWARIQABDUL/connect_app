import 'package:connect/contr0ller/register_controller.dart';
import 'package:connect/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
// import 'package:get/state_manager.dart';

class CustomTextInput extends GetView{
  final RegisterController controller = Get.put(RegisterController());

  final String inputName;
  final String? inputContent;
  final bool securedInput;
  final int? maxLength;
  final TextInputType? keyboardType;
  final prevPwd;
  CustomTextInput({
    this.inputContent,
    required this.inputName,
    this.securedInput = false,
    this.maxLength,
    this.keyboardType,
    this.prevPwd="",
  });

  @override
  Widget build(BuildContext context) {
    // print(controller.formKey.currentState?.fields[inputName]?.value);
    return FormBuilderTextField(
      name: inputName,
      
      maxLength: maxLength  ?? 50,
      keyboardType: keyboardType?? TextInputType.text,
      obscureText: securedInput,
      decoration: InputDecoration(
        counterText: '',
        // filled: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        label: CustomText(
          content: inputContent ?? "",
          fontWeight: FontWeight.w800,
        ),
      ),
      validator: FormBuilderValidators.compose(validator(inputName)),
      
    );
  }


List<FormFieldValidator<String>> validator(String inputKey) {
  switch (inputKey) {
    case 'email':
      return [
        // FormBuilderValidators.email(errorText: "Enter te valid Email"),
        // FormBuilderValidators.required(errorText: "Email can not be empty"),
      ];
    case 'pwd':
      return [
        // FormBuilderValidators.password(
        //   // minLength: 10,
        //   // minSpecialCharCount: 2,
        //   // minUppercaseCount: 2,
        //   // minNumberCount: 3,
        //   minLowercaseCount: 2,
        // ),
        FormBuilderValidators.required(errorText: "Password Can not be Empty"),
      ];
      case 'name':
      return [
        // FormBuilderValidators.required(errorText: "Name can not be empty"),
        // FormBuilderValidators.minLength(3, errorText: "Name must be at least 3 characters"),
        // FormBuilderValidators.maxLength(100, errorText: "Name must be at most 100 characters"),

      ];
      case 'phoneNb':
      return [
        // FormBuilderValidators.required(errorText: "Phone Number can not be empty"),
        // FormBuilderValidators.minLength(10, errorText: "Phone Number must be at least 10 characters"),
        // FormBuilderValidators.maxLength(15, errorText: "Phone Number must be at most 15 characters"),
        // FormBuilderValidators.numeric(errorText: "Phone Number must be a number"),
      ];
      case 'rtpwd':
// print("prev pwd: ${controller.password.value}");

      return [
        // FormBuilderValidators.required(errorText: "Re-type Password can not be empty"),
        // // FormBuilderValidators.minLength(10, errorText: "Re-type Password must be at least 10 characters"),
        // FormBuilderValidators.maxLength(100, errorText: "Re-type Password must be at most 100 characters"),
        // FormBuilderValidators.equal(controller.password.value, errorText: "Passwords do not match"),


      ];
    default:
    return [];
  }
}

}