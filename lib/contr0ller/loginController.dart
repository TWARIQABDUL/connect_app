import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool loading = false.obs;

  Future login() async {
    loading.value = true;
    return Future.delayed(Duration(seconds: 3), () {
      loading.value = false;
      Get.offNamed('/home');
    });
  }
}
