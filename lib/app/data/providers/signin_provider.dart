import 'package:flutter/material.dart';

import 'package:flutter_web_auth/flutter_web_auth.dart';
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
  final clinet = GetIt.I.get<PocketBase>();
  RxString googleId = "".obs;
  @override
  void onInit() {
    httpClient.baseUrl = getEnvBaseUrl();
    httpClient.userAgent = ApiPaths.CUST_USER_AGENT;
  }

  Future<void> googleOAuth2() async {
    final client = GetIt.I.get<PocketBase>();

    try {
      final authMethods =
          await client.collection(collectName).listAuthMethods();
      final google = authMethods.authProviders
          .where((am) => am.name.toLowerCase() == googleOAuthName)
          .first;

      print(google);

      final responseUrl = await FlutterWebAuth.authenticate(
          url: "${google.authUrl}$googleRedirectUri",
          callbackUrlScheme: "https");

      print(responseUrl);

      final parsedUri = Uri.parse(responseUrl);
      final code = parsedUri.queryParameters['code']!;

      final state = parsedUri.queryParameters['state']!;
      if (google.state != state) {
        throw "oops";
      }

      var result = await client.collection(collectName).authWithOAuth2Code(
          googleOAuthName, code, google.codeVerifier, googleRedirectUri);

      googleId.value = result.token;

      // final authData = await client
      //     .collection(collectName)
      //     .authWithOAuth2(googleOAuthName, (url) async {
      //   await launchUrl(url);
      // });

      // print(authData);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
