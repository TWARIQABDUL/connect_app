import 'package:connect/contr0ller/formvalidator_controller.dart';
import 'package:connect/contr0ller/input_controller.dart';
import 'package:connect/contr0ller/loginController.dart';
import 'package:connect/widgets/custom_input.dart';
import 'package:connect/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class FormWidget extends GetView {
  final LoginController loginController = Get.put(LoginController());
  // final InputController inputController = Get.put(InputController());
  final FormvalidatorController formvalidatorController = Get.put(
    FormvalidatorController(),
  );

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: loginController.formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Obx(
              () => CustomText(
                content: loginController.responseMsg.value,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                textAlign: TextAlign.center,
                color: loginController.isError.value
                    ? Colors.red
                    : Colors.green,
              ),
            ),
            SizedBox(height: 10),

            CustomTextInput(
              inputContent: "Email Or Phone Number",
              inputName: "email",
              validator: formvalidatorController.validateForm('email'),
            ),
            SizedBox(height: 30),

            CustomTextInput(
              inputContent: "Password",
              inputName: "pwd",
              securedInput: true,
              validator: [
                FormBuilderValidators.required(),
                // FormBuilderValidators.minLength(6),
              ],
              // validator:
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Get.toNamed('/resetpwd');
                  },
                  child: CustomText(
                    content: "Forgot Password",
                    color: Color(0XFF1B5E20),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),

            // SizedBox(height: 30),
            Obx(() {
              return CustomButton(
                buttonText: loginController.loading.value ? "Loading" : "Login",
                action: () {
                  loginController.login();
                },
                loading: loginController.loading.value,
              );
            }),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  content: "Or",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            CustomButton(
              buttonText: "Sign Up with Apple",
              icon: Icons.apple,
              backGroundColor: Colors.black,
              iconColor: Colors.white,
            ),
            SizedBox(height: 10),
            CustomFaButton(
              buttonText: "Sign Up with Google",
              icon: FaIcon(
                FontAwesomeIcons.google,
                color: Colors.red,
                size: 30,
              ),
              backGroundColor: Colors.white,
              // iconColor: Colors.black,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          ],
        ),
      ),
    );
  }
}
