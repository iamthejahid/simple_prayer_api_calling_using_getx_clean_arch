import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_tasks/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init().then((value) => runApp(const App()));
}