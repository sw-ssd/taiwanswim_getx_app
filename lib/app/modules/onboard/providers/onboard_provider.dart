import 'package:get/get.dart';

import '../onboard_model.dart';

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

  List<Onboard> getOnboardsMock() {
    return [
      Onboard(
        image: 'assets/images/onboarding1st.png',
        name: 'Learn new skills every day!',
        title: 'We provide the best learning couerses & great mentors for you.',
      ),
      Onboard(
        image: 'assets/images/onboarding2nd.png',
        name: 'Easy enroll in class !',
        title: 'Learn anytime and anywhere easily and conveniently.',
      ),
      Onboard(
        image: 'assets/images/onboarding3rd.png',
        name: 'Get online certificate !',
        title:
            'Complete the full course with full dedication to get certificate.',
      ),
      Onboard(
        image: 'assets/images/onboarding4th.png',
        name: 'Explore new reasources !',
        title:
            'Find best course for your career that will help you to develop your skill.',
      ),
    ];
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
}
