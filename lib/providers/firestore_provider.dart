import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yalla_njoom/models/user_model.dart';

import '../helpers/firestore_helper.dart';

class FirestoreProvider extends ChangeNotifier {
  List<dynamic> codes = [];
  UserModel? userModel;
  initUsersCodes() async {
    QuerySnapshot<Map<String, dynamic>> allUsersQuerySnapshot =
        await FirestoreHelper.firestoreHelper.getAllUsers();
    codes = allUsersQuerySnapshot.docs
        .map((e) => e.data()[FirestoreHelper.userCodeKey])
        .toList();
    notifyListeners();

    print(codes);
  }

  addUser(userMap) async {
    await FirestoreHelper.firestoreHelper.addUserToFirestore(userMap);
    initUsersCodes();
  }

  initUser(Map userMap) {
    userModel = userMap[FirestoreHelper.userType] == 'child'
        ? ChildModel.fromMap(userMap)
        : ParentModel.fromMap(userMap);
    notifyListeners();
  }

  updateChildInfo(ChildModel childModel) async {
    await FirestoreHelper.firestoreHelper.updateChildInfo(childModel);
    initUser(childModel.toMap());
  }
}
