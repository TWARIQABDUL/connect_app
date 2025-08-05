import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegisterController extends GetxController {
  final formsKey = GlobalKey<FormBuilderState>();
  final RxString password = ''.obs;
  final RxString responseMsg = ''.obs;
  RxBool isError = false.obs;
  final supabase = Supabase.instance.client;
  RxBool loading = false.obs;

  Future register() async {
    // print("prev pwd: ${formKey.currentState?.fields['pwd']?.value} Retyped: ${formKey.currentState?.fields['rtpwd']?.value}");

    password.value = formsKey.currentState?.fields['pwd']?.value ?? '';
    if (formsKey.currentState!.saveAndValidate(
      autoScrollWhenFocusOnInvalid: true,
    )) {
      // print(
      //   "prev check pwd: ${formsKey.currentState?.fields['pwd']?.value} Retyped: ${formsKey.currentState?.fields['rtpwd']?.value}",
      // );
      loading.value = true;
      // return Future.delayed(Duration(seconds: 3), () {
      //   loading.value = false;
      //   Get.offNamed('/home');
      // });

      // print(
      //   "Registering with: ${formsKey.currentState!.fields['email']!.value}, ${formsKey.currentState!.fields['pwd']!.value}, ${formsKey.currentState!.fields['phoneNb']!.value}",
      // );

      try {
        final AuthResponse res = await supabase.auth.signUp(
          email: formsKey.currentState!.fields['email']!.value,
          password: formsKey.currentState!.value['pwd'],

          // phone: formsKey.currentState!.value['phoneNb'],
          data: {
            'name': formsKey.currentState!.fields['name']!.value,
            'phone': formsKey.currentState!.fields['phoneNb']!.value,
          },
        );

        // final Session? session = res.session;
        final User? user = res.user;
        if (user != null) {
          await supabase.from('users').insert({
            'id': user.id,
            'full_name': user.userMetadata!['name'] ?? '',
            'phone_number': user.userMetadata!['phone']?? '',
            'emails': user.email,
          });
        }
        // print("User: ${user}");
        responseMsg.value = "Registration Successful Check your email to verify your account";
        isError.value = false;
        loading.value = false;
        Get.snackbar("Success", "Please Verify your email${user?.email}");
        Get.offAllNamed('/login');

      } catch (e) {
        isError.value = true;
        responseMsg.value = "Registration failed. Please try again.";

        // print("Registration error: $e");
        loading.value = false;
        Get.snackbar("Error", "Registration failed. Please try again.");
      }
      // final Session? session = res.session;
      // final User? user = res.user;
      // print("User: ${user?.email}");
    }
  }
}
