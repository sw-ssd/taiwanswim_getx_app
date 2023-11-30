import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:taiwanswim_getx_app/utils/screen_size.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(children: [
                      Image(
                        image: AssetImage(controller.member.value.photoURL!),
                        height: 50.h,
                        width: 49.93.w,
                      ),
                      SizedBox(width: 10.w),
                      Text("Welcome,${controller.member.value.displayName!}",
                          style: TextStyle(
                              fontFamily: 'Gilroy',
                              color: const Color.fromRGBO(0, 0, 0, 1),
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w700))
                    ]),
                  ),
                  SizedBox(height: 30.h),
                  Expanded(
                    child: ListView(
                      // physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      primary: true,
                      children: [
                        SizedBox(
                          height: 50.h,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: TextFormField(
                                onTap: () {},
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: const Color.fromRGBO(
                                                35, 64, 143, 1),
                                            width: 1.w),
                                        borderRadius:
                                            BorderRadius.circular(22)),
                                    hintText: 'Search',
                                    hintStyle: TextStyle(
                                        color: const Color.fromRGBO(
                                            155, 155, 155, 1),
                                        fontSize: 15.sp,
                                        fontFamily: 'Gilroy',
                                        fontWeight: FontWeight.w400),
                                    prefixIcon: Image(
                                      image: const AssetImage(
                                          'assets/images/search.png'),
                                      height: 24.h,
                                      width: 24.w,
                                    ),
                                    suffixIcon: GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        height: 5.h,
                                        width: 5.w,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/filico.png"),
                                          ),
                                        ),
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(22)))),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  ElevatedButton(
                      onPressed: controller.googleLogout,
                      child: const Text("Logout"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
