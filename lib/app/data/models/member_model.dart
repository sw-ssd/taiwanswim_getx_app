import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class MemberModel {
  String? displayName;
  String? email;
  String? photoURL;

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
    return toMap();
  }

  Map<String, dynamic> toMap() {
    return {
      if (displayName != null) "displayName": displayName,
      if (email != null) "email": email,
      if (photoURL != null) "photoURL": photoURL,
    };
  }

  factory MemberModel.fromMap(Map<String, dynamic> map) {
    return MemberModel(
      displayName: map['displayName'],
      email: map['email'],
      photoURL: map['photoURL'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MemberModel.fromJson(String source) =>
      MemberModel.fromMap(json.decode(source));
}
