import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class IsUserNewController extends GetxController {
  final box = GetStorage();

  bool get isUserNew => box.read('userType') ?? true;

  void makeUserOld() async {
    await box.write('userType', false);
    update();
    debugPrint(box.read('userType').toString());
  }

  void makeUserNew() async {
    await box.write('userType', true);
    update();
    debugPrint(box.read('userType').toString());
  }

  RxBool get isUserNewObs => isUserNew.obs;
}
