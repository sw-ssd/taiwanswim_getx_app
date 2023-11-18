import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefData extends GetxService {
  final String prefName = "com.sowinsoft.app.learn_manager";

  late String isIntro = "${prefName}isIntro";
  late String isLogin = "${prefName}isLigin";
  late String isVarification = '${prefName}isVarification';
  late String isFirstLogin = '${prefName}isFirstLogin';

  setIntro(bool intro) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(isIntro, intro);
  }

  getIntro() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool intro = sharedPreferences.getBool(isIntro) ?? false;
    return intro;
  }

  ///////////////////Ligin Screen////////////////////
  setLogin(bool login) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(isLogin, login);
  }

  getLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool login = sharedPreferences.getBool(isLogin) ?? false;
    return login;
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
