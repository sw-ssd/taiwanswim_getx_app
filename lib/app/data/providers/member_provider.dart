import 'package:get/get.dart';

import 'package:taiwanswim_getx_app/app/data/constants/api_paths.dart';

import '../models/member_model.dart';

class MemeberProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Member.fromJson(map);
      if (map is List) return map.map((item) => Member.fromJson(item)).toList();
    };
    httpClient.baseUrl = ApiPaths.BASE_URL;
  }

  Future<Member?> getUser(int id) async {
    final response = await get('member/$id');
    return response.body;
  }

  Future<Response<Member>> postUser(Member member) async =>
      await post('member', member);
  Future<Response> deleteUser(int id) async => await delete('member/$id');
}
