import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:taiwanswim_getx_app/app/data/constants/api_paths.dart';
import 'package:taiwanswim_getx_app/utils/tools.dart';

const String googleOAuthName = "google";
const String appleOAuthName = "apple";
const String collectName = "members";
const String appleRedirectUri = "members";

class SigninProvider extends GetConnect {
  final String googleRedirectUri = "${getEnvBaseUrl()}/api/oauth2-redirect";

  RxString googleId = "".obs;
  @override
  void onInit() {
    httpClient.baseUrl = getEnvBaseUrl();
    httpClient.userAgent = ApiPaths.CUST_USER_AGENT;
  }

  Future<void> googleOAuth2() async {
    final client = GetIt.I.get<PocketBase>();

    try {
      final authData = await client
          .collection(collectName)
          .authWithOAuth2(googleOAuthName, (url) async {
        await launchUrl(url);
      });

      print(authData);
    } catch (e) {
      rethrow;
    }
  }
}
