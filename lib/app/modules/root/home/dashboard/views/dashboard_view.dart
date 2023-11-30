import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:taiwanswim_getx_app/utils/tools.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    final uid = getParameter("uid");
    final uid2 = getArguments();
    print('uid2: ${uid2}');

    print('uid: ${uid}');

    return Scaffold(
      appBar: AppBar(
        title: const Text('DashboardView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Center(
            child: Text(
              'DashboardView is working',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {
              controller.googleLogout();
            },
            child: const Text('Go to HomeView'),
          ),
        ],
      ),
    );
  }
}
