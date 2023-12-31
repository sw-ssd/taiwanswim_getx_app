// ignore_for_file: unnecessary_overrides

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:taiwanswim_getx_app/app/data/models/onboard_model.dart';
import 'package:taiwanswim_getx_app/app/data/providers/onboard_provider.dart';
import 'package:taiwanswim_getx_app/app/data/services/shared_pref_service.dart';
import 'package:taiwanswim_getx_app/app/routes/app_pages.dart';

class OnboardController extends GetxController {
  late PageController pageController;
  final pages = RxList<Onboard>().obs;
  RxInt currentpage = 0.obs;

  final _pd = Get.find<PrefData>();

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
    _pd.setIntro(true);
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
      _pd.setIntro(true);
      Get.offAllNamed(Routes.SIGNIN);
    } else {
      nextPage();
    }
  }
}
