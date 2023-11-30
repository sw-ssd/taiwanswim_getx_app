import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:taiwanswim_getx_app/app/data/constants/app_constants.dart';
import 'package:taiwanswim_getx_app/app/data/models/member_model.dart';

const String pbStoreName = 'pb_auth';

class PrefData extends GetxService {
  late String isIntroName = "${AppConstants.PREFS_NAME}isIntro";
  late String isLoginName = "${AppConstants.PREFS_NAME}isLigin";
  late String isVarificationName = '${AppConstants.PREFS_NAME}isVarification';
  late String isFirstLoginName = '${AppConstants.PREFS_NAME}isFirstLogin';

  Future<SharedPreferences> prefsInstance() async {
    return await SharedPreferences.getInstance();
  }

  setIntro(bool intro) async {
    final prefs = await prefsInstance();
    prefs.setBool(isIntroName, intro);
  }

  getIntro() async {
    final prefs = await prefsInstance();
    bool intro = prefs.getBool(isIntroName) ?? false;
    return intro;
  }

  ///////////////////Ligin Screen////////////////////
  setLogin(bool login) async {
    final prefs = await prefsInstance();
    prefs.setBool(isLoginName, login);
  }

  getLogin() async {
    final prefs = await prefsInstance();
    bool login = prefs.getBool(isLoginName) ?? false;
    return login;
  }

  setAuthKey(String data) async {
    final prefs = await prefsInstance();
    prefs.setString("uid", data);
  }

  getAuthKey() async {
    final prefs = await prefsInstance();
    return prefs.getString("uid");
  }

  setAuthMember(String key, String data) async {
    final prefs = await prefsInstance();
    prefs.setString(key, data);
  }

  getAuthMember(String uid) async {
    final prefs = await prefsInstance();
    return prefs.getString(uid);
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
