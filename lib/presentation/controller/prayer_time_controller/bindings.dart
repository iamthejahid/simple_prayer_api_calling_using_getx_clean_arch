import 'package:get/get.dart';
import 'prayer_time_controller.dart';

class DepenDenciess extends Bindings {
  // dependence injection attach our class.
  @override
  void dependencies() {
    Get.lazyPut<PrayerTimeController>(() => PrayerTimeController());
  }
}
