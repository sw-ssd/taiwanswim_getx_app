import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:taiwanswim_getx_app/app/data/services/services.dart';

import 'app/routes/app_pages.dart';

const appTitle = 'Taiwan Swim';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initServices();
  runApp(
    GetMaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      getPages: AppPages.routes,
      // builder: (context, child) {
      //   return FutureBuilder<void>(
      //     key: const ValueKey('initFuture'),
      //     future: Future.delayed(const Duration(seconds: 2)),
      //     builder: (context, snapshot) {
      //       if (snapshot.connectionState == ConnectionState.done) {
      //         return child ?? const SizedBox.shrink();
      //       }
      //       return const SplashView();
      //     },
      //   );
      // },
      // routeInformationParser: GetInformationParser(
      //   initialRoute: Routes.SPLASH,
      // ),
      // routerDelegate: GetDelegate(
      //   backButtonPopMode: PopMode.History,
      //   preventDuplicateHandlingMode:
      //       PreventDuplicateHandlingMode.ReorderRoutes,
      // ),
    ),
  );
}
