import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginController extends GetxController {
  final supabase = Supabase.instance.client;
  RxBool loading = false.obs;
  final formKey = GlobalKey<FormBuilderState>();
  final RxString responseMsg = ''.obs;
  RxBool isError = false.obs;
  Future login() async {
    if (formKey.currentState!.saveAndValidate(
      autoScrollWhenFocusOnInvalid: true,
    )) {
      loading.value = true;
      // return Future.delayed(Duration(seconds: 3), () {
      //   loading.value = false;
      //   Get.offNamed('/home');
      // });

      try {
        final AuthResponse res = await supabase.auth.signInWithPassword(
          email: formKey.currentState!.fields['email']!.value,
          password: formKey.currentState!.fields['pwd']!.value,
        );
        final Session? session = res.session;
        final User? user = session?.user;
        // if (user != null) {
        //   await supabase.from('users').insert({
        //     'id': user.id,
        //     'full_name': user.userMetadata!['name'] ?? '',
        //     'phone_number': user.phone,
        //     'emails': user.email,
        //   });
        // }
        // print("User: ${session!.user.}");
        loading.value = false;
        responseMsg.value = "Welcome Login Successful";
        isError.value = false;
        Get.offAllNamed('/home');
      } catch (e) {
        // print("Login error: $e");
        loading.value = false;
        responseMsg.value = "Login failed. Please try again.";
        isError.value = true;
      }
    }
  }
}
