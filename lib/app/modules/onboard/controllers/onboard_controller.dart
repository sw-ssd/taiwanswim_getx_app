// ignore_for_file: unnecessary_overrides

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:taiwanswim_getx_app/app/modules/onboard/onboard_model.dart';
import 'package:taiwanswim_getx_app/app/modules/onboard/providers/onboard_provider.dart';
import 'package:taiwanswim_getx_app/app/routes/app_pages.dart';
import 'package:taiwanswim_getx_app/utils/shared_pref.dart';

class OnboardController extends GetxController {
  late PageController pageController;
  final pages = RxList<Onboard>().obs;
  RxInt currentpage = 0.obs;

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
    initPageMock();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  skipToggle() {
    PrefData.setIntro(true);
    Get.offAllNamed(Routes.SIGNIN);
  }

  initPageMock() {
    pages.value.addAll(Get.find<OnboardProvider>().getOnboardsMock());
  }

  onChangePage(int index) {
    currentpage.value = index;
  }

  nextPage() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 100), curve: Curves.bounceIn);
  }

  nextIntro() {
    if (currentpage() == pages().length - 1) {
      PrefData.setIntro(true);
      Get.offAllNamed(Routes.SIGNIN);
    } else {
      nextPage();
    }
  }
}
