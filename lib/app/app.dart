import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:getx_tasks/presentation/controller/is_user_new/is_user_new.dart';
import 'package:getx_tasks/presentation/pages/routes/routes.dart';
import '../presentation/controller/prayer_time_controller/bindings.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(IsUserNewController());
    debugPrint('Is user new : ' + controller.isUserNew.toString());
    return SimpleBuilder(
      builder: (_) => GetMaterialApp(
        initialBinding: DepenDenciess(),
        theme: ThemeData(fontFamily: GoogleFonts.droidSans().fontFamily),
        initialRoute: controller.isUserNew ? '/onBoardingPage' : '/landingPage',
        getPages: routes,
      ),
    );
  }
}
