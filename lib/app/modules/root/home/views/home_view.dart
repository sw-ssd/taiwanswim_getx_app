import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';

import 'package:taiwanswim_getx_app/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(
      builder: (context, delegate, currentRoute) {
        //This router outlet handles the appbar and the bottom navigation bar
        final currentLocation = currentRoute?.uri;
        var currentIndex = 0;
        if (currentLocation?.path.startsWith(Routes.RECORDS) == true) {
          currentIndex = 2;
        }
        if (currentLocation?.path.startsWith(Routes.PROFILE) == true) {
          currentIndex = 1;
        }
        return Scaffold(
          body: GetRouterOutlet(
            initialRoute: Routes.DASHBOARD,
            // anchorRoute: Routes.HOME,
            key: Get.nestedKey(Routes.HOME),
          ),
          bottomNavigationBar: bottomNav(currentIndex, delegate),
        );
      },
    );
  }

  Container bottomNav(int currentIndex, GetDelegate delegate) {
    BottomNavigationBarItem item(Icon actIcon, Icon icon, String label) {
      return BottomNavigationBarItem(
          activeIcon: actIcon, icon: icon, label: label);
    }

    return Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(22), topLeft: Radius.circular(22)),
          boxShadow: [
            BoxShadow(
                color: const Color.fromRGBO(35, 64, 143, 1).withOpacity(0.12),
                spreadRadius: 0,
                blurRadius: 12),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(22.0),
            topRight: Radius.circular(22.0),
          ),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (value) {
              switch (value) {
                case 0:
                  delegate.toNamed(Routes.HOME);
                  break;
                case 1:
                  delegate.toNamed(Routes.PROFILE);
                  break;
                case 2:
                  delegate.toNamed(Routes.RECORDS);
                  break;
                default:
              }
            },
            items: [
              // _Paths.HOME + [Empty]
              item(
                  const LineIcon.home(
                    size: 24,
                    color: Color.fromRGBO(35, 64, 143, 1),
                  ),
                  const LineIcon.home(
                    size: 24,
                    color: Color.fromRGBO(0, 0, 0, 1),
                  ),
                  ''),
              // _Paths.HOME + Routes.PROFILE
              item(
                  const LineIcon.userCircle(
                    size: 24,
                    color: Color.fromRGBO(35, 64, 143, 1),
                  ),
                  const LineIcon.userCircle(
                    size: 24,
                    color: Color.fromRGBO(0, 0, 0, 1),
                  ),
                  ''),
              // _Paths.HOME + _Paths.RECORDS
              item(
                  const LineIcon.alternateTachometer(
                    size: 24,
                    color: Color.fromRGBO(35, 64, 143, 1),
                  ),
                  const LineIcon.alternateTachometer(
                    size: 24,
                    color: Color.fromRGBO(0, 0, 0, 1),
                  ),
                  ''),
            ],
          ),
        ));
  }
}
