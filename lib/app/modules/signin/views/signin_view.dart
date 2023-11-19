import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:taiwanswim_getx_app/utils/screen_size.dart';

import '../controllers/signin_controller.dart';

class SigninView extends GetView<SigninController> {
  const SigninView({super.key});

  Widget signButton() {
    late Widget button;
    if (GetPlatform.isIOS) {
      button = loginApple();
    } else if (GetPlatform.isAndroid) {
      button = loginGoogle();
    }
    return button;
  }

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: PopScope(
          //導航返回攔截
          canPop: false,
          child: Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.h),
                Expanded(
                  flex: 1,
                  child: ListView(
                    primary: true,
                    shrinkWrap: true,
                    physics:
                        const NeverScrollableScrollPhysics(), //建立不允許使用者滾動的滾動物理效果。
                    children: [
                      SizedBox(height: .2.sh),
                      Center(
                        child: Text(
                          "登入",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 24.sp,
                              fontFamily: 'Gilroy',
                              color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Center(
                          child: Text(
                        "很高興再次見到你！",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 15.sp,
                            fontFamily: 'Gilroy',
                            fontStyle: FontStyle.normal),
                        textAlign: TextAlign.center,
                      )),
                      SizedBox(height: 32.h),
                      SvgPicture.asset("assets/svgs/swim_logo.svg",
                          width: 95.h,
                          height: 95.h,
                          fit: BoxFit.fitHeight,
                          colorFilter: const ColorFilter.mode(
                              Color.fromRGBO(35, 64, 143, 1), BlendMode.srcIn)),
                      SizedBox(height: 32.h),
                      signButton(),
                      //SizedBox(height: 97.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget loginGoogle() {
    return GestureDetector(
      onTap: controller.googleToggle,
      child: Container(
        height: 56.h,
        width: 374.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey.withOpacity(0.1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/svgs/google_logo.svg",
                width: 32.w, height: 32.h),
            SizedBox(width: 10.w),
            Text(
              "Login with Google",
              style: TextStyle(
                  color: const Color.fromRGBO(35, 64, 143, 1),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  Widget loginApple() {
    return GestureDetector(
      onTap: controller.appleToggle,
      child: Container(
        height: 56.h,
        width: 374.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey.withOpacity(0.1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/svgs/apple_logo.svg"),
            SizedBox(width: 10.w),
            Text(
              "Login with Apple",
              style: TextStyle(
                  color: const Color.fromRGBO(35, 64, 143, 1),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
