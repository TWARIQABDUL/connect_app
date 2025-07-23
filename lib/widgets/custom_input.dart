import 'package:connect/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class CustomTextInput extends StatelessWidget {
  final String inputName;
  final String? inputContent;
  final bool securedInput;

  const CustomTextInput({
    this.inputContent,
    required this.inputName,
    this.securedInput = false,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: inputName,

      obscureText: securedInput,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        label: CustomText(
          content: inputContent ?? "",
          fontWeight: FontWeight.w800,
        ),
      ),
      validator: FormBuilderValidators.compose(validator(inputName)),
    );
  }
}

List<FormFieldValidator<String>> validator(String inputKey) {
  switch (inputKey) {
    case 'email':
      return [
        FormBuilderValidators.email(errorText: "Enter te valid Email"),
        FormBuilderValidators.required(errorText: "Email can not be empty"),
      ];
    case 'pwd':
      return [
        FormBuilderValidators.password(
          minLength: 10,
          minSpecialCharCount: 2,
          minUppercaseCount: 2,
          minNumberCount: 3,
          minLowercaseCount: 2,
        ),
        FormBuilderValidators.required(errorText: "Password Can not be Empty"),
      ];
    default:
    return [];
  }
}
