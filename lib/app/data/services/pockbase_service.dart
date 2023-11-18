import 'package:get/get.dart';
import 'package:pocketbase/pocketbase.dart';

import 'package:taiwanswim_getx_app/app/data/constants/api_paths.dart';

class PbService extends GetxService {
  init() {
    final pb = PocketBase('${ApiPaths.BASE_URL}:${ApiPaths.BASE_PORT}');
    return pb;
  }
}
