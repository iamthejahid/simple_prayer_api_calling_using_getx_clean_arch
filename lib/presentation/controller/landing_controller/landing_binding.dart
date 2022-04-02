import 'package:get/get.dart';
import 'package:getx_tasks/presentation/controller/prayer_time_controller/prayer_time_controller.dart';

class LandingPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PrayerTimeController());
  }
}
