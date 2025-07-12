import 'package:connect/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CustomTextInput extends StatelessWidget {
  final String inputName;
  final String? inputContent;
  final bool securedInput;

  const CustomTextInput({
    this.inputContent,
    required this.inputName,
    this.securedInput = false

  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
              name: inputName,
              obscureText: securedInput,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                label: CustomText(
                  content: inputContent??"",
                  fontWeight: FontWeight.w800,
                ),
                
              ),
            );
  }
}