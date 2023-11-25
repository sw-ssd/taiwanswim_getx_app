import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:taiwanswim_getx_app/app/data/constants/app_constants.dart';

const String pbStoreName = 'pb_auth';

class PrefData extends GetxService {
  late String isIntro = "${AppConstants.PREFS_NAME}isIntro";
  late String isLogin = "${AppConstants.PREFS_NAME}isLigin";
  late String isVarification = '${AppConstants.PREFS_NAME}isVarification';
  late String isFirstLogin = '${AppConstants.PREFS_NAME}isFirstLogin';

  Future<SharedPreferences> prefsInstance() async {
    return await SharedPreferences.getInstance();
  }

  setIntro(bool intro) async {
    final prefs = await prefsInstance();
    prefs.setBool(isIntro, intro);
  }

  getIntro() async {
    final prefs = await prefsInstance();
    bool intro = prefs.getBool(isIntro) ?? false;
    return intro;
  }

  ///////////////////Ligin Screen////////////////////
  setLogin(bool login) async {
    final prefs = await prefsInstance();
    prefs.setBool(isLogin, login);
  }

  getLogin() async {
    final prefs = await prefsInstance();
    bool login = prefs.getBool(isLogin) ?? false;
    return login;
  }

  setLoginCredential(UserCredential user) async {
    final prefs = await prefsInstance();

    prefs.setString('clientId', user.user!.uid);
    prefs.setString('email', user.user!.email!);
    prefs.setString('profile', user.user!.photoURL!);
  }

  getLoginCredential() async {
    final prefs = await prefsInstance();
    String email = prefs.getString('email') ?? '';
    String password = prefs.getString('password') ?? '';
    return [email, password];
  }

  /////////////////////varification/////////
  // static setVarification(bool varification) async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   sharedPreferences.setBool(isVarification, varification);
  // }
  //
  // static getVarification() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   bool Varification = sharedPreferences.getBool(isVarification) ?? false;
  //   return Varification;
  // }
  // /////////////////////////firstLogin//////////
  // static setFirstLogin(bool firstlogin) async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   sharedPreferences.setBool(isFirstLogin, firstlogin);
  // }
  //
  // static getFirstLogin() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   bool FirstLogin = sharedPreferences.getBool(isFirstLogin) ?? false;
  //   return FirstLogin;
  // }
}
