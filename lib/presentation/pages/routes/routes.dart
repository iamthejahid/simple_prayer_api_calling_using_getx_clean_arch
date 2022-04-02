import 'package:get/get.dart';
import 'package:getx_tasks/presentation/controller/landing_controller/landing_binding.dart';
import 'package:getx_tasks/presentation/controller/onboarding/onboarding_bindings.dart';
import 'package:getx_tasks/presentation/pages/pages/landing_page.dart';
import 'package:getx_tasks/presentation/pages/pages/on_board.dart';

List<GetPage> routes = [
  GetPage(
    name: '/onBoardingPage',
    page: () => const Onboarding(),
    binding: OnBoardingPageBinding(),
  ),
  GetPage(
    name: '/landingPage',
    page: () => const LandingPage(),
    binding: LandingPageBinding(),
  ),
];
