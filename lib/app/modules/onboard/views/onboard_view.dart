import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:taiwanswim_getx_app/utils/screen_size.dart';

import '../controllers/onboard_controller.dart';

class OnboardView extends GetView<OnboardController> {
  const OnboardView({super.key});

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    // controller.initPageMock();
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            generatepage(),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 42.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(() => indicator()),
                        button(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                skipbutton(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget indicator() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(controller.pages().length, (index) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 10,
            width: 10,
            margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 30.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.h),
                color: (index == controller.currentpage())
                    ? const Color.fromRGBO(35, 64, 143, 1)
                    : const Color.fromRGBO(222, 222, 222, 1)),
          );
        }));
  }

  Widget button() {
    final br = BorderRadius.circular(22.h);
    return Ink(
      decoration: BoxDecoration(
          // color: const Color.fromRGBO(35, 64, 143, 1),
          borderRadius: br,
          color: const Color.fromRGBO(35, 64, 143, 1)),
      child: InkWell(
        onTap: controller.nextIntro,
        borderRadius: br,
        splashColor: const Color.fromRGBO(35, 64, 143, 1),
        child: SizedBox(
          height: 56.h,
          width: 177.w,
          child: (controller.currentpage() == controller.pages().length - 1)
              ? Center(
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                        color: const Color.fromRGBO(255, 255, 255, 1),
                        fontSize: 18.sp,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w700),
                  ),
                )
              : Center(
                  child: Text(
                    "Next",
                    style: TextStyle(
                        color: const Color.fromRGBO(255, 255, 255, 1),
                        fontSize: 18.sp,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w700),
                  ),
                ),
        ),
      ),
    );
  }

  Widget skipbutton() {
    return controller.currentpage() == controller.pages().length - 1
        ? const SizedBox()
        : Padding(
            padding: const EdgeInsets.only(top: 25, right: 20),
            child: GestureDetector(
                onTap: controller.skipToggle,
                child: Container(
                    height: 32.h,
                    width: 68.w,
                    //color: Colors.red,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromRGBO(255, 255, 255, 1)),
                    child: Center(
                        child: Text(
                      "Skip",
                      style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          fontSize: 15.sp,
                          color: const Color.fromRGBO(0, 0, 0, 1)),
                    )))),
          );
  }

  Widget generatepage() {
    return PageView.builder(
        itemCount: controller.pages().length,
        scrollDirection: Axis.horizontal,
        controller: controller.pageController,
        onPageChanged: controller.onChangePage,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(controller.pages()[index].image!),
                height: 520.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 50.h),
              Text(
                controller.pages()[index].name!,
                style: TextStyle(
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w700,
                    color: const Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 22.sp),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Text(
                  controller.pages()[index].title!,
                  style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w700,
                      color: const Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 15.sp),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          );
        });
  }
}
