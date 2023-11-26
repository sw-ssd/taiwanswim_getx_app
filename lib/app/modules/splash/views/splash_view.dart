import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:taiwanswim_getx_app/app/data/services/shared_pref_service.dart';
import 'package:taiwanswim_getx_app/app/routes/app_pages.dart';
import 'package:taiwanswim_getx_app/utils/screen_size.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  getIntro() async {
    final pd = Get.find<PrefData>();
    bool isIntro = await pd.getIntro();
    Get.toNamed(Routes.ONBOARD);
    if (isIntro == false) {
      Timer(const Duration(seconds: 3), () => Get.toNamed(Routes.ONBOARD));
    } else {
      Get.offAllNamed(Routes.SIGNIN);
    }
  }

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    getIntro();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: SvgPicture.asset("assets/svgs/swim_logo.svg",
                  width: 95.h,
                  height: 95.h,
                  fit: BoxFit.cover,
                  colorFilter: const ColorFilter.mode(
                      Color.fromRGBO(35, 64, 143, 1), BlendMode.srcIn))),
          SizedBox(height: 20.h),
          Text(
            "Taiwan Swimming Records ",
            style: TextStyle(
                fontSize: 28.sp,
                color: const Color.fromRGBO(35, 64, 143, 1),
                fontFamily: 'AvenirLTPro',
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
