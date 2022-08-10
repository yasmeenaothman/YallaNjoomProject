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
//         ? selectedLanguagesound!
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

import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:yalla_njoom/models/dummy_data.dart';
import 'package:yalla_njoom/models/example.dart';
import 'package:yalla_njoom/models/solution.dart';
import 'package:yalla_njoom/models/user_model.dart';
import 'package:collection/collection.dart';

import '../helpers/firestore_helper.dart';
import '../models/game.dart';
import '../models/language.dart';
import '../models/voice_model.dart';
import '../routers/app_router.dart';
import '../screens/bravo_screen.dart';
import '../screens/display_number_screen.dart';
import '../screens/example_numbers_bg.dart';
import '../screens/examples_screen.dart';
import '../screens/letter_card_screen.dart';
import '../widgets/toast_dialog_widget.dart';

class FirestoreProvider extends ChangeNotifier {
  List<dynamic> codes = [];
  List<Voice> allVoices = [];
  List<Solution> allSolutions = [];
  UserModel? userModel;
  bool isSoundPlaying = false;
  bool isSongPlaying = false;
  bool isKidRecordVoice = false;
  // int numOfExampleSol = 0;
  // int numOfStar = 0;
  //late File imageFile;
  //List<String> listOfStarAndLockedForSelectedLetter = [];
  /// new ////
  List<Example> lettersExample = DummyData.dummyData.examples
      .where((element) => element.isLetterExample)
      .toList(); //[]
  List<Example> numbersExample = DummyData.dummyData.examples
      .where((element) => !element.isLetterExample)
      .toList(); //[]
  List<Game> games = DummyData.dummyData.games; //DummyData.dummyData.games;
  Game? selectedGame;
  List<Game> openGames = [];

  AudioPlayer audioPlayer = AudioPlayer();

  /// /// ///
  List<Letter> letters = DummyData
      .dummyData.letters; //TODO:take this from firebase not from dummy// [];
  List<Number> numbers = DummyData
      .dummyData.numbers; //TODO:take this from firebase not from dummy //[];
  List<Example> examples = DummyData
      .dummyData.examples; //TODO:take this from firebase not from dummy //[];
  List<Example> examplesWithoutSelected = [];
  List<Example> letterExamplesWithoutSelected = [];
  List<Example> numberExamplesWithoutSelected = [];
  //List<Example> examplesWithoutSelected= DummyData.dummyData.examples.getRange(0,DummyData.dummyData.examples.length).toList();
  Uint8List? audiobytes;
  late Language selectedLanguage;
  bool isPause = false;
  List<dynamic> parentsChildren = [];
  List<dynamic> searchResult = [];
  ChildModel? childPressed;
  List<Voice> childPressedLettersVoices = [];
  List<Voice> childPressedNumbersVoices = [];
  ChildModel? parentUser;
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
    // addAllNumbersToFirestore();
    // addAllLettersToFirestore();

    print('adduser$userMap');
    initUser(userMap);
    if (!userMap[FirestoreHelper.isParentKey]) {
      addSolution();
    }
    getAllSolutionsForUser();
  }

  initUser(Map userMap) {
    userModel = userMap[FirestoreHelper.isParentKey] == false
        ? ChildModel.fromMap(userMap)
        : ParentModel.fromMap(userMap);
    print('inituser$userMap');
    if (userMap[FirestoreHelper.isParentKey] == false) {
      // addAllLettersToFirestore();
      // addAllNumbersToFirestore();
      getAllLettersFromFirestore();
      getAllNumbersFromFirestore();
      getAllVoicesForUser();
      getAllSolutionsForUser();
      getAllExamplesFromFirestore();
      getAllOPenGamesForUser();
    }
    notifyListeners();
  }

  updateChildInfo(ChildModel childModel) async {
    //childModel.coins = coins;
    await FirestoreHelper.firestoreHelper.updateChildInfo(childModel);
    //print('coins equal ${childModel.coins}');
    initUser(childModel.toMap());
  }

  updateNumOfStars(int stars, String exampleId) async {
    await FirestoreHelper.firestoreHelper
        .updateNumOfStars(stars, exampleId, userModel!.code!);
    getAllSolutionsForUser();
    notifyListeners();
  }

  Future<int> getNumOfStars(String exampleId) async {
    int num = await FirestoreHelper.firestoreHelper
        .getNumOfStars(exampleId, userModel!.code!);
    notifyListeners();
    return num;
  }

  addVoice(voiceMap) async {
    int stars = await getNumOfStars(selectedLanguage.exampleId);
    await FirestoreHelper.firestoreHelper
        .addVoiceToFirestore(voiceMap, userModel!.code!);
    await getAllVoicesForUser();
    if (allVoices
            .firstWhere((element) => element.langId == selectedLanguage.name)
            .percentageMatch! >=
        0.80) {
      updateNumOfStars(stars + 2, selectedLanguage.exampleId);
      updateKidCoins(2);
    } else {
      updateNumOfStars(stars + 1, selectedLanguage.exampleId);
      updateKidCoins(1);
    }

    notifyListeners();
    print('nummmmmmmmmmmmm${getNumOfStars(selectedLanguage.exampleId)}');
    print('تم اضافة الصوت بنجاح');
  }

  getAllVoicesForUser() async {
    allVoices = await FirestoreHelper.firestoreHelper
        .getAllVoicesForUser(userModel!.code!);
    notifyListeners();
  }

  updateVoice(Voice voice, double oldPercentMatch) async {
    int stars = await getNumOfStars(selectedLanguage.exampleId);
    await FirestoreHelper.firestoreHelper
        .addVoiceToFirestore(voice.toMap(), userModel!.code!);
    await getAllVoicesForUser();
    if (oldPercentMatch < 0.80) {
      if (allVoices
              .firstWhere((element) => element.langId == selectedLanguage.name)
              .percentageMatch! >=
          0.80) {
        stars = stars + 1;
        updateKidCoins(1);
      }
      stars = stars;
    }

    updateNumOfStars(stars, selectedLanguage.exampleId);
    print(
        'nummmmmmmmmmmmm${getNumOfStars(selectedLanguage.exampleId)}'); //selectedlanguage as Letter
    notifyListeners();
    print('تم تعديل الصوت');
  }

  addSolution() async {
    for (var element in letters) {
      await FirestoreHelper.firestoreHelper.addSolutionToFirestore(
          Solution(exampleId: element.exampleId).toMap(), userModel!.code!);
    }
    for (var element in numbers) {
      await FirestoreHelper.firestoreHelper.addSolutionToFirestore(
          Solution(exampleId: element.exampleId).toMap(), userModel!.code!);
    }

    ///
    await getAllSolutionsForUser();
    notifyListeners();
    print('تم اضافة الحل بنجاح');
  }

  getAllSolutionsForUser() async {
    allSolutions = await FirestoreHelper.firestoreHelper
        .getAllSolutionsForUser(userModel!.code!);

    ///
    notifyListeners();
  }

  updateSolution(Solution solution) async {
    int stars = await getNumOfStars(selectedLanguage.exampleId);
    await FirestoreHelper.firestoreHelper
        .addSolutionToFirestore(solution.toMap(), userModel!.code!);
    await getAllSolutionsForUser();
    allSolutions
                .firstWhere(
                    (element) => element.exampleId == selectedLanguage.shape)
                .numOfSolutions ==
            3
        ? await updateNumOfStars(stars + 1, selectedLanguage.exampleId)
        : null;
    print('تم تعديل عدد الحلول');
    notifyListeners();
  }

  addExamplesToFirestore() async {
    for (var element in DummyData.dummyData.examples) {
      await FirestoreHelper.firestoreHelper
          .addExampleToFirestore(element.toMap());
    }
    getAllExamplesFromFirestore();
    notifyListeners();
  }

  getAllExamplesFromFirestore() async {
    examples = await FirestoreHelper.firestoreHelper.getAllExamplesForUser();
    lettersExample =
        examples.where((element) => element.isLetterExample).toList();
    numbersExample =
        examples.where((element) => !element.isLetterExample).toList();
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
    }
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
    letterExamplesWithoutSelected =
        lettersExample.getRange(0, lettersExample.length).toList();
    numberExamplesWithoutSelected =
        numbersExample.getRange(0, numbersExample.length).toList();
    letterExamplesWithoutSelected.removeWhere(
        (element) => element.exampleId == selectedLanguage.exampleId);
    numberExamplesWithoutSelected.removeWhere(
        (element) => element.exampleId == selectedLanguage.exampleId);

    print('${examplesWithoutSelected.length} result .....');
    //examplesWithoutSelected= DummyData.dummyData.examples.getRange(0,DummyData.dummyData.examples.length).toList();
    // checkIfThereSolutionsToSelectedLang();

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

  // setNumOfExampleSol() async {
  //   numOfExampleSol++;
  //   notifyListeners();
  // }

  playAudio({required bool isSound, bool isFromMusicSCr = false}) async {
    ByteData bytes = await rootBundle.load(isSound
        ? selectedLanguage.sound!
        : (selectedLanguage as Letter).song!); //load audio from assets
    audiobytes =
        bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
    if (isSound ? !isSoundPlaying : !isSongPlaying) {
      if (isFromMusicSCr) {
        if (isSongPlaying) {
          await audioPlayer.pause();
          isPause = true;
          isSongPlaying = false;
          notifyListeners();
        } else {
          audioPlayer.resume();
          isSongPlaying = true;
          notifyListeners();
        }
      } else {
        await audioPlayer.play(BytesSource(audiobytes!));
        isSound ? isSoundPlaying = true : isSongPlaying = true;
      }
    } else {
      await audioPlayer.stop();
      isSound ? isSoundPlaying = false : isSongPlaying = false;
    }
    notifyListeners();
  }

  playChildrenVoice() {}
  Voice? checkIfThereVoiceToSelectedLang() {
    return allVoices
        .firstWhereOrNull((element) => element.langId == selectedLanguage.name);
  }

  // checkIfThereSolutionsToSelectedLang() {
  //   Solution? solution = allSolutions.firstWhereOrNull(
  //       (element) => element.exampleId == selectedLanguageshape);
  //   solution == null
  //       ? numOfExampleSol = 0
  //       : numOfExampleSol = solution.numOfSolutions!;
  //   notifyListeners();
  // }

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
    getAllLettersFromFirestore();
  }

  getAllLettersFromFirestore() async {
    letters = await FirestoreHelper.firestoreHelper.getAllLetters();
  }

  addAllNumbersToFirestore() async {
    for (var element in DummyData.dummyData.numbers) {
      await FirestoreHelper.firestoreHelper
          .addNumbersToFirestore(element.toMap());
    }
    notifyListeners();
    getAllNumbersFromFirestore();
  }

  getAllNumbersFromFirestore() async {
    numbers = await FirestoreHelper.firestoreHelper.getAllNumbers();
    numbers.sort((a, b) => int.parse(a.shape!).compareTo(int.parse(b.shape!)));
    notifyListeners();
  }

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
    } else {
      StoreRedirect.redirect(androidAppId: selectedGame!.gameId);
    }
    notifyListeners();
  }

  updateKidCoins(int coins) {
    (userModel as ChildModel).coins = (userModel as ChildModel).coins! + coins;
    updateChildInfo(userModel as ChildModel);
  }

  bool isGameOpen(Game game) {
    return openGames.contains(game);
  }
  playEncourageAudio(String audio) async {
    ByteData bytes = await rootBundle.load(audio); //load audio from assets
    audiobytes =
        bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
    await audioPlayer.play(BytesSource(audiobytes!));
    /*if(!isEncouragePlaying){
      await audioPlayer.play(BytesSource(audiobytes!));
      isEncouragePlaying = true;
    }
    else {
      await audioPlayer.stop();
      isEncouragePlaying= false;
    }
    notifyListeners();*/
  }
  check(int index, context, List images) async {
    audioPlayer.stop();
    if (images[0][index] == images[1]) {
      await updateSolution(Solution(
        exampleId: selectedLanguage.exampleId,
        numOfSolutions: allSolutions
                .firstWhere((element) =>
                    element.exampleId == selectedLanguage.exampleId)
                .numOfSolutions! +
            1,
        numOfStars: allSolutions
            .firstWhere(
                (element) => element.exampleId == selectedLanguage.exampleId)
            .numOfStars,
      ));
      if (allSolutions
              .firstWhere(
                  (element) => element.exampleId == selectedLanguage.exampleId)
              .numOfSolutions ==
          3) {
        AppRouter.router
            .pushNamedWithReplacementFunction(BravoScreen.routeName, [
          true,
          true,
          () {},
          () {
            AppRouter.router.pop();
          }
        ]);
        updateKidCoins(1);
      } else {
        AppRouter.router
            .pushNamedWithReplacementFunction(BravoScreen.routeName, [
          false,
          false,
          () {
            AppRouter.router.pushNamedWithReplacementFunction(
                selectedLanguage is Letter
                    ? ExamplesScreen.routeName
                    : ExampleNumbers.routeName);
          },
          () {
            AppRouter.router.pop();
          },
        ]);
      }
    } else {
      showDialog(
          context: context,
          barrierDismissible: false,
          barrierColor: Colors.black,
          builder: (ctx) {
            playEncourageAudio('assets/audio/حاول مرة أخرى .mp3');
            return Column(
              children: [
                SizedBox(
                  height: 260.h,
                ),
                const ToastDialogWidget()
              ],
            );
          });
    }
  }
  // getParentsChildren(String code) async {
  //   QuerySnapshot<Map<String, dynamic>> parentsChildrenSnapShot =
  //       await FirestoreHelper.firestoreHelper.getParentsChildren(code);
  //   parentsChildren = parentsChildrenSnapShot.docs
  //       .map((e) => ChildModel.fromMap(e.data()))
  //       .toList();
  //   notifyListeners();
  // }

  getParentsChildren(String code) async {
    QuerySnapshot<Map<String, dynamic>> parentsChildrenSnapShot =
        await FirestoreHelper.firestoreHelper.getParentsChildren(code);
    List parentChildModels =
        parentsChildrenSnapShot.docs.map((e) => e.data()).toList();
    parentsChildren = await Future.wait(parentChildModels.map((e) async {
      var querySnapshot = await FirestoreHelper.firestoreHelper
          .getUserByCode(e[FirestoreHelper.userCodeKey]);
      Map map = querySnapshot.docs[0].data();
      return ChildModel.fromMap({
        ...map,
        FirestoreHelper.userNameKey: e[FirestoreHelper.userNameKey]
      });
    }));

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
    List searchResultChildModel =
        searchDocumentsSnapshot.docs.map((e) => e.data()).toList();
    // searchResult = searchDocumentsSnapshot.docs
    //     .map((e) => ChildModel.fromMap(e.data()))
    //     .toList();
    // notifyListeners();
    searchResult = await Future.wait(searchResultChildModel.map((e) async {
      var querySnapshot = await FirestoreHelper.firestoreHelper
          .getUserByCode(e[FirestoreHelper.userCodeKey]);
      Map map = querySnapshot.docs[0].data();
      return ChildModel.fromMap({
        ...map,
        FirestoreHelper.userNameKey: e[FirestoreHelper.userNameKey]
      });
    }));
    notifyListeners();
  }

  setChildPressedByParent({required childCode}) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirestoreHelper.firestoreHelper.getUserByCode(childCode);
    childPressed = ChildModel.fromMap(querySnapshot.docs[0].data());
    getChildPressedVoices(childCode: childCode);
  }

  getChildPressedVoices({required childCode}) async {
    List<Voice>? childPressedVoices =
        await FirestoreHelper.firestoreHelper.getAllVoicesForUser(childCode);
    if (childPressedVoices.isNotEmpty) {
      childPressedLettersVoices = [];
      childPressedNumbersVoices = [];
      childPressedVoices
          .map((e) => e.isLetter
              ? childPressedLettersVoices.add(e)
              : childPressedNumbersVoices.add(e))
          .toList();
    }
  }
}
