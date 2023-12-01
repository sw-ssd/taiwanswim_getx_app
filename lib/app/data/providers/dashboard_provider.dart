import 'package:get/get_connect/connect.dart';

import 'package:taiwanswim_getx_app/app/data/mocks/dashboard_mock.dart';
import 'package:taiwanswim_getx_app/app/data/models/dashboard_model.dart';

class DashboardProvider extends GetConnect {
  List<DashSlider> sliders = <DashSlider>[];
  List<Design> designs = <Design>[];
  @override
  void onInit() {
    sliders = [...DashboardMock.getDashSlider()];
    designs = [...DashboardMock.getDesigns()];
    super.onInit();
  }
}
