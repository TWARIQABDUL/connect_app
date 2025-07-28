import 'package:get/get.dart';

class BookmarkController {

  RxBool ismarked = false.obs;

  addBookMark(){
    ismarked.value = !ismarked.value;
  }
  
}