import 'package:get/get.dart';

import 'package:taiwanswim_getx_app/app/data/mocks/onboard_mock.dart';

import '../models/onboard_model.dart';

class OnboardProvider extends GetConnect {
  @override
  void onInit() {
    // httpClient.defaultDecoder = (map) {
    //   if (map is Map<String, dynamic>) return Onboard.fromJson(map);
    //   if (map is List) {
    //     return map.map((item) => Onboard.fromJson(item)).toList();
    //   }
    // };
    // httpClient.baseUrl = ApiPaths.BASE_URL;
    // httpClient.userAgent = ApiPaths.CUST_USER_AGENT;
  }

  // Future<Onboard?> getOnboards(int? fetchNumber) async {
  //   final response = await get('${ApiPaths.ON_BOARD}/?$fetchNumber');
  //   return response.body;
  // }

  // Future<Onboard?> getOnboard(int id) async {
  //   final response = await get('${ApiPaths.ON_BOARD}/$id');
  //   return response.body;
  // }

  // Future<Response<Onboard>> postOnboard(Onboard onboard) async =>
  //     await post(ApiPaths.ON_BOARD, onboard);

  // Future<Response> deleteOnboard(int id) async =>
  //     await delete('${ApiPaths.ON_BOARD}/$id');

  List<Onboard> getOnboardsMock() {
    return onboardMockdata;
  }
}
