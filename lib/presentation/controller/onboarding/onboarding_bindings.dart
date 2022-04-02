import 'package:get/get.dart';
import 'package:getx_tasks/presentation/controller/is_user_new/is_user_new.dart';

class OnBoardingPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IsUserNewController());
  }
}
