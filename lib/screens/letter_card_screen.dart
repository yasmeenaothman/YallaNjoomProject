// import 'dart:io';
// import 'dart:typed_data';

// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_sound/flutter_sound.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:provider/provider.dart';
// import 'package:yalla_njoom/screens/bravo_screen.dart';
// import 'package:yalla_njoom/screens/examples_screen.dart';
// import 'package:yalla_njoom/screens/letters_screen.dart';
// import 'package:yalla_njoom/screens/music_screen.dart';
// import 'package:yalla_njoom/screens/test.dart';
// import 'package:yalla_njoom/widgets/default_circular_avatar.dart';
// import 'package:yalla_njoom/widgets/letter_cart_widget.dart';
// import 'package:yalla_njoom/widgets/scaffold_with_background.dart';

// import '../helpers/my_methods.dart';
// import '../models/my_flutter_app.dart';
// import '../models/voice_model.dart';
// import '../providers/firestore_provider.dart';
// import '../routers/app_router.dart';
// import '../widgets/toast_dialog_widget.dart';

// class LetterCardScreen extends StatefulWidget {
//   const LetterCardScreen({Key? key}) : super(key: key);
//   static const String routeName = 'LetterCardScreen';

//   @override
//   State<LetterCardScreen> createState() => _LetterCardScreenState();
// }

// class _LetterCardScreenState extends State<LetterCardScreen>
//     with TickerProviderStateMixin {
//   late Animation<double> animation;
//   late AnimationController controller;
//   String _directoryPath = '/storage/emulated/0/Download';

//   final recorder = FlutterSoundRecorder();
//   late String fileRecPath = '';
//   bool isRecorderReady = false;
//   late FirestoreProvider provider;
//   Duration recordLength = Duration.zero;
//   @override
//   void initState() {
//     controller =
//         AnimationController(vsync: this, duration: const Duration(seconds: 1));

//     animation = CurvedAnimation(parent: controller, curve: Curves.linear);
//     controller.forward();
//     initRecorder();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     recorder.closeRecorder();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     provider = Provider.of<FirestoreProvider>(context, listen: false);
//     ThemeData theme = Theme.of(context);
//     return Consumer<FirestoreProvider>(
//       builder: (context, consumerProvider, x) => ScaffoldWithBackground(
//         body: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 25.w),
//           child: Column(
//             children: [
//               SizedBox(height: 50.h),
//               FadeTransition(
//                 opacity: Tween<double>(begin: 0, end: 1).animate(animation),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Align(
//                         alignment: Alignment.centerLeft,
//                         child: DefaultCirculeAvatar(
//                           onTap: () async {
//                             await consumerProvider.audioPlayer.stop();
//                             await consumerProvider.setIsSoundPlaying(false);
//                             AppRouter.router.pushNamedWithReplacementFunction(
//                                 LettersScreen.routeName);
//                           },
//                           iconData: MyFlutterApp.cancel,
//                         )),
//                     SizedBox(height: 17.h),
//                     DefaultCirculeAvatar(
//                       onTap: () async {
//                         await consumerProvider.playAudio(isSound: true);
//                       },
//                       iconData: MyFlutterApp.volumeMedium,
//                     ),
//                     SizedBox(height: 10.h),
//                     DefaultCirculeAvatar(
//                       onTap: () async {
//                         AppRouter.router.pushNamedWithReplacementFunction(
//                             MusicScreen.routeName);
//                         await consumerProvider.playAudio(isSound: false);
//                       },
//                       iconData: MyFlutterApp.music,
//                     ),
//                     SizedBox(height: 10.h),
//                     recorder.isRecording
//                         ? GestureDetector(
//                             onTap: checkRecording,
//                             child: Container(
//                               height: 40.h,
//                               width: 80.w,
//                               decoration: BoxDecoration(
//                                 color: const Color(0xFF84FFB5),
//                                 shape: BoxShape.rectangle,
//                                 borderRadius: BorderRadius.circular(33),
//                                 boxShadow: [
//                                   BoxShadow(
//                                       color: const Color(0x4D074785),
//                                       offset: Offset(3.w, 6.h),
//                                       blurRadius: 9.r),
//                                 ],
//                               ),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Icon(
//                                     Icons.stop,
//                                     color: theme.primaryColor,
//                                     size: 18.r,
//                                   ),
//                                   SizedBox(
//                                     width: 5.w,
//                                   ),
//                                   StreamBuilder<RecordingDisposition>(
//                                     stream: recorder.onProgress,
//                                     builder: (context, snapshot) {
//                                       final duration = snapshot.hasData
//                                           ? snapshot.data!.duration
//                                           : Duration.zero;
//                                       recordLength = duration;
//                                       String twoDigits(int n) =>
//                                           n.toString().padLeft(1);
//                                       final twoDigitMinutes = twoDigits(
//                                           duration.inMinutes.remainder(60));
//                                       final twoDigitSeconds = twoDigits(
//                                           duration.inSeconds.remainder(60));
//                                       return Padding(
//                                         padding: EdgeInsets.only(top: 5.h),
//                                         child: Text(
//                                           '$twoDigitMinutes:$twoDigitSeconds',
//                                           style: theme.textTheme.headline1!
//                                               .copyWith(
//                                                   fontWeight: FontWeight.w400),
//                                         ),
//                                       );
//                                     },
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           )
//                         : DefaultCirculeAvatar(
//                             onTap: checkRecording,
//                             iconData: MyFlutterApp.micNone,
//                           ),
//                     SizedBox(height: 10.h),
//                     DefaultCirculeAvatar(
//                       onTap: () {
//                         return provider.allSolutions
//                                     .firstWhere((element) =>
//                                         element.exampleId ==
//                                         provider.selectedLanguage.exampleId)
//                                     .numOfSolutions ==
//                                 3
//                             ? AppRouter.router.pushNamedWithReplacementFunction(
//                                 BravoScreen.routeName, [
//                                 true,
//                                 true,
//                                 () {},
//                                 () {
//                                   AppRouter.router
//                                       .pushNamedWithReplacementFunction(
//                                           LetterCardScreen.routeName);
//                                 }
//                               ])
//                             : AppRouter.router.pushNamedWithReplacementFunction(
//                                 ExamplesScreen.routeName);
//                       },
//                       iconData: MyFlutterApp.arrowRight_2,
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 30.h),
//               SlideTransition(
//                   position:
//                       Tween<Offset>(begin: const Offset(2, 0), end: Offset.zero)
//                           .animate(animation),
//                   child: LetterCardWidget(
//                       letter: provider.selectedLanguage.shape!,
//                       imagePath: provider.examples
//                           .firstWhere((element) =>
//                               provider.selectedLanguage.exampleId ==
//                               element.exampleId)
//                           .img1!))
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // Recording Methods
//   Future record() async {
//     if (!isRecorderReady) return;

//     await recorder.startRecorder(
//       toFile: '${provider.selectedLanguage.name}${provider.userModel!.code}',
//     );
//   }

//   Future stop() async {
//     if (!isRecorderReady) return;
//     final path = await recorder.stopRecorder();

//     final audioFile = File(path!);
//     fileRecPath = audioFile.path;
//     double result =
//         matchTwoAudios(provider.selectedLanguage.sound!, fileRecPath);
//     checkTheMatching(result);
//   }

//   // void _createFile() async {
//   //   var _completeFileName = 'audio.wav';
//   //   File(_directoryPath + '/' + _completeFileName)
//   //       .create(recursive: true)
//   //       .then((File file) async {
//   //     //write to file
//   //     Uint8List bytes = await file.readAsBytes();
//   //     file.writeAsBytes(bytes);
//   //     print(file.path);
//   //   });
//   // }

//   // void _createDirectory() async {
//   //   bool isDirectoryCreated = await Directory(_directoryPath).exists();
//   //   if (!isDirectoryCreated) {
//   //     Directory(_directoryPath).create()
//   //         // The created directory is returned as a Future.
//   //         .then((Directory directory) {
//   //       print(directory.path);
//   //     });
//   //   }
//   // }

//   // void _writeFileToStorage() async {
//   //   _createDirectory();
//   //   _createFile();
//   // }

//   Future initRecorder() async {
//     //final status = await Permission
//     final status = await Permission.microphone.request();
//     if (status != PermissionStatus.granted) {
//       throw 'microphone permission is denied';
//     }
//     await recorder.openRecorder();
//     isRecorderReady = true;
//     recorder.setSubscriptionDuration(const Duration(milliseconds: 500));
//   }

//   checkRecording() async {
//     if (recorder.isRecording) {
//       await stop();
//     } else {
//       await record();
//     }
//     setState(() {});
//   }

//   checkTheMatching(double result) {
//     if (result > 0.60) {
//       try {
//         debugPrint(provider.userModel!.code); // only for testing
//         Voice? voice = provider.checkIfThereVoiceToSelectedLang();
//         //TODO:here i will ask wafaa to test it if i record another voice by percentage more than store
//         voice != null
//             ? voice.percentageMatch! <= result
//                 ? null
//                 : provider.updateVoice(
//                     Voice(
//                         length: recordLength.inSeconds.toString(),
//                         isLetter: true,
//                         langId: provider.selectedLanguage.name,
//                         voicePath: fileRecPath,
//                         percentageMatch: result),
//                     voice.percentageMatch!)
//             : provider.addVoice(Voice(
//                     length: recordLength.inSeconds.toString(),
//                     isLetter: true,
//                     langId: provider.selectedLanguage.name,
//                     voicePath: fileRecPath,
//                     percentageMatch: result)
//                 .toMap());
//         //TODO: sure from this widget by wafaa
//         AppRouter.router
//             .pushNamedWithReplacementFunction(BravoScreen.routeName, [
//           false,
//           true,
//           () {
//             AppRouter.router
//                 .pushNamedWithReplacementFunction(ExamplesScreen.routeName);
//           },
//           () {
//             AppRouter.router
//                 .pushNamedWithReplacementFunction(LetterCardScreen.routeName);
//           }
//         ]);
//         debugPrint('نطقك صحيح');
//       } catch (e) {
//         print(e);
//       }
//     } else {
//       showDialog(
//           context: context,
//           barrierDismissible: false,
//           barrierColor: Colors.black,
//           builder: (ctx) {
//             return Column(
//               children: [
//                 SizedBox(
//                   height: 260.h,
//                 ),
//                 const ToastDialogWidget()
//               ],
//             );
//           });
//       debugPrint('النطق غير صحيح حاول مرة اخرى');
//     }
//   }
// }
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:yalla_njoom/screens/bravo_screen.dart';
import 'package:yalla_njoom/screens/examples_screen.dart';
import 'package:yalla_njoom/screens/letters_screen.dart';
import 'package:yalla_njoom/screens/music_screen.dart';
import 'package:yalla_njoom/screens/parents_home_screen.dart';

import 'package:yalla_njoom/widgets/default_circular_avatar.dart';
import 'package:yalla_njoom/widgets/letter_cart_widget.dart';
import 'package:yalla_njoom/widgets/scaffold_with_background.dart';

import '../helpers/my_methods.dart';
import '../models/my_flutter_app.dart';
import '../models/voice_model.dart';
import '../providers/firestore_provider.dart';
import '../routers/app_router.dart';
import '../widgets/toast_dialog_widget.dart';

class LetterCardScreen extends StatefulWidget {
  const LetterCardScreen({Key? key}) : super(key: key);
  static const String routeName = 'LetterCardScreen';

  @override
  State<LetterCardScreen> createState() => _LetterCardScreenState();
}

class _LetterCardScreenState extends State<LetterCardScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  final recorder = FlutterSoundRecorder();
  late String fileRecPath = '';
  bool isRecorderReady = false;
  late FirestoreProvider provider;
  Duration recordLength = Duration.zero;
  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    animation = CurvedAnimation(parent: controller, curve: Curves.linear);
    controller.forward();
    initRecorder();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    recorder.closeRecorder();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<FirestoreProvider>(context, listen: false);
    ThemeData theme = Theme.of(context);
    return Consumer<FirestoreProvider>(
      builder: (context, consumerProvider, x) => ScaffoldWithBackground(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            children: [
              SizedBox(height: 50.h),
              FadeTransition(
                opacity: Tween<double>(begin: 0, end: 1).animate(animation),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: DefaultCirculeAvatar(
                          onTap: () async {
                            await consumerProvider.audioPlayer.stop();
                            await consumerProvider.setIsSoundPlaying(false);
                            AppRouter.router.pop();
                          },
                        )),
                    SizedBox(height: 17.h),
                    DefaultCirculeAvatar(
                      onTap: () async {
                        await consumerProvider.playAudio(isSound: true);
                      },
                      iconData: MyFlutterApp.volumeMedium,
                    ),
                    SizedBox(height: 10.h),
                    DefaultCirculeAvatar(
                      onTap: () async {
                        AppRouter.router
                            .pushNamedFunction(MusicScreen.routeName);
                        await consumerProvider.playAudio(isSound: false);
                      },
                      iconData: MyFlutterApp.music,
                    ),
                    SizedBox(height: 10.h),
                    recorder.isRecording
                        ? GestureDetector(
                            onTap: checkRecording,
                            child: Container(
                              height: 40.h,
                              width: 80.w,
                              decoration: BoxDecoration(
                                color: const Color(0xFF84FFB5),
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(33),
                                boxShadow: [
                                  BoxShadow(
                                      color: const Color(0x4D074785),
                                      offset: Offset(3.w, 6.h),
                                      blurRadius: 9.r),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.stop,
                                    color: theme.primaryColor,
                                    size: 18.r,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  StreamBuilder<RecordingDisposition>(
                                    stream: recorder.onProgress,
                                    builder: (context, snapshot) {
                                      final duration = snapshot.hasData
                                          ? snapshot.data!.duration
                                          : Duration.zero;
                                      recordLength = duration;
                                      String twoDigits(int n) =>
                                          n.toString().padLeft(1);
                                      final twoDigitMinutes = twoDigits(
                                          duration.inMinutes.remainder(60));
                                      final twoDigitSeconds = twoDigits(
                                          duration.inSeconds.remainder(60));
                                      return Padding(
                                        padding: EdgeInsets.only(top: 5.h),
                                        child: Text(
                                          '$twoDigitMinutes:$twoDigitSeconds',
                                          style: theme.textTheme.headline1!
                                              .copyWith(
                                                  fontWeight: FontWeight.w400),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          )
                        : DefaultCirculeAvatar(
                            onTap: checkRecording,
                            iconData: MyFlutterApp.micNone,
                          ),
                    SizedBox(height: 10.h),
                    DefaultCirculeAvatar(
                      onTap: () {
                        return provider.allSolutions
                                    .firstWhere((element) =>
                                        element.exampleId ==
                                        provider.selectedLanguage.exampleId)
                                    .numOfSolutions ==
                                3
                            ? AppRouter.router.pushNamedWithReplacementFunction(
                                BravoScreen.routeName, [
                                true,
                                true,
                                () {},
                                () {
                                  AppRouter.router.pop();
                                }
                              ])
                            : AppRouter.router
                                .pushNamedFunction(ExamplesScreen.routeName);
                      },
                      iconData: MyFlutterApp.arrowRight_2,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              SlideTransition(
                  position:
                      Tween<Offset>(begin: const Offset(2, 0), end: Offset.zero)
                          .animate(animation),
                  child: LetterCardWidget(
                      letter: provider.selectedLanguage.shape!,
                      imagePath: provider.lettersExample
                          .firstWhere((element) =>
                              provider.selectedLanguage.exampleId ==
                              element.exampleId)
                          .img1!))
            ],
          ),
        ),
      ),
    );
  }

  // Recording Methods
  Future record() async {
    if (!isRecorderReady) return;
    await recorder.startRecorder(
        toFile:
            '${provider.selectedLanguage.name}${provider.userModel!.code}'); //${provider.selectedLanguage.name}
  }

  Future stop() async {
    if (!isRecorderReady) return;

    final path = await recorder.stopRecorder();
    final audioFile = File(path!);
    fileRecPath = audioFile.path;
    debugPrint(
        'Recorder Audio: ${audioFile.path}'); // TODO: this will store in firestore
    debugPrint('تم تسجيل الصوت بنجاح');
    //TODO: here we need to make matching  and show the result of matching to the kid
    double result =
        matchTwoAudios(provider.selectedLanguage.sound!, fileRecPath);
    checkTheMatching(result);
  }

  Future initRecorder() async {
    //final status = await Permission
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw 'microphone permission is denied';
    }
    await recorder.openRecorder();
    isRecorderReady = true;
    recorder.setSubscriptionDuration(const Duration(milliseconds: 500));
  }

  checkRecording() async {
    if (recorder.isRecording) {
      await stop();
    } else {
      await record();
    }
    setState(() {});
  }

  checkTheMatching(double result) {
    if (result > 0.60) {
      try {
        debugPrint(provider.userModel!.code); // only for testing
        Voice? voice = provider.checkIfThereVoiceToSelectedLang();
        //TODO:here i will ask wafaa to test it if i record another voice by percentage more than store
        voice != null
            ? voice.percentageMatch! <= result
                ? null
                : provider.updateVoice(
                    Voice(
                        length: recordLength.inSeconds.toString(),
                        isLetter: true,
                        langId: provider.selectedLanguage.name,
                        voicePath: fileRecPath,
                        percentageMatch: result),
                    voice.percentageMatch!)
            : provider.addVoice(Voice(
                    length: recordLength.inSeconds.toString(),
                    isLetter: true,
                    langId: provider.selectedLanguage.name,
                    voicePath: fileRecPath,
                    percentageMatch: result)
                .toMap());
        //TODO: sure from this widget by wafaa
        AppRouter.router
            .pushNamedWithReplacementFunction(BravoScreen.routeName, [
          false,
          true,
          () {
            AppRouter.router
                .pushNamedWithReplacementFunction(ExamplesScreen.routeName);
          },
          () {
            AppRouter.router.pop();
          }
        ]);
        debugPrint('نطقك صحيح');
      } catch (e) {
        print(e);
      }
    } else {
      showDialog(
          context: context,
          barrierDismissible: false,
          barrierColor: Colors.black,
          builder: (ctx) {
            return Column(
              children: [
                SizedBox(
                  height: 260.h,
                ),
                const ToastDialogWidget()
              ],
            );
          });
      debugPrint('النطق غير صحيح حاول مرة اخرى');
    }
  }
}
