import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:taiwanswim_getx_app/app/data/constants/app_constants.dart';
import 'package:taiwanswim_getx_app/app/modules/root/home/dashboard/controllers/dashboard_controller.dart';
import 'package:taiwanswim_getx_app/app/modules/root/home/dashboard/views/widgets/search_bar.dart';
import 'package:taiwanswim_getx_app/utils/screen_size.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);

    PageController pageController = PageController();

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
                      _avatarCheck(),
                      SizedBox(width: 10.w),
                      _displayName(),
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
                        const SearchBarWidget(),
                        SizedBox(height: 20.h),
                        _startCarous(),
                        SizedBox(height: 20.h),
                        _indicator(),
                        SizedBox(height: 20.h),
                        _horizontalDesign(),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  ElevatedButton(
                      // for testing
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

  Widget _avatarCheck() {
    return Obx(() {
      var fadeInImage = FadeInImage(
        placeholder: const AssetImage(AssetConstants.defaultPlacehold),
        image: NetworkImage(controller.photoURL.value, scale: 1.0),
        height: 50.h,
        width: 49.93.w,
      );
      return ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: fadeInImage,
      );
    });
  }

  Widget _displayName() {
    return Obx(() => Expanded(
          child: Text(
            "Welcome,${controller.displayName.value}",
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              fontFamily: 'Gilroy',
              color: const Color.fromRGBO(0, 0, 0, 1),
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ));
  }

  Widget _startCarous() {
    return CarouselSlider.builder(
      options: CarouselOptions(
        autoPlay: false,
        enableInfiniteScroll: true,
        initialPage: 0,
        height: 150.0.h,
        enlargeCenterPage: false,
        viewportFraction: 0.84,
        onPageChanged: (index, reason) {
          controller.onChange(index.obs);
        },
      ),
      itemBuilder: (BuildContext context, int index, int realIndex) {
        return Padding(
          padding: EdgeInsets.only(
              left: index == 0 ? 0.w : 12.w, right: index == 2 ? 12.w : 0.w),
          child: Container(
            height: 150.h,
            width: 322.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(controller.sliders[index].image!),
              ),
              borderRadius: BorderRadius.circular(22),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20.h, left: 25.w, right: 110.w),
                  child: Text(
                    controller.sliders[index].title!,
                    style: TextStyle(
                        fontFamily: 'Gilroy',
                        color: const Color.fromRGBO(0, 0, 0, 1),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(height: 29.sp),
                Padding(
                  padding: EdgeInsets.only(left: 25.w),
                  child: Text(
                    "Get Start",
                    style: TextStyle(
                        color: const Color.fromRGBO(35, 64, 143, 1),
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Gilroy',
                        fontSize: 18.sp),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: controller.sliders.length,
    );
  }

  Widget _indicator() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(controller.sliders.length, (index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: Obx(() => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 10.h,
                  width: 10.w,
                  //margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: (index == controller.currentpage.value)
                          ? const Color.fromRGBO(35, 64, 143, 1)
                          : const Color.fromRGBO(222, 222, 222, 1)),
                )),
          );
        }));
  }

  Widget _horizontalDesign() {
    return SizedBox(
      //color: Colors.red,
      height: 100.h,
      width: double.infinity,
      child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          shrinkWrap: true,
          primary: false,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: controller.designs.length,
          itemBuilder: (BuildContext context, index) {
            return Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: index == 0 ? 0.w : 6.w),
                  child: Image(
                    image: AssetImage(controller.designs[index].image!),
                    height: 110.h,
                    width: 110.w,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 60.h),
                  child: Text(
                    controller.designs[index].name!,
                    style: TextStyle(
                        color: const Color.fromRGBO(0, 0, 0, 1),
                        fontSize: 14.sp,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            );
          }),
    );
  }

  // Widget trending_cource_list() {
  //   return SizedBox(
  //     //color: Colors.red,
  //     height: 234.h,
  //     width: double.infinity.w,
  //     child: ListView.builder(
  //         padding: EdgeInsets.symmetric(horizontal: 16.w),
  //         physics: const BouncingScrollPhysics(),
  //         primary: false,
  //         shrinkWrap: true,
  //         scrollDirection: Axis.horizontal,
  //         itemCount: 3,
  //         itemBuilder: (BuildContext context, index) {
  //           return Padding(
  //             padding: EdgeInsets.symmetric(horizontal: 4.w),
  //             child: GestureDetector(
  //               onTap: () {
  //                 Get.to(MyCources(trende: trendingCource[index]));
  //               },
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Container(
  //                     height: 172.h,
  //                     width: 177.w,
  //                     decoration: BoxDecoration(
  //                       image: DecorationImage(
  //                         image: AssetImage(trendingCource[index].image!),
  //                       ),
  //                     ),
  //                     //alignment: Alignment.topLeft,
  //                     child: Padding(
  //                       padding: EdgeInsets.only(
  //                           left: 10.w, right: 147.w, bottom: 142.h),
  //                       child: Container(
  //                           height: 20.h,
  //                           width: 20.w,
  //                           decoration: const BoxDecoration(
  //                               shape: BoxShape.circle, color: Colors.white),
  //                           child: Center(
  //                             child: GestureDetector(
  //                               onTap: () {
  //                                 toggle(index);
  //                               },
  //                               child:
  //                                   trendingCource[index].buttonStatus == true
  //                                       ? Image(
  //                                           image: const AssetImage(
  //                                               "assets/saveboldblue.png"),
  //                                           height: 10.h,
  //                                           width: 9.w,
  //                                         )
  //                                       : Image(
  //                                           image: const AssetImage(
  //                                               "assets/savebold.png"),
  //                                           height: 10.h,
  //                                           width: 9.w,
  //                                         ),
  //                             ),
  //                           )),
  //                     ),
  //                   ),
  //                   SizedBox(height: 8.h),
  //                   Text(
  //                     trendingCource[index].title!,
  //                     style: TextStyle(
  //                         fontFamily: 'Gilroy',
  //                         fontWeight: FontWeight.w700,
  //                         fontSize: 15.sp,
  //                         color: const Color(0XFF000000)),
  //                   ),
  //                   SizedBox(height: 5.h),
  //                   Text(trendingCource[index].subtitle!,
  //                       style: TextStyle(
  //                           fontFamily: 'Gilroy',
  //                           fontWeight: FontWeight.w700,
  //                           fontSize: 15.sp,
  //                           color: const Color(0XFF000000))),
  //                 ],
  //               ),
  //             ),
  //           );
  //         }),
  //   );
  // }

  // Widget recent_added_list() {
  //   return Container(
  //     color: const Color(0XFFFFFFFF),
  //     height: 323.h,
  //     width: double.infinity.w,
  //     child: ListView.builder(
  //         padding: EdgeInsets.symmetric(horizontal: 16.w),
  //         physics: const BouncingScrollPhysics(),
  //         primary: false,
  //         shrinkWrap: true,
  //         itemCount: recentAdded.length,
  //         scrollDirection: Axis.horizontal,
  //         itemBuilder: (BuildContext context, index) {
  //           return GestureDetector(
  //             onTap: () {
  //               Get.to(RecentCourceDetail(
  //                 corcedetail: recentAdded[index],
  //               ));
  //             },
  //             child: Padding(
  //               padding: EdgeInsets.symmetric(horizontal: 4.w),
  //               child: Container(
  //                 //height: 323,
  //                 width: 276.w,

  //                 decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(12),
  //                     boxShadow: [
  //                       BoxShadow(
  //                           color: const Color(0XFF23408F).withOpacity(0.14),
  //                           offset: const Offset(-4, 5),
  //                           blurRadius: 16),
  //                     ],
  //                     color: Colors.white),
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Container(
  //                       height: 158.h,
  //                       width: 276.w,
  //                       decoration: BoxDecoration(
  //                         borderRadius: BorderRadius.circular(12),
  //                         image: DecorationImage(
  //                             image: AssetImage(
  //                               recentAdded[index].image!,
  //                             ),
  //                             fit: BoxFit.cover),
  //                       ),
  //                       child: Padding(
  //                         padding: EdgeInsets.only(
  //                             right: 230.w, bottom: 120.h, top: 10.h),
  //                         child: Container(
  //                             height: 20.h,
  //                             width: 20.w,
  //                             decoration: const BoxDecoration(
  //                                 shape: BoxShape.circle, color: Colors.white),
  //                             child: IconButton(
  //                                 splashRadius: 10,
  //                                 onPressed: () {
  //                                   toggleRecent(index);
  //                                 },
  //                                 icon: Center(
  //                                   child:
  //                                       recentAdded[index].buttonStatus == true
  //                                           ? Image(
  //                                               image: const AssetImage(
  //                                                   "assets/saveboldblue.png"),
  //                                               height: 10.h,
  //                                               width: 9.w,
  //                                             )
  //                                           : Image(
  //                                               image: const AssetImage(
  //                                                   "assets/savebold.png"),
  //                                               height: 10.h,
  //                                               width: 9.w,
  //                                             ),
  //                                 ))),
  //                       ),
  //                     ),
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         Padding(
  //                           padding: EdgeInsets.only(left: 10.w, top: 10.h),
  //                           child: Container(
  //                             height: 25.h,
  //                             width: 58.w,
  //                             decoration: BoxDecoration(
  //                               borderRadius: BorderRadius.circular(20),
  //                               color: const Color(0XFFFAF4E1),
  //                             ),
  //                             child: Row(
  //                               mainAxisAlignment:
  //                                   MainAxisAlignment.spaceEvenly,
  //                               children: [
  //                                 Image(
  //                                   image:
  //                                       const AssetImage("assets/staricon.png"),
  //                                   height: 17.h,
  //                                   width: 17.w,
  //                                 ),
  //                                 Text(
  //                                   recentAdded[index].review!,
  //                                   style: TextStyle(
  //                                       fontFamily: 'Gilroy',
  //                                       color: const Color(0XFFFFC403),
  //                                       fontSize: 15.sp),
  //                                 ),
  //                               ],
  //                             ),
  //                           ),
  //                         ),
  //                         Padding(
  //                           padding: EdgeInsets.only(right: 5.w),
  //                           child: Row(
  //                             children: [
  //                               Image(
  //                                 image: const AssetImage("assets/clock.png"),
  //                                 height: 17.h,
  //                                 width: 17.w,
  //                               ),
  //                               SizedBox(width: 4.w),
  //                               Text(
  //                                 recentAdded[index].time!,
  //                                 style: TextStyle(
  //                                     fontSize: 15.sp,
  //                                     color: const Color(0XFF000000),
  //                                     fontFamily: 'Gilroy'),
  //                               )
  //                             ],
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                     SizedBox(height: 11.h),
  //                     Padding(
  //                       padding: EdgeInsets.only(left: 10.w, right: 10.w),
  //                       child: Text(
  //                         recentAdded[index].title!,
  //                         style: TextStyle(
  //                             fontWeight: FontWeight.w700,
  //                             fontSize: 15.sp,
  //                             color: const Color(0XFF000000),
  //                             fontFamily: 'Gilroy'),
  //                       ),
  //                     ),
  //                     SizedBox(height: 11.h),
  //                     Padding(
  //                       padding: EdgeInsets.only(left: 10.w, right: 10.w),
  //                       child: Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: [
  //                           Row(
  //                             children: [
  //                               Image(
  //                                 image: AssetImage(
  //                                     recentAdded[index].circleimage!),
  //                                 height: 40.h,
  //                                 width: 40.w,
  //                               ),
  //                               SizedBox(width: 10.w),
  //                               Text(
  //                                 recentAdded[index].personname!,
  //                                 style: TextStyle(
  //                                     fontFamily: 'Gilroy',
  //                                     fontWeight: FontWeight.w400,
  //                                     color: const Color(0XFF23408F),
  //                                     fontSize: 15.sp),
  //                               ),
  //                             ],
  //                           ),
  //                           Container(
  //                             height: 33.h,
  //                             width: 76.w,
  //                             decoration: BoxDecoration(
  //                               borderRadius: BorderRadius.circular(12),
  //                               color: const Color(0XFFE5ECFF),
  //                             ),
  //                             child: Center(
  //                                 child: Text(
  //                               recentAdded[index].price!,
  //                               style: TextStyle(
  //                                   color: const Color(0XFF23408F),
  //                                   fontFamily: 'Gilroy',
  //                                   fontSize: 19.sp,
  //                                   fontWeight: FontWeight.bold),
  //                             )),
  //                           )
  //                         ],
  //                       ),
  //                     )
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           );
  //         }),
  //   );
  // }
}
