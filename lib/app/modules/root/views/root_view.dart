import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:taiwanswim_getx_app/app/routes/app_pages.dart';

import '../controllers/root_controller.dart';

class RootView extends GetView<RootController> {
  const RootView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(
      builder: (context, delegate, current) {
        final title = current?.uri;
        var effectiveTitle = current?.currentPage?.title;
        if (effectiveTitle != null) {
          effectiveTitle = '(GetPage.effectiveTitle: $effectiveTitle)';
        } else {
          effectiveTitle = '';
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(
              '$title $effectiveTitle',
            ),
            centerTitle: true,
          ),
          body: GetRouterOutlet(
            initialRoute: Routes.SPLASH,
            // anchorRoute: '/',
            // filterPages: (afterAnchor) {
            //   return afterAnchor.take(1);
            // },
          ),
        );
      },
    );
  }
}
