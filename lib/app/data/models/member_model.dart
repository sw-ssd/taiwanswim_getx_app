//  'email': user.email,
//           'displayName': user.displayName,
//           'photoURL': user.photoURL,
//           'lastSignInTime': user.metadata.lastSignInTime,
//           'creationTime': user.metadata.creationTime,

import 'package:cloud_firestore/cloud_firestore.dart';

class MemberModel {
  final String? displayName;
  final String? email;
  final String? photoURL;

  MemberModel({
    this.displayName,
    this.email,
    this.photoURL,
  });

  factory MemberModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return MemberModel(
      displayName: data?['displayName'],
      email: data?['email'],
      photoURL: data?['photoURL'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (displayName != null) "displayName": displayName,
      if (email != null) "email": email,
      if (photoURL != null) "photoURL": photoURL,
    };
  }
}
