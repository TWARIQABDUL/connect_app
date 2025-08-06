import 'package:connect/contr0ller/input_controller.dart';
import 'package:connect/contr0ller/register_controller.dart';
import 'package:connect/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
// import 'package:get/state_manager.dart';

class CustomTextInput extends GetView {
  // final RegisterController registerController = Get.put(RegisterController());
  final InputController inputController = Get.put(InputController());
  final String inputName;
  final String? inputContent;
  final bool securedInput;
  final int? maxLength;
  final TextInputType? keyboardType;
  final Function? onChanged;
  final prevPwd;
  final List<FormFieldValidator<String>>? validator;
  CustomTextInput({
    this.inputContent,
    required this.inputName,
    this.securedInput = false,
    this.maxLength,
    this.keyboardType,
    this.prevPwd = "",
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    // print(controller.formKey.currentState?.fields[inputName]?.value);
    return securedInput
        ? Obx(
            () => FormBuilderTextField(
              name: inputName,

              maxLength: maxLength ?? 50,
              keyboardType: keyboardType ?? TextInputType.text,
              obscureText: inputController.securedInput.value,

              decoration: InputDecoration(
                counterText: '',
                // filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                label: CustomText(
                  content: inputContent ?? "",
                  fontWeight: FontWeight.w800,
                ),
                suffixIcon: securedInput
                    ? IconButton(
                        icon: Icon(Icons.visibility, color: Colors.grey),
                        onPressed: () {
                          print(
                            "Toggling secured input${inputController.securedInput.value}",
                          );
                          inputController.toggleSecuredInput();
                        },
                      )
                    : null,
              ),
              onChanged: (value) => onChanged?.call(value),
              validator: (value) {
                return validator?.isNotEmpty ?? false
                    ? FormBuilderValidators.compose(validator!)(value)
                    : null;
              },
            ),
          )
        : FormBuilderTextField(
            name: inputName,

            maxLength: maxLength ?? 50,
            keyboardType: keyboardType ?? TextInputType.text,
            obscureText: securedInput,

            decoration: InputDecoration(
              counterText: '',
              // filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              label: CustomText(
                content: inputContent ?? "",
                fontWeight: FontWeight.w800,
              ),
            ),
            validator: (value) {
              return validator?.isNotEmpty ?? false
                  ? FormBuilderValidators.compose(validator!)(value)
                  : null;
            },
          );
  }
}
