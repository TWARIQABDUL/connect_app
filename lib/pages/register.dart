import 'package:connect/contr0ller/formvalidator_controller.dart';
import 'package:connect/contr0ller/register_controller.dart';
import 'package:connect/widgets/custom_input.dart';
import 'package:connect/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class RegisterPage extends GetView {
  final RegisterController registerController = Get.put(RegisterController());
  final FormvalidatorController formvalidatorController = Get.put(
    FormvalidatorController(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          content: "Setup Your Acount",
          fontWeight: FontWeight.w700,
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              CustomText(
                content:
                    "Please Complete all Information To create Account on Connect",
                fontSize: 16,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
                // Optional if CustomText supports it
              ),
              FormBuilder(
                key: registerController.formsKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Obx(
                        () => CustomText(
                          content: registerController.responseMsg.value,
                          color: registerController.isError.value
                              ? Colors.red
                              : Colors.green,
                        ),
                      ),
                      CustomTextInput(
                        inputContent: "Full Name",
                        inputName: "name",
                        validator: formvalidatorController.validateForm('name'),
                      ),
                      SizedBox(height: 20),

                      CustomTextInput(
                        inputContent: "Email ",
                        inputName: "email",
                        keyboardType: TextInputType.emailAddress,
                        validator: formvalidatorController.validateForm(
                          'email',
                        ),
                      ),
                      SizedBox(height: 20),

                      CustomTextInput(
                        inputContent: "Phone Number",
                        inputName: "phoneNb",
                        keyboardType: TextInputType.phone,
                      ),
                      SizedBox(height: 20),

                      Obx(
                        () => Column(
                          children: [
                            CustomTextInput(
                              inputContent: "Type Password",
                              inputName: "pwd",
                              securedInput: true,
                              onChanged: (value) {
                                registerController.userpwd.value = value ?? '';
                              },
                              validator: formvalidatorController.validateForm(
                                'pwd',
                              ),
                              prevPwd: registerController.userpwd.value,
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 20),

                      Obx(
                        () => Column(
                          children: [
                            CustomTextInput(
                              inputContent: "Re-type Password",
                              inputName: "rtpwd",
                              securedInput: true,
                              onChanged: (value) {
                                registerController.confirmPassword.value =
                                    value ?? '';
                              },
                              validator: [
                                FormBuilderValidators.equal(
                                  registerController.userpwd.value,
                                  errorText: 'Passwords do not match',
                                ),
                                // FormBuilderValidators.minLength(6),
                              ],
                              prevPwd: registerController.userpwd.value,
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 20),
                      // SizedBox(height: 30),
                      CustomButton(
                        buttonText: "Register",
                        action: () => registerController.register(),
                        loading: registerController.loading.value,
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(content: "Already Have Account"),
                      TextButton(
                        onPressed: () {
                          Get.offAllNamed('/login');
                        },
                        child: CustomText(
                          content: "Login",
                          color: Color(0XFF1B5E20),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  CustomButton(
                    buttonText: "Sign Up with Apple",
                    icon: Icons.apple,
                    backGroundColor: Colors.black,
                    iconColor: Colors.white,
                  ),
                  SizedBox(height: 20),

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
            ],
          ),
        ],
      ),
    );
  }
}
