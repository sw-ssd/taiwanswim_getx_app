import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../models/member_model.dart';

const String _collection = 'members';

class MemeberProvider extends GetConnect {
  final docRef =
      FirebaseFirestore.instance.collection(_collection).withConverter(
            fromFirestore: MemberModel.fromFirestore,
            toFirestore: (MemberModel mem, options) => mem.toFirestore(),
          );

  setMember(MemberModel mem, String uid) {
    docRef
        .doc(uid)
        .set(mem)
        .catchError((error) => throw Exception('Failed to add member: $error'));
  }

  Future<MemberModel> getMember(String uid) async {
    final doc = await docRef.doc(uid).get();
    return doc.data()!;
  }
}
// 