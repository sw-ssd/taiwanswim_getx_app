import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:taiwanswim_getx_app/app/data/services/shared_pref_service.dart';
import 'package:taiwanswim_getx_app/utils/tools.dart';

/// The scopes required by this application.
const List<String> scopes = <String>[
  'clientId',
  'profile',
  'email',
  'https://www.googleapis.com/auth/contacts.readonly',
];

GoogleSignIn _googleSignIn = GoogleSignIn(
  // Optional clientId
  // clientId: 'your-client_id.apps.googleusercontent.com',
  scopes: scopes,
);

class SigninProvider extends GetConnect {
  final Rx<GoogleSignInAccount?> _currentUser = Rx<GoogleSignInAccount?>(null);
  final RxBool _isAuthorized = false.obs;
  final RxString _contactText = ''.obs;

  get currentUser => _currentUser.value;
  get isAuthorized => _isAuthorized.value;
  get contactText => _contactText.value;

  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = getEnvBaseUrl();

    _googleSignIn.onCurrentUserChanged
        .listen((GoogleSignInAccount? account) async {
      // In mobile, being authenticated means being authorized...
      bool isAuthorized = account != null;
      // However, in the web...
      if (GetPlatform.isWeb && account != null) {
        isAuthorized = await _googleSignIn.canAccessScopes(scopes);
      }

      _currentUser.value = account;
      _isAuthorized.value = isAuthorized;

      // Now that we know that the user can access the required scopes, the app
      // can call the REST API.
      if (isAuthorized) {
        unawaited(_handleGetContact(account!));
      }
    });
    // In the web, _googleSignIn.signInSilently() triggers the One Tap UX.
    //
    // It is recommended by Google Identity Services to render both the One Tap UX
    // and the Google Sign In button together to "reduce friction and improve
    // sign-in rates" ([docs](https://developers.google.com/identity/gsi/web/guides/display-button#html)).
    _googleSignIn.signInSilently();
  }

  // Calls the People API REST endpoint for the signed-in user to retrieve information.
  Future<void> _handleGetContact(GoogleSignInAccount user) async {
    _contactText.value = 'Loading contact info...';

    final response = await get(
      'https://people.googleapis.com/v1/people/me/connections'
      '?requestMask.includeField=person.names',
      headers: await user.authHeaders,
    );
    if (response.statusCode != 200) {
      _contactText.value = 'People API gave a ${response.statusCode} '
          'response. Check logs for details.';
      print('People API ${response.statusCode} response: ${response.body}');
      return;
    }
    final Map<String, dynamic> data =
        json.decode(response.body) as Map<String, dynamic>;

    final String? namedContact = _pickFirstNamedContact(data);

    if (namedContact != null) {
      _contactText.value = 'I see you know $namedContact!';
    } else {
      _contactText.value = 'No contacts to display.';
    }
  }

  String? _pickFirstNamedContact(Map<String, dynamic> data) {
    final List<dynamic>? connections = data['connections'] as List<dynamic>?;
    final Map<String, dynamic>? contact = connections?.firstWhere(
      (dynamic contact) => (contact as Map<Object?, dynamic>)['names'] != null,
      orElse: () => null,
    ) as Map<String, dynamic>?;
    if (contact != null) {
      final List<dynamic> names = contact['names'] as List<dynamic>;
      final Map<String, dynamic>? name = names.firstWhere(
        (dynamic name) =>
            (name as Map<Object?, dynamic>)['displayName'] != null,
        orElse: () => null,
      ) as Map<String, dynamic>?;
      if (name != null) {
        return name['displayName'] as String?;
      }
    }
    return null;
  }

  // Prompts the user to authorize `scopes`.
  //
  // This action is **required** in platforms that don't perform Authentication
  // and Authorization at the same time (like the web).
  //
  // On the web, this must be called from an user interaction (button click).
  Future<void> _handleAuthorizeScopes() async {
    final bool isAuthorized = await _googleSignIn.requestScopes(scopes);
    _isAuthorized.value = isAuthorized;

    if (isAuthorized) {
      unawaited(_handleGetContact(_currentUser.value!));
    }
  }

  Future<void> signOutByGoogle() => _googleSignIn.disconnect();

  Future<void> signInByGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    Get.find<PrefData>().setLoginCredential(userCredential);
  }
}
