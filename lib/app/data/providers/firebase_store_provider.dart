import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FirebaseStoreProvider extends GetConnect {
  late final FirebaseFirestore firestore;

  @override
  void onInit() {
    firestore = FirebaseFirestore.instance;
    super.onInit();
  }

  get db => firestore;
  get members => firestore.collection("members");
}
