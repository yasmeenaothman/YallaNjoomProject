import '../helpers/firestore_helper.dart';

abstract class UserModel {
  String? code;
  static const String parent = 'parent';
  static const String child = 'child';
  toMap();
}

class ChildModel extends UserModel {
  String? name;
  String? imageUrl;

  ChildModel({required this.name, required this.imageUrl, required code}) {
    super.code = code;
  }
  ChildModel.fromMap(Map map) {
    code = map[FirestoreHelper.userCodeKey];
    name = map[FirestoreHelper.userNameKey];
    imageUrl = map[FirestoreHelper.userImageUrlKey];
  }
  @override
  toMap() {
    return {
      FirestoreHelper.userCodeKey: code,
      FirestoreHelper.userNameKey: name,
      FirestoreHelper.userImageUrlKey: imageUrl,
      FirestoreHelper.userType: UserModel.child
    };
  }
}

class ParentModel extends UserModel {
  ParentModel({required code}) {
    super.code = code;
  }
  @override
  toMap() {
    return {
      FirestoreHelper.userCodeKey: code,
      FirestoreHelper.userType: UserModel.parent
    };
  }

  ParentModel.fromMap(Map map) {
    code = map[FirestoreHelper.userCodeKey];
  }
}
