import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart';

class FirestoreHelper {
  FirestoreHelper._();
  static FirestoreHelper firestoreHelper = FirestoreHelper._();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  static const String userCollectionName = 'users';
  static const String userNameKey = 'name';
  static const String userCodeKey = 'code';
  static const String userImageUrlKey = 'imageUrl';
  static const String userType = 'type';

  addUserToFirestore(Map<String, dynamic> userMap) async {
    try {
      await firebaseFirestore
          .collection(userCollectionName)
          .doc(userMap[userCodeKey])
          .set(userMap);
    } on Exception catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }

  getUserByCode(String code) async {
    return await firebaseFirestore
        .collection(userCollectionName)
        .where(userCodeKey, isEqualTo: code)
        .get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getAllUsers() async {
    return await firebaseFirestore.collection(userCollectionName).get();
  }

  updateChildInfo(ChildModel childModel) async {
    await firebaseFirestore
        .collection(userCollectionName)
        .doc(childModel.code)
        .update(childModel.toMap());
  }
}
