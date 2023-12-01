// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';

import 'package:taiwanswim_getx_app/app/data/mocks/onboard_mock.dart';
import 'package:taiwanswim_getx_app/app/data/models/onboard_model.dart';

class OnboardProvider extends GetConnect {
  List<Onboard> boards = <Onboard>[];
  @override
  void onInit() {
    boards = [...OnboardMock.getOnboardsMock()];
    super.onInit();
  }
}
