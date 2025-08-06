import 'package:get/get.dart';

class InputController extends GetxController {

  RxBool securedInput = false.obs;

  void toggleSecuredInput() {
    securedInput.value = !securedInput.value;
  }
}