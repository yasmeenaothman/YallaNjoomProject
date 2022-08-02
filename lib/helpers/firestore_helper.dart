// import 'package:cloud_firestore/cloud_firestore.dart';

// import '../models/user_model.dart';

// class FirestoreHelper {
//   FirestoreHelper._();
//   static FirestoreHelper firestoreHelper = FirestoreHelper._();
//   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
//   static const String userCollectionName = 'users';
//   static const String userNameKey = 'name';
//   static const String userCodeKey = 'code';
//   static const String userImageUrlKey = 'imageUrl';
//   static const String parentsChildrenCollectionName = 'parentsChildren';
//   static const String isParentKey = 'isParent';
//   static const String nameSearchKey = 'nameSearch';

//   addUserToFirestore(Map<String, dynamic> userMap) async {
//     try {
//       await firebaseFirestore
//           .collection(userCollectionName)
//           .doc(userMap[userCodeKey])
//           .set(userMap);
//     } on Exception catch (e) {
//       // ignore: avoid_print
//       print(e.toString());
//     }
//   }

//   Future<QuerySnapshot<Map<String, dynamic>>> getNamesDetailList(
//       query, parentCode) async {
//     return await firebaseFirestore
//         .collection(userCollectionName)
//         .doc(parentCode)
//         .collection(parentsChildrenCollectionName)
//         .where(nameSearchKey, arrayContains: query)
//         .get();
//   }

//   Future<QuerySnapshot<Map<String, dynamic>>> getUserByCode(String code) async {
//     return await firebaseFirestore
//         .collection(userCollectionName)
//         .where(userCodeKey, isEqualTo: code)
//         .get();
//   }

//   getParentsChildren(String code) async {
//     return await firebaseFirestore
//         .collection(userCollectionName)
//         .doc(code)
//         .collection(parentsChildrenCollectionName)
//         .get();
//   }

//   Future<QuerySnapshot<Map<String, dynamic>>> getAllUsers() async {
//     return await firebaseFirestore.collection(userCollectionName).get();
//   }

//   updateChildInfo(ChildModel childModel) async {
//     await firebaseFirestore
//         .collection(userCollectionName)
//         .doc(childModel.code)
//         .update(childModel.toMap());
//   }

//   addChildToParent(String parentCode, Map<String, dynamic> childInfo) async {
//     await firebaseFirestore
//         .collection(userCollectionName)
//         .doc(parentCode)
//         .collection(parentsChildrenCollectionName)
//         .doc(childInfo[userCodeKey])
//         .set(childInfo);
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yalla_njoom/models/game.dart';

import '../models/example.dart';
import '../models/language.dart';
import '../models/solution.dart';
import '../models/user_model.dart';
import '../models/voice_model.dart';

class FirestoreHelper {
  FirestoreHelper._();
  static FirestoreHelper firestoreHelper = FirestoreHelper._();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  static const String userCollectionName = 'users';
  static const String voiceCollectionName = 'voices';
  static const String exampleCollectionName = 'examples';
  static const String percentageMatch = 'percentageMatch';
  static const String solutionCollectionName = 'solutions';
  static const String openGameCollection = 'openGames';
  static const String gameCollection = 'games';
  static const String letterCollection = 'letters';
  static const String numberCollection = 'numbers';
  static const String languageId = 'name';
  //static const String openGameId = 'id';
  static const String gameId = 'gameId';
  static const String voiceId = 'voiceId';
  static const String solutionId = 'solutionId';
  static const String exampleId = 'id';
  static const String userNameKey = 'name';
  static const String userCodeKey = 'code';
  static const String userImageUrlKey = 'imageUrl';
  static const String coins = 'coins';
  static const String userType = 'type';
  static const String parentsChildrenCollectionName = 'parentsChildren';
  static const String isParentKey = 'isParent';
  static const String nameSearchKey = 'nameSearch';

  addUserToFirestore(Map<String, dynamic> userMap) async {
    try {
      await firebaseFirestore
          .collection(userCollectionName)
          .doc(userMap[userCodeKey])
          .set(userMap);
    } on Exception catch (e) {
      // ignore: avoid_print
      print(e.toString() + 'hi iam exceptiom');
    }
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getNamesDetailList(
      query, parentCode) async {
    return await firebaseFirestore
        .collection(userCollectionName)
        .doc(parentCode)
        .collection(parentsChildrenCollectionName)
        .where(nameSearchKey, arrayContains: query)
        .get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getUserByCode(String code) async {
    return await firebaseFirestore
        .collection(userCollectionName)
        .where(userCodeKey, isEqualTo: code)
        .get();
  }

  getParentsChildren(String code) async {
    return await firebaseFirestore
        .collection(userCollectionName)
        .doc(code)
        .collection(parentsChildrenCollectionName)
        .get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getAllUsers() async {
    return await firebaseFirestore.collection(userCollectionName).get();
  }

  addChildToParent(String parentCode, Map<String, dynamic> childInfo) async {
    await firebaseFirestore
        .collection(userCollectionName)
        .doc(parentCode)
        .collection(parentsChildrenCollectionName)
        .doc(childInfo[userCodeKey])
        .set(childInfo);
  }

  updateChildInfo(ChildModel childModel) async {
    await firebaseFirestore
        .collection(userCollectionName)
        .doc(childModel.code)
        .update(childModel.toMap());
  }

  addVoiceToFirestore(Map<String, dynamic> voiceMap) async {
    await firebaseFirestore
        .collection(voiceCollectionName)
        .doc(voiceMap[voiceId])
        .set(voiceMap);
  }

  updateVoice(String voiceId, double percentMatch) async {
    await firebaseFirestore
        .collection(voiceCollectionName)
        .doc(voiceId)
        .update({percentageMatch: percentMatch});
  }

  Future<List<Voice>> getAllVoicesForUser(String userCode) async {
    QuerySnapshot querySnapshot = await firebaseFirestore
        .collection(voiceCollectionName)
        .where(userCodeKey, isEqualTo: userCode)
        .get();
    return querySnapshot.docs
        .map((e) => Voice.fromMap(e.data() as Map<String, dynamic>))
        .toList();
  }

  addSolutionToFirestore(
      Map<String, dynamic> solutionMap, String userCode) async {
    await firebaseFirestore
        .collection(userCollectionName)
        .doc(userCode)
        .collection(solutionCollectionName)
        .doc(solutionMap["exampleId"])
        .set(solutionMap);
    print('pppppppppppppp');
  }

  Future<List<Solution>> getAllSolutionsForUser(String userCode) async {
    QuerySnapshot querySnapshot = await firebaseFirestore
        .collection(userCollectionName)
        .doc(userCode)
        .collection(solutionCollectionName)
        .get();
    return querySnapshot.docs
        .map((e) => Solution.fromMap(e.data() as Map<String, dynamic>))
        .toList();
  }

  addExampleToFirestore(Map<String, dynamic> exampleMap) async {
    await firebaseFirestore
        .collection(exampleCollectionName)
        .doc(exampleMap[exampleId])
        .set(exampleMap);
  }

  Future<List<Example>> getAllExamplesForUser() async {
    QuerySnapshot querySnapshot =
        await firebaseFirestore.collection(exampleCollectionName).get();
    return querySnapshot.docs
        .map((e) => Example.fromMap(e.data() as Map<String, dynamic>))
        .toList();
  }

  addGameToFirestore(Map<String, dynamic> gameMap) async {
    await firebaseFirestore
        .collection(gameCollection)
        .doc(gameMap[gameId])
        .set(gameMap);
  }

  Future<List<Game>> getAllGames() async {
    QuerySnapshot querySnapshot =
        await firebaseFirestore.collection(gameCollection).get();
    return querySnapshot.docs
        .map((e) => Game.fromMap(e.data() as Map<String, dynamic>))
        .toList();
  }

  addOpenGameToFirestore(Map<String, dynamic> openGameMap) async {
    await firebaseFirestore
        .collection(openGameCollection)
        //.doc(openGameMap[openGameId])
        .add(openGameMap);
  }

  Future<List<OpenGame>> getAllOPenGamesForUser(String userCode) async {
    QuerySnapshot querySnapshot = await firebaseFirestore
        .collection(openGameCollection)
        .where(userCodeKey, isEqualTo: userCode)
        .get();
    return querySnapshot.docs
        .map((e) => OpenGame.fromMap(e.data() as Map<String, dynamic>))
        .toList();
  }

  addLettersToFirestore(letterMap) async {
    await firebaseFirestore
        .collection(letterCollection)
        .doc(letterMap[languageId])
        .set(letterMap as Map<String, dynamic>);
  }

  Future<List<Letter>> getAllLetters() async {
    QuerySnapshot querySnapshot =
        await firebaseFirestore.collection(letterCollection).get();
    return querySnapshot.docs
        .map((e) => Letter.fromMap(e.data() as Map<String, dynamic>))
        .toList();
  }

  addNumbersToFirestore(Map<String, dynamic> numberMap) async {
    await firebaseFirestore
        .collection(numberCollection)
        .doc(numberMap[languageId])
        .set(numberMap);
  }

  Future<List<Number>> getAllNumbers() async {
    QuerySnapshot querySnapshot =
        await firebaseFirestore.collection(numberCollection).get();
    return querySnapshot.docs
        .map((e) => Number.fromMap(e.data() as Map<String, dynamic>))
        .toList();
  }
}
