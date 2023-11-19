import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:pocketbase/pocketbase.dart';

import 'package:taiwanswim_getx_app/app/data/constants/api_paths.dart';

const String googleOAuthName = "google";
const String appleOAuthName = "apple";
const String collectName = "members";

class SigninProvider extends GetConnect {
  final clinet = GetIt.I.get<PocketBase>();
  RxString googleId = "".obs;
  @override
  void onInit() {
    httpClient.baseUrl = ApiPaths.BASE_URL;
    httpClient.userAgent = ApiPaths.CUST_USER_AGENT;
  }

  Future<void> googleOAuth2() async {
    final client = GetIt.I.get<PocketBase>();
    final authMethods = await client.collection(collectName).listAuthMethods();
    final google = authMethods.authProviders
        .where((am) => am.name.toLowerCase() == googleOAuthName)
        .first;
    final responseUrl = await FlutterWebAuth2.authenticate(
        url: "${google.authUrl}${ApiPaths.GOOGLE_REDIRECT_URI}",
        callbackUrlScheme: ApiPaths.GOOGLE_CALLBACK_SCHEMA);

    final parsedUri = Uri.parse(responseUrl);
    final code = parsedUri.queryParameters['code']!;
    //final state = parsedUri.queryParameters['state']!;
    //if (google.state != state) {
    //  throw "oops";
    //}

    var result = await client.collection(collectName).authWithOAuth2Code(
        googleOAuthName,
        code,
        google.codeVerifier,
        ApiPaths.GOOGLE_REDIRECT_URI);

    googleId.value = result.token;
  }
}