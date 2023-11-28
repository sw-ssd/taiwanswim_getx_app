import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:taiwanswim_getx_app/utils/screen_size.dart';

import '../controllers/signin_controller.dart';

class SigninView extends GetView<SigninController> {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: PopScope(
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
                      title(),
                      SizedBox(height: 16.h),
                      subTitle(),
                      SizedBox(height: 32.h),
                      logo(),
                      SizedBox(height: 32.h),
                      signButton(),
                      SizedBox(height: 32.h),
                      loginButton(
                        tap: controller.googleLogout,
                        title: "Logout with Google",
                        svgpath: "google_logo.svg",
                        backgroundColor: Colors.grey.withOpacity(0.3),
                        textColor: const Color.fromRGBO(35, 64, 143, 1),
                      ),
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

  Widget signButton() {
    late Widget button;
    if (GetPlatform.isIOS) {
      button = loginButton(
        tap: controller.googleLogin,
        title: "Login with Apple",
        svgpath: "apple_logo.svg",
        backgroundColor: Colors.grey.withOpacity(0.3),
        textColor: const Color.fromRGBO(35, 64, 143, 1),
      );
    } else if (GetPlatform.isAndroid) {
      button = loginButton(
        tap: controller.googleLogin,
        title: "Login with Google",
        svgpath: "google_logo.svg",
        backgroundColor: Colors.grey.withOpacity(0.3),
        textColor: const Color.fromRGBO(35, 64, 143, 1),
      );
    }
    return button;
  }

  Widget loginButton({
    required void Function() tap,
    required String title,
    required String svgpath,
    required Color backgroundColor,
    required Color textColor,
  }) {
    return Ink(
      child: InkWell(
        onTap: tap,
        child: Container(
          height: 56.h,
          width: 374.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: backgroundColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/svgs/$svgpath",
                  width: 32.w, height: 32.h),
              SizedBox(width: 10.w),
              Text(
                title,
                style: TextStyle(
                    color: textColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget logo() {
    return SvgPicture.asset("assets/svgs/swim_logo.svg",
        width: 95.h,
        height: 95.h,
        fit: BoxFit.fitHeight,
        colorFilter: const ColorFilter.mode(
            Color.fromRGBO(35, 64, 143, 1), BlendMode.srcIn));
  }

  Widget subTitle() {
    return Center(
        child: Text(
      "很高興再次見到你！",
      style: TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.black,
          fontSize: 15.sp,
          fontFamily: 'Gilroy',
          fontStyle: FontStyle.normal),
      textAlign: TextAlign.center,
    ));
  }

  Widget title() {
    return Center(
      child: Text(
        "登入",
        style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24.sp,
            fontFamily: 'Gilroy',
            color: Colors.black),
        textAlign: TextAlign.center,
      ),
    );
  }
}

// class TestIntroButton extends StatelessWidget {
//   const TestIntroButton({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(height: 16.h),
//         ElevatedButton(
//             onPressed: () {
//               Get.find<PrefData>().setIntro(false);
//             },
//             child: const Text("測試 Intro")),
//       ],
//     );
//   }
// }
