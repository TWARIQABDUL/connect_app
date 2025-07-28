import 'package:get/get.dart';

class AppController{
  // RxBool isloaded = false.obs;

  Future redirect() async{
    Future.delayed(Duration(seconds: 4),(){
      // isloaded.value = !isloaded.value;
      Get.offNamed('/home');
    });
  }

}