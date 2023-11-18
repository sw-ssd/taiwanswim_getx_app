// ignore_for_file: avoid_print

/// 在你執行Flutter應用程式之前，讓你的服務初始化是明智之舉。
/// 因為你可以控制執行流程（也許你需要載入一些主題配置，apiKey，由使用者自訂的語言等，所以在執行ApiService之前載入SettingService。
/// 所以GetMaterialApp()不需要重建，可以直接取值。
void initServices() async {
  print('starting services ...');

  /// 這裡是你放get_storage、hive、shared_pref初始化的地方。
  /// 或moor連接，或是其他什麼非同步的東西。

  print('All services started...');
}

// class DbService extends GetxService {
//   Future<DbService> init() async {
//     print('$runtimeType delays 2 sec');
//     await 2.delay();
//     print('$runtimeType ready!');
//     return this;
//   }
// }

// class SettingsService extends GetxService {
//   void init() async {
//     print('$runtimeType delays 1 sec');
//     await 1.delay();
//     print('$runtimeType ready!');
//   }
// }
