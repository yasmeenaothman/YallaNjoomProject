// import '../helpers/firestore_helper.dart';

// abstract class UserModel {
//   String? code;
//   late bool isParent;
//   toMap();
// }

// class ChildModel extends UserModel {
//   String? name;
//   String? imageUrl;
//   ChildModel({required this.name, required this.imageUrl, required code}) {
//     super.code = code;
//     super.isParent = false;
//   }
//   ChildModel.fromMap(Map map) {
//     code = map[FirestoreHelper.userCodeKey];
//     name = map[FirestoreHelper.userNameKey];
//     imageUrl = map[FirestoreHelper.userImageUrlKey];
//     isParent = false;
//   }
//   @override
//   toMap() {
//     return {
//       FirestoreHelper.userCodeKey: code,
//       FirestoreHelper.userNameKey: name,
//       FirestoreHelper.userImageUrlKey: imageUrl,
//       FirestoreHelper.isParentKey: false
//     };
//   }
// }

// class ParentModel extends UserModel {
//   ParentModel({
//     required code,
//   }) {
//     super.code = code;
//     super.isParent = true;
//   }
//   @override
//   toMap() {
//     return {
//       FirestoreHelper.userCodeKey: code,
//       FirestoreHelper.isParentKey: true,
//     };
//   }

//   ParentModel.fromMap(Map map) {
//     code = map[FirestoreHelper.userCodeKey];
//     isParent = true;
//   }
// }
import '../helpers/firestore_helper.dart';

abstract class UserModel {
  String? code;
  late bool isParent;
  toMap();
}

class ChildModel extends UserModel {
  String? name;
  String? imageUrl;
  int? coins;
  ChildModel(
      {required this.name,
      required this.imageUrl,
      required code,
      this.coins = 0}) {
    super.code = code;
    super.isParent = false;
  }
  ChildModel.fromMap(Map map) {
    code = map[FirestoreHelper.userCodeKey];
    name = map[FirestoreHelper.userNameKey];
    imageUrl = map[FirestoreHelper.userImageUrlKey];
    coins = map[FirestoreHelper.coins];
    isParent = false;
  }

  @override
  toMap() {
    return {
      FirestoreHelper.userCodeKey: code,
      FirestoreHelper.userNameKey: name,
      FirestoreHelper.coins: coins,
      FirestoreHelper.userImageUrlKey: imageUrl,
      FirestoreHelper.isParentKey: false
    };
  }
}

class ParentModel extends UserModel {
  ParentModel({
    required code,
  }) {
    super.code = code;
    super.isParent = true;
  }
  @override
  toMap() {
    return {
      FirestoreHelper.userCodeKey: code,
      FirestoreHelper.isParentKey: true,
    };
  }

  ParentModel.fromMap(Map map) {
    code = map[FirestoreHelper.userCodeKey];
    isParent = true;
  }

//   }
}
