import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/records_controller.dart';

class RecordsView extends GetView<RecordsController> {
  const RecordsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RecordsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RecordsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
