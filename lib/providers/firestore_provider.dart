import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yalla_njoom/models/user_model.dart';

import '../helpers/firestore_helper.dart';
import '../models/language.dart';

class FirestoreProvider extends ChangeNotifier {
  List<dynamic> codes = [];
  late UserModel userModel;
  List<dynamic> parentsChildren = [];
  List<dynamic> searchResutl = [];
  bool isSoundPlaying = false;
  bool isSongPlaying = false;
  AudioPlayer audioPlayer = AudioPlayer();
  Uint8List? audiobytes;
  late Language selectedLanguage;
  initUsersCodes() async {
    QuerySnapshot<Map<String, dynamic>> allUsersQuerySnapshot =
        await FirestoreHelper.firestoreHelper.getAllUsers();
    codes = allUsersQuerySnapshot.docs
        .map((e) => e.data()[FirestoreHelper.userCodeKey])
        .toList();
    notifyListeners();
  }

  addUser(userMap) async {
    await FirestoreHelper.firestoreHelper.addUserToFirestore(userMap);
    initUsersCodes();
    initUser(userMap);
  }

  initUser(Map userMap) {
    userModel = userMap[FirestoreHelper.isParentKey] == false
        ? ChildModel.fromMap(userMap)
        : ParentModel.fromMap(userMap);
    notifyListeners();
  }

  updateChildInfo(ChildModel childModel) async {
    await FirestoreHelper.firestoreHelper.updateChildInfo(childModel);
    initUser(childModel.toMap());
  }

  addChildToParent(String parentCode, Map<String, dynamic> childInfo) async {
    getParentsChildren(parentCode);
    if (parentsChildren.isNotEmpty) {
      for (ChildModel i in parentsChildren) {
        if (i.code == childInfo[FirestoreHelper.userCodeKey]) {
          return;
        } else {
          await FirestoreHelper.firestoreHelper
              .addChildToParent(parentCode, childInfo);
          notifyListeners();
        }
      }
    } else {
      await FirestoreHelper.firestoreHelper
          .addChildToParent(parentCode, childInfo);
      notifyListeners();
    }
    getParentsChildren(parentCode);
  }

  getNamesDetailList(query, parentCode) async {
    QuerySnapshot<Map<String, dynamic>> searchDocumentsSnapshot =
        await FirestoreHelper.firestoreHelper
            .getNamesDetailList(query, parentCode);
    searchResutl = searchDocumentsSnapshot.docs
        .map((e) => ChildModel.fromMap(e.data()))
        .toList();
    notifyListeners();
  }

  getParentsChildren(String code) async {
    QuerySnapshot<Map<String, dynamic>> parentsChildrenSnapShot =
        await FirestoreHelper.firestoreHelper.getParentsChildren(code);
    parentsChildren = parentsChildrenSnapShot.docs
        .map((e) => ChildModel.fromMap(e.data()))
        .toList();
    notifyListeners();
  }

  ///////////////////

  setSelectedLanguage(Language selectedLanguage) {
    this.selectedLanguage = selectedLanguage;
    notifyListeners();
  }

  setIsSongPlaying(bool isSongPlaying) {
    this.isSongPlaying = isSongPlaying;
    notifyListeners();
  }

  playAudio({required bool isSound}) async {
    //await convertSoundToByte();
    ByteData bytes = await rootBundle.load(isSound
        ? selectedLanguage.sound!
        : (selectedLanguage as Letter).song!); //load audio from assets
    audiobytes =
        bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
    if (isSound ? !isSoundPlaying : !isSongPlaying) {
      await audioPlayer.play(BytesSource(audiobytes!));
      isSound ? isSoundPlaying = true : isSongPlaying = true;
    } else {
      await audioPlayer.stop();
      isSound ? isSoundPlaying = false : isSongPlaying = false;
    }
    notifyListeners();
  }
}
