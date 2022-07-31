// import 'dart:typed_data';

// import 'package:audioplayers/audioplayers.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:yalla_njoom/models/user_model.dart';

// import '../helpers/firestore_helper.dart';
// import '../models/language.dart';

// class FirestoreProvider extends ChangeNotifier {
//   List<dynamic> codes = [];
//   late UserModel userModel;
//   List<dynamic> parentsChildren = [];
//   List<dynamic> searchResutl = [];
//   bool isSoundPlaying = false;
//   bool isSongPlaying = false;
//   AudioPlayer audioPlayer = AudioPlayer();
//   Uint8List? audiobytes;
//   late Language selectedLanguage;
//   initUsersCodes() async {
//     QuerySnapshot<Map<String, dynamic>> allUsersQuerySnapshot =
//         await FirestoreHelper.firestoreHelper.getAllUsers();
//     codes = allUsersQuerySnapshot.docs
//         .map((e) => e.data()[FirestoreHelper.userCodeKey])
//         .toList();
//     notifyListeners();
//   }

//   addUser(userMap) async {
//     await FirestoreHelper.firestoreHelper.addUserToFirestore(userMap);
//     initUsersCodes();
//     initUser(userMap);
//   }

//   initUser(Map userMap) {
//     userModel = userMap[FirestoreHelper.isParentKey] == false
//         ? ChildModel.fromMap(userMap)
//         : ParentModel.fromMap(userMap);
//     notifyListeners();
//   }

//   updateChildInfo(ChildModel childModel) async {
//     await FirestoreHelper.firestoreHelper.updateChildInfo(childModel);
//     initUser(childModel.toMap());
//   }

//   addChildToParent(String parentCode, Map<String, dynamic> childInfo) async {
//     getParentsChildren(parentCode);
//     if (parentsChildren.isNotEmpty) {
//       for (ChildModel i in parentsChildren) {
//         if (i.code == childInfo[FirestoreHelper.userCodeKey]) {
//           return;
//         } else {
//           await FirestoreHelper.firestoreHelper
//               .addChildToParent(parentCode, childInfo);
//           notifyListeners();
//         }
//       }
//     } else {
//       await FirestoreHelper.firestoreHelper
//           .addChildToParent(parentCode, childInfo);
//       notifyListeners();
//     }
//     getParentsChildren(parentCode);
//   }

//   getNamesDetailList(query, parentCode) async {
//     QuerySnapshot<Map<String, dynamic>> searchDocumentsSnapshot =
//         await FirestoreHelper.firestoreHelper
//             .getNamesDetailList(query, parentCode);
//     searchResutl = searchDocumentsSnapshot.docs
//         .map((e) => ChildModel.fromMap(e.data()))
//         .toList();
//     notifyListeners();
//   }

//   getParentsChildren(String code) async {
//     QuerySnapshot<Map<String, dynamic>> parentsChildrenSnapShot =
//         await FirestoreHelper.firestoreHelper.getParentsChildren(code);
//     parentsChildren = parentsChildrenSnapShot.docs
//         .map((e) => ChildModel.fromMap(e.data()))
//         .toList();
//     notifyListeners();
//   }

//   ///////////////////

//   setSelectedLanguage(Language selectedLanguage) {
//     this.selectedLanguage = selectedLanguage;
//     notifyListeners();
//   }

//   setIsSongPlaying(bool isSongPlaying) {
//     this.isSongPlaying = isSongPlaying;
//     notifyListeners();
//   }

//   playAudio({required bool isSound}) async {
//     //await convertSoundToByte();
//     ByteData bytes = await rootBundle.load(isSound
//         ? selectedLanguage.sound!
//         : (selectedLanguage as Letter).song!); //load audio from assets
//     audiobytes =
//         bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
//     if (isSound ? !isSoundPlaying : !isSongPlaying) {
//       await audioPlayer.play(BytesSource(audiobytes!));
//       isSound ? isSoundPlaying = true : isSongPlaying = true;
//     } else {
//       await audioPlayer.stop();
//       isSound ? isSoundPlaying = false : isSongPlaying = false;
//     }
//     notifyListeners();
//   }
// }

import 'dart:math';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:yalla_njoom/models/dummy_data.dart';
import 'package:yalla_njoom/models/example.dart';
import 'package:yalla_njoom/models/solution.dart';
import 'package:yalla_njoom/models/user_model.dart';
import 'package:collection/collection.dart';

import '../helpers/firestore_helper.dart';
import '../helpers/shared_preference_helper.dart';
import '../models/game.dart';
import '../models/language.dart';
import '../models/voice_model.dart';

class FirestoreProvider extends ChangeNotifier {
  List<dynamic> codes = [];
  List<Voice> allVoices = [];
  List<Solution> allSolutions = [];
  UserModel? userModel;
  bool isSoundPlaying = false;
  bool isSongPlaying = false;
  bool isKidRecordVoice = false;
  int numOfExampleSol = 0;
  int numOfStar = 0;
  List<int> allStarNum = [];
  List<dynamic> parentsChildren = [];
  List<dynamic> searchResutl = [];
  //late File imageFile;
  //List<String> listOfStarAndLockedForSelectedLetter = [];
  /// new ////
  List<Example> lettersExample =
      []; //DummyData.dummyData.examples.where((element) => element.isLetterExample).toList();
  List<Example> numbersExample =
      []; //DummyData.dummyData.examples.where((element) => !element.isLetterExample).toList();
  List<Game> games =
      []; //DummyData.dummyData.games; //DummyData.dummyData.games;
  Game? selectedGame;
  List<Game> openGames = [];

  /// ////
  AudioPlayer audioPlayer = AudioPlayer();

  /// /// ///
  List<Letter> letters = [
    Letter(
      name: 'حرف الألف',
      sound: 'assets/audio/music.mp3',
      song: 'assets/audio/music.mp3',
      shape: 'أ',
      id_example: 'أ',
      isLocked: false,
    ),
    Letter(
      name: 'حرف الباء',
      sound: 'assets/audio/music.mp3',
      song: 'assets/audio/music.mp3',
      shape: 'ب',
      id_example: 'ب',
      //imageUrl: 'assets/images/باء.png',
      isLocked: true,
    ),
    Letter(
      name: 'حرف التاء',
      sound: 'assets/audio/music.mp3',
      song: 'assets/audio/music.mp3',
      shape: 'ت',
      id_example: 'ت',
      //imageUrl: 'assets/images/ألف.png',
      isLocked: true,
    ),
  ];
//DummyData.dummyData.letters;//TODO:take this from firebase not from dummy
  List<Number> numbers =
      []; //DummyData.dummyData.numbers;//TODO:take this from firebase not from dummy
  List<Example> examples =
      []; //DummyData.dummyData.examples;//TODO:take this from firebase not from dummy
  List<Example> examplesWithoutSelected = [];
  //List<Example> examplesWithoutSelected= DummyData.dummyData.examples.getRange(0,DummyData.dummyData.examples.length).toList();
  Uint8List? audiobytes;
  late Language selectedLanguage;
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
    addAllLetterToSharedPreference();
    initUser(userMap);
  }

  initUser(Map userMap) {
    userModel = userMap[FirestoreHelper.isParentKey] == false
        ? ChildModel.fromMap(userMap)
        : ParentModel.fromMap(userMap);
    if (userMap[FirestoreHelper.isParentKey] == false) {
      addAllLettersToFirestore();

      /// this for one time
      addAllNumbersToFirestore();

      /// this for one time
      addExamplesToFirestore();

      /// this for one time
      addAllGamesToFirestore();

      /// this for one time
      // getAllStarNumFRomSharedPreference();
      //getAllExamplesFromFirestore();
      getAllOPenGamesForUser();
    }
    //userModel!.isParent!?null:getAllStarNumFRomSharedPreference();
    notifyListeners();
  }

  updateChildInfo(ChildModel childModel) async {
    //childModel.coins = coins;
    await FirestoreHelper.firestoreHelper.updateChildInfo(childModel);
    //print('coins equal ${childModel.coins}');
    initUser(childModel.toMap());
  }

  addVoice(voiceMap) async {
    await FirestoreHelper.firestoreHelper.addVoiceToFirestore(voiceMap);
    await getAllVoicesForUser(voiceMap["code"]);
    //generateNumOfStar(selectedLanguage);

    //TODO: you should refactor this line there repeat
    await getFromSharedPreference(selectedLanguage.name!);
    numOfStar = allVoices
                .firstWhere(
                    (element) => element.langId == selectedLanguage.name)
                .percentageMatch! >=
            0.80
        ? numOfStar + 2
        : numOfStar + 1;
    await setOnSharedPreference(selectedLanguage as Letter, numOfStar);
    notifyListeners();
    print('تم اضافة الصوت بنجاح');
  }

  getAllVoicesForUser(userCode) async {
    allVoices =
        await FirestoreHelper.firestoreHelper.getAllVoicesForUser(userCode);
    notifyListeners();
  }

  updateVoice(
      String voiceId, double percentMatch, double oldPercentMatch) async {
    await FirestoreHelper.firestoreHelper.updateVoice(voiceId, percentMatch);
    await getAllVoicesForUser(userModel!.code);
    await getFromSharedPreference(selectedLanguage.name!);
    oldPercentMatch < 0.80
        ? numOfStar = allVoices
                    .firstWhere(
                        (element) => element.langId == selectedLanguage.name)
                    .percentageMatch! >=
                0.80
            ? numOfStar + 1
            : numOfStar
        : numOfStar;
    await setOnSharedPreference(selectedLanguage as Letter, numOfStar);
    notifyListeners();
    print('تم تعديل الصوت');
  }

  addSolution(solutionMap) async {
    await setNumOfExampleSol();
    solutionMap["numOfSolutions"] = numOfExampleSol;
    await FirestoreHelper.firestoreHelper.addSolutionToFirestore(solutionMap);
    await getAllSolutionsForUser(solutionMap["code"]);
    await getFromSharedPreference(selectedLanguage.name!);
    allSolutions
                .firstWhere(
                    (element) => element.exampleId == selectedLanguage.shape)
                .numOfSolutions ==
            3
        ? await setOnSharedPreference(selectedLanguage as Letter, numOfStar + 1)
        : null;
    //int.parse(listOfStarAndLockedForSelectedLetter[1]) + 1
    //setOnSharedPreference(selectedLanguage as Letter,int.parse(listOfStarAndLockedForSelectedLetter[1]) + 1);
    notifyListeners();
    print('تم اضافة الحل بنجاح');
  }

  getAllSolutionsForUser(userCode) async {
    allSolutions =
        await FirestoreHelper.firestoreHelper.getAllSolutionsForUser(userCode);
    notifyListeners();
  }

  updateSolution(Solution solution) async {
    await setNumOfExampleSol();
    solution.numOfSolutions = numOfExampleSol;
    await FirestoreHelper.firestoreHelper.updateSolution(solution);
    await getAllSolutionsForUser(solution.userCode);
    await getFromSharedPreference(selectedLanguage.name!);
    allSolutions
                .firstWhere(
                    (element) => element.exampleId == selectedLanguage.shape)
                .numOfSolutions ==
            3
        ? await setOnSharedPreference(selectedLanguage as Letter, numOfStar + 1)
        : null;
    //?setOnSharedPreference(selectedLanguage as Letter,int.parse(listOfStarAndLockedForSelectedLetter[1]) + 1)+1:null;
    print('تم تعديل عدد الحلول');
    notifyListeners();
  }

  addExamplesToFirestore() async {
    for (var element in DummyData.dummyData.examples) {
      await FirestoreHelper.firestoreHelper
          .addExampleToFirestore(element.toMap());
    }
    notifyListeners();
    getAllExamplesFromFirestore();
  }

  getAllExamplesFromFirestore() async {
    examples = await FirestoreHelper.firestoreHelper.getAllExamplesForUser();
    lettersExample =
        examples.where((element) => element.isLetterExample).toList();
    numbersExample =
        examples.where((element) => !element.isLetterExample).toList();
    notifyListeners();
  }

  addOpenGameToFirestore(openGameMap) async {
    await FirestoreHelper.firestoreHelper.addOpenGameToFirestore(openGameMap);
    getAllOPenGamesForUser();
    notifyListeners();
  }

  getAllOPenGamesForUser() async {
    openGames = await FirestoreHelper.firestoreHelper
        .getAllOPenGamesForUser((userModel as ChildModel).code!)
        .then((value) => value
            .map((e) =>
                games.firstWhere((element) => element.gameId == e.gameId))
            .toList());
    for (var element in games) {
      element.isLocked = !isGameOpen(element);
      notifyListeners();
    }
    notifyListeners();
  }

  addAllGamesToFirestore() async {
    for (var element in DummyData.dummyData.games) {
      await FirestoreHelper.firestoreHelper.addGameToFirestore(element.toMap());
    }
    notifyListeners();
    getAllGamesFromFirestore();
  }

  getAllGamesFromFirestore() async {
    games = await FirestoreHelper.firestoreHelper.getAllGames();
    notifyListeners();
  }

  /*uploadFileFromAssets(String image) async{
    await getImageFileFromAssets(image);
    return await FirestorageHelper.fireStorageHelper.uploadFile(imageFile);
  }
  getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load(path);

    final file = File('${(await getTemporaryDirectory()).path}/$path}');
    await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    imageFile =  file;
    notifyListeners();
  }*/
  //////////////////////////////////////////
  setSelectedLanguage(Language selectedLanguage) {
    this.selectedLanguage = selectedLanguage;
    examplesWithoutSelected = examples.getRange(0, examples.length).toList();
    examplesWithoutSelected
        .removeWhere((element) => element.id == selectedLanguage.id_example);
    print('${examplesWithoutSelected.length} result .....');
    //examplesWithoutSelected= DummyData.dummyData.examples.getRange(0,DummyData.dummyData.examples.length).toList();
    checkIfThereSolutionsToSelectedLang();
    getFromSharedPreference(selectedLanguage.name!);
    notifyListeners();
  }

  setIsSongPlaying(bool isSongPlaying) {
    this.isSongPlaying = isSongPlaying;
    notifyListeners();
  }

  setIsSoundPlaying(bool isSoundPlaying) {
    this.isSoundPlaying = isSoundPlaying;
    notifyListeners();
  }

  setNumOfExampleSol() async {
    numOfExampleSol++;
    notifyListeners();
  }

  playAudio({required bool isSound}) async {
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

  Voice? checkIfThereVoiceToSelectedLang() {
    return allVoices
        .firstWhereOrNull((element) => element.langId == selectedLanguage.name);
  }

  checkIfThereSolutionsToSelectedLang() {
    Solution? solution = allSolutions.firstWhereOrNull(
        (element) => element.exampleId == selectedLanguage.shape);
    solution == null
        ? numOfExampleSol = 0
        : numOfExampleSol = solution.numOfSolutions!;
    notifyListeners();
  }

  addAllLetterToSharedPreference() async {
    for (var element in letters) {
      //SharedPreferenceHelper.sharedHelper.putLetter(element.name!, [element.isLocked.toString(),'0']);
      await SharedPreferenceHelper.sharedHelper.putLetter(element.name!, 0);
    }
    // getAllStarNumFRomSharedPreference();
    notifyListeners();
  }

  getFromSharedPreference(String nameOfLetter) {
    // this variable i think not useful
    numOfStar = SharedPreferenceHelper.sharedHelper.getLetter(nameOfLetter)!;
    notifyListeners();
  }

  // getAllStarNumFRomSharedPreference() async {
  //   //TODO: do same thing(update to coins) with num and vidio
  //   allStarNum = letters
  //       .map((e) => SharedPreferenceHelper.sharedHelper.getLetter(e.name!)!)
  //       .toList();
  //   /*(userModel as ChildModel).coins = (userModel as ChildModel).coins! + allStarNum.reduce((value, element) => value+element);
  //   updateChildInfo(userModel as ChildModel);*/
  //   updateKidCoins(allStarNum.reduce((value, element) => value + element));
  //   //print('coins equal ${(userModel as ChildModel) .coins!}');
  //   notifyListeners();
  // }

  setOnSharedPreference(Letter letter, int stars) async {
    //SharedPreferenceHelper.sharedHelper.putLetter(letter.name!, [letter.isLocked.toString(),stars.toString()]);
    await SharedPreferenceHelper.sharedHelper.putLetter(letter.name!, stars);
    // getAllStarNumFRomSharedPreference();
    getFromSharedPreference(letter.name!);
    notifyListeners();
  }

  setGameSelected(Game selectedGame) {
    this.selectedGame = selectedGame;
    notifyListeners();
  }

  addAllLettersToFirestore() async {
    for (var element in DummyData.dummyData.letters) {
      await FirestoreHelper.firestoreHelper
          .addLettersToFirestore(element.toMap());
    }
    notifyListeners();
    // getAllLettersFromFirestore();
  }

  // getAllLettersFromFirestore() async {
  //   letters = await FirestoreHelper.firestoreHelper.getAllLetters();
  //   notifyListeners();
  // }

  addAllNumbersToFirestore() async {
    for (var element in DummyData.dummyData.numbers) {
      await FirestoreHelper.firestoreHelper
          .addNumbersToFirestore(element.toMap());
    }
    notifyListeners();
    // getAllNumbersFromFirestore();
  }

  // getAllNumbersFromFirestore() async {
  //   numbers = await FirestoreHelper.firestoreHelper.getAllNumbers();
  //   notifyListeners();
  // }

  checkGame(Function function) {
    if (!isGameOpen(selectedGame!)) {
      //selectedGame!.isLocked
      print('lllllllllllllllll ${(userModel! as ChildModel).coins!}');
      if ((userModel as ChildModel).coins! >= selectedGame!.coinsNeeded!) {
        (userModel as ChildModel).coins =
            (userModel as ChildModel).coins! - selectedGame!.coinsNeeded!;
        notifyListeners();
        updateChildInfo(userModel as ChildModel); // edit also on firebase coins
        //selectedGame!.coinsNeeded = 0; // the value of this game owen this user
        //selectedGame!.isLocked = false; // the value of this game owen this user
        addOpenGameToFirestore(OpenGame(
                gameId: selectedGame!.gameId,
                code: (userModel as ChildModel).code)
            .toMap());
        StoreRedirect.redirect(androidAppId: selectedGame!.gameId);
      } else {
        function();
      }
      notifyListeners();
    } else {
      StoreRedirect.redirect(androidAppId: selectedGame!.gameId);
    }
  }

  updateKidCoins(int coins) {
    (userModel as ChildModel).coins = (userModel as ChildModel).coins! + coins;
    updateChildInfo(userModel as ChildModel);
    notifyListeners();
  }

  bool isGameOpen(Game game) {
    return openGames.contains(game);
  }

  /*generateNumOfStar(Language language){
    if(allVoices.any((element) => element.langId==language.name)){
      numOfStar = allVoices.firstWhere((element) => element.langId==language.name).percentageMatch!>=0.80?numOfStar+2:numOfStar+1;
      notifyListeners();
    }
    else if(allSolutions.any((element) => element.exampleId==language.shape)){
      allSolutions.firstWhere((element) => element.exampleId==language.shape).numOfSolutions ==3?numOfStar++:null;
      notifyListeners();
    }
    print('numOfStar = $numOfStar' );
   // return numOfStar;
  }*/

  getParentsChildren(String code) async {
    QuerySnapshot<Map<String, dynamic>> parentsChildrenSnapShot =
        await FirestoreHelper.firestoreHelper.getParentsChildren(code);
    parentsChildren = parentsChildrenSnapShot.docs
        .map((e) => ChildModel.fromMap(e.data()))
        .toList();
    notifyListeners();
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
}
