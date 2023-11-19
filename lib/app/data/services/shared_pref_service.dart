import 'package:get/get.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:taiwanswim_getx_app/app/data/constants/app_constants.dart';

const String pbStoreName = 'pb_auth';

class PrefData extends GetxService {
  late String isIntro = "${AppConstants.PREFS_NAME}isIntro";
  late String isLogin = "${AppConstants.PREFS_NAME}isLigin";
  late String isVarification = '${AppConstants.PREFS_NAME}isVarification';
  late String isFirstLogin = '${AppConstants.PREFS_NAME}isFirstLogin';

  // late SharedPreferences prefs;

  // @override
  // onInit() async {
  //   super.onInit();
  //   prefs = await prefsInstance();
  // }

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

  Future<AsyncAuthStore> initAuthStore({String storeName = pbStoreName}) async {
    final prefs = await prefsInstance();
    final store = AsyncAuthStore(
      save: (String data) async => prefs.setString(storeName, data),
      initial: prefs.getString(storeName),
    );
    return store;
  }

  setAuthStore({String storeName = pbStoreName, String data = ''}) async {
    final prefs = await prefsInstance();
    return prefs.setString(storeName, data);
  }

  getAuthStore({String storeName = pbStoreName}) async {
    final prefs = await prefsInstance();
    final data = prefs.getString(storeName);
    return data;
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
