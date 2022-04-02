import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:getx_tasks/app/config/app_colors.dart';
import 'package:getx_tasks/app/utils/cirular_page_indicator.dart';
import 'package:getx_tasks/app/utils/onboarding_page_material.dart';
import 'package:getx_tasks/presentation/controller/is_user_new/is_user_new.dart';
import 'package:getx_tasks/presentation/pages/pages/landing_page.dart';

class Onboarding extends StatefulWidget {
  Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    var _controller = Get.find<IsUserNewController>();
    final PageController _pageController = PageController();
    final _currentPageNotifier = ValueNotifier<int>(0);
    List<String> _imageList = [
      'assets/image/1.png',
      'assets/image/2.png',
      'assets/image/3.png',
    ];

    return SimpleBuilder(
      builder: (_) => SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              PageView.builder(
                controller: _pageController,
                itemCount: 3,
                onPageChanged: (v) {
                  _currentPageNotifier.value = v;
                },
                itemBuilder: (ctx, index) =>
                    OnBoardingPageMaterial(imgaePath: _imageList[index]),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                margin: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        _controller.makeUserOld();
                        Get.offAll(() => LandingPage());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.1),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        margin: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        child: Text(
                          'skip',
                          style: TextStyle(
                            color: AppColors.webGrey,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    // Expanded(child: Container()),
                    CirclePageIndicator(
                      itemCount: 3,
                      currentPageNotifier: _currentPageNotifier,
                      dotColor: AppColors.themeGreen.withOpacity(0.5),
                      size: 9,
                      selectedDotColor: AppColors.themeGreen,
                      selectedSize: 12,
                      dotSpacing: 10,
                    ),
                    // Expanded(child: Container()),
                    InkWell(
                      onTap: () => _currentPageNotifier.value == 2
                          ? () {
                              _controller.makeUserOld();
                              Get.offAll(() => LandingPage());
                            }()
                          : _pageController
                              .jumpToPage(_currentPageNotifier.value + 1),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.1),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        margin: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        child: Text(
                          'next',
                          style: TextStyle(
                            color: AppColors.webGrey,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
