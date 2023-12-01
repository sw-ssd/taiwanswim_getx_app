import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:taiwanswim_getx_app/app/data/constants/app_constants.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: TextFormField(
            onTap: () {
              log("Search");
            },
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: const Color.fromRGBO(35, 64, 143, 1),
                        width: 1.w),
                    borderRadius: BorderRadius.circular(22)),
                hintText: 'Search',
                hintStyle: TextStyle(
                    color: const Color.fromRGBO(155, 155, 155, 1),
                    fontSize: 15.sp,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w400),
                prefixIcon: Image(
                  image: const AssetImage(AssetConstants.search),
                  height: 24.h,
                  width: 24.w,
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    log("Filter");
                  },
                  child: Container(
                    height: 5.h,
                    width: 5.w,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AssetConstants.filico),
                      ),
                    ),
                  ),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22)))),
      ),
    );
  }
}
