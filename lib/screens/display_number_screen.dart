// import 'dart:io';

// import 'package:arabic_numbers/arabic_numbers.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_sound/flutter_sound.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:provider/provider.dart';
// import 'package:yalla_njoom/routers/app_router.dart';
// import 'package:yalla_njoom/screens/example_numbers_bg.dart';
// import 'package:yalla_njoom/screens/numbers_screen.dart';

// import '../helpers/my_methods.dart';
// import '../models/my_flutter_app.dart';
// import '../models/voice_model.dart';
// import '../providers/firestore_provider.dart';
// import '../widgets/default_circular_avatar.dart';
// import '../widgets/toast_dialog_widget.dart';
// import 'bravo_screen.dart';

// class DisplayNumberScreen extends StatefulWidget {
//   static String routeName = 'DisplayNumberScreen';
//   DisplayNumberScreen({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<DisplayNumberScreen> createState() => _DisplayNumberScreenState();
// }

// class _DisplayNumberScreenState extends State<DisplayNumberScreen>
//     with TickerProviderStateMixin {
//   late AnimationController imageController;
//   late Animation<double> animation;
//   late FirestoreProvider provider;

//   final recorder = FlutterSoundRecorder();

//   Duration recordLength = Duration.zero;
//   late String fileRecPath = '';

//   bool isRecorderReady = false;
//   @override
//   void initState() {
//     imageController = AnimationController(
//         vsync: this, duration: const Duration(milliseconds: 300));

//     imageController.repeat(reverse: true);
//     initRecorder();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     imageController.dispose();
//     recorder.closeRecorder();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     provider = Provider.of<FirestoreProvider>(context, listen: false);
//     return Consumer<FirestoreProvider>(
//         builder: (context, provider, x) => Scaffold(
//               body: Stack(
//                 children: [
//                   Container(
//                     constraints: const BoxConstraints.expand(),
//                     decoration: const BoxDecoration(
//                         image: DecorationImage(
//                             image: AssetImage('assets/images/bird.png'),
//                             fit: BoxFit.cover)),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.only(top: 77.h, right: 20.w),
//                           child: SizedBox(
//                             width: MediaQuery.of(context).size.width,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: [
//                                 Padding(
//                                   padding: EdgeInsets.only(left: 25.w),
//                                   child: Align(
//                                       alignment: Alignment.centerLeft,
//                                       child: DefaultCirculeAvatar(
//                                         onTap: () async {
//                                           await provider.audioPlayer.stop();
//                                           await provider
//                                               .setIsSoundPlaying(false);
//                                           AppRouter.router
//                                               .pushNamedWithReplacementFunction(
//                                                   NumbersScreen.routeName);
//                                         },
//                                         iconData: MyFlutterApp.cancel,
//                                         iconColor: const Color(0xFF034C1B),
//                                         bgColor: const Color(0xFFDBECC2),
//                                       )),
//                                 ),
//                                 DefaultCirculeAvatar(
//                                   onTap: () async {
//                                     await provider.playAudio(isSound: true);
//                                   },
//                                   iconData: MyFlutterApp.volumeMedium,
//                                   iconColor: const Color(0xFF034C1B),
//                                   bgColor: const Color(0xFFDBECC2),
//                                 ),
//                                 recorder.isRecording
//                                     ? Padding(
//                                         padding: EdgeInsets.only(
//                                             top: 10.h, bottom: 10.h),
//                                         child: GestureDetector(
//                                           onTap: checkRecording,
//                                           child: Container(
//                                             height: 40.h,
//                                             width: 80.w,
//                                             decoration: BoxDecoration(
//                                               color: const Color(0xFF84FFB5),
//                                               shape: BoxShape.rectangle,
//                                               borderRadius:
//                                                   BorderRadius.circular(33),
//                                               boxShadow: [
//                                                 BoxShadow(
//                                                     color:
//                                                         const Color(0x4D074785),
//                                                     offset: Offset(3.w, 6.h),
//                                                     blurRadius: 9.r),
//                                               ],
//                                             ),
//                                             child: Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.center,
//                                               children: [
//                                                 Icon(
//                                                   Icons.stop,
//                                                   color:
//                                                       const Color(0xFF074785),
//                                                   size: 18.r,
//                                                 ),
//                                                 SizedBox(
//                                                   width: 5.w,
//                                                 ),
//                                                 StreamBuilder<
//                                                     RecordingDisposition>(
//                                                   stream: recorder.onProgress,
//                                                   builder: (context, snapshot) {
//                                                     final duration =
//                                                         snapshot.hasData
//                                                             ? snapshot
//                                                                 .data!.duration
//                                                             : Duration.zero;
//                                                     recordLength = duration;
//                                                     String twoDigits(int n) =>
//                                                         n.toString().padLeft(1);
//                                                     final twoDigitMinutes =
//                                                         twoDigits(duration
//                                                             .inMinutes
//                                                             .remainder(60));
//                                                     final twoDigitSeconds =
//                                                         twoDigits(duration
//                                                             .inSeconds
//                                                             .remainder(60));
//                                                     return Padding(
//                                                       padding: EdgeInsets.only(
//                                                           top: 5.h),
//                                                       child: Text(
//                                                         '$twoDigitMinutes:$twoDigitSeconds',
//                                                         style: TextStyle(
//                                                           fontSize: 18.sp,
//                                                           fontFamily: 'Tajawal',
//                                                           fontWeight:
//                                                               FontWeight.w400,
//                                                           color: const Color(
//                                                               0xFF074785),
//                                                         ),
//                                                       ),
//                                                     );
//                                                   },
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       )
//                                     : Padding(
//                                         padding: EdgeInsets.only(
//                                             top: 10.h, bottom: 10.h),
//                                         child: DefaultCirculeAvatar(
//                                           onTap: checkRecording,
//                                           iconData: MyFlutterApp.micNone,
//                                           iconColor: const Color(0xFF034C1B),
//                                           bgColor: const Color(0xFFDBECC2),
//                                         ),
//                                       ),
//                                 DefaultCirculeAvatar(
//                                   onTap: () {
//                                     return provider.allSolutions
//                                                 .firstWhere((element) =>
//                                                     element.exampleId ==
//                                                     provider.selectedLanguage
//                                                         .exampleId)
//                                                 .numOfSolutions ==
//                                             3
//                                         ? AppRouter.router
//                                             .pushNamedWithReplacementFunction(
//                                                 BravoScreen.routeName, [
//                                             true,
//                                             true,
//                                             () {},
//                                             () {
//                                               AppRouter.router
//                                                   .pushNamedWithReplacementFunction(
//                                                       DisplayNumberScreen
//                                                           .routeName);
//                                             }
//                                           ])
//                                         : AppRouter.router
//                                             .pushNamedWithReplacementFunction(
//                                                 ExampleNumbers.routeName);
//                                     /* AppRouter.router
//                                         .pushNamedWithReplacementFunction(
//                                             ExampleNumbers.routeName);*/
//                                   },
//                                   iconData: MyFlutterApp.arrowRight_2,
//                                   iconColor: const Color(0xFF034C1B),
//                                   bgColor: const Color(0xFFDBECC2),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   PositionedTransition(
//                     rect: RelativeRectTween(
//                       begin: RelativeRect.fromLTRB(0, 250.h, 0, 0),
//                       end: RelativeRect.fromLTRB(0, 300.h, 0, 0),
//                     ).animate(CurvedAnimation(
//                       parent: imageController,
//                       curve: Curves.easeIn,
//                     )),
//                     child: Center(
//                       child: Text(
//                         ArabicNumbers()
//                             .convert(provider.selectedLanguage.shape!),
//                         style: TextStyle(
//                             fontSize: 220.sp,
//                             fontWeight: FontWeight.w900,
//                             color: const Color(0xFF034C1B),
//                             fontFamily: 'Urdu',
//                             height: 0.0),
//                       ), /*Image.asset(
//                       provider.selectedLanguage.shape!,
//                       color: const Color(0xFF034C1B),
//                     )*/
//                     ), //widget.imageUrl
//                   )
//                 ],
//               ),
//             ));
//   }

//   Future record() async {
//     if (!isRecorderReady) return;
//     await recorder.startRecorder(
//         toFile: '${provider.selectedLanguage.name}${provider.userModel!.code}');
//   }

//   Future stop() async {
//     if (!isRecorderReady) return;

//     final path = await recorder.stopRecorder();

//     final audioFile = File(path!);
//     fileRecPath = audioFile.path;
//     debugPrint(
//         'Recorder Audio: ${audioFile.path}'); // TODO: this will store in firestore
//     debugPrint('تم تسجيل الصوت بنجاح');

//     //TODO: here we need to make matching  and show the result of matching to the kid
//     double result =
//         matchTwoAudios(provider.selectedLanguage.sound!, fileRecPath);
//     checkTheMatching(result);
//   }

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
//                         langId: provider.selectedLanguage.name,
//                         voicePath: fileRecPath,
//                         percentageMatch: result,
//                         isLetter: false,
//                         length: recordLength.inSeconds.toString()),
//                     voice.percentageMatch!)
//             : provider.addVoice(Voice(
//                     langId: provider.selectedLanguage.name,
//                     voicePath: fileRecPath,
//                     percentageMatch: result,
//                     isLetter: false,
//                     length: recordLength.inSeconds.toString())
//                 .toMap());

//         //TODO: sure from this widget by wafaa
//         AppRouter.router
//             .pushNamedWithReplacementFunction(BravoScreen.routeName, [
//           false,
//           true,
//           () {
//             AppRouter.router
//                 .pushNamedWithReplacementFunction(ExampleNumbers.routeName);
//           },
//           () {
//             AppRouter.router.pushNamedWithReplacementFunction(
//                 DisplayNumberScreen.routeName);
//           }
//         ]);
//         debugPrint('Duration$recordLength');
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

import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:yalla_njoom/routers/app_router.dart';
import 'package:yalla_njoom/screens/example_numbers_bg.dart';
import 'package:yalla_njoom/screens/numbers_screen.dart';

import '../helpers/my_methods.dart';
import '../models/my_flutter_app.dart';
import '../models/voice_model.dart';
import '../providers/firestore_provider.dart';
import '../widgets/default_circular_avatar.dart';
import '../widgets/toast_dialog_widget.dart';
import 'bravo_screen.dart';

class DisplayNumberScreen extends StatefulWidget {
  static String routeName = 'DisplayNumberScreen';
  DisplayNumberScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DisplayNumberScreen> createState() => _DisplayNumberScreenState();
}

class _DisplayNumberScreenState extends State<DisplayNumberScreen>
    with TickerProviderStateMixin {
  late AnimationController imageController;
  late Animation<double> animation;
  late FirestoreProvider provider;

  final recorder = FlutterSoundRecorder();

  late String fileRecPath = '';

  bool isRecorderReady = false;

  Duration recordLength = Duration.zero;

  @override
  void initState() {
    imageController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    imageController.repeat(reverse: true);
    initRecorder();
    super.initState();
  }

  @override
  void dispose() {
    imageController.dispose();
    recorder.closeRecorder();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<FirestoreProvider>(context, listen: false);
    return Consumer<FirestoreProvider>(
        builder: (context, provider, x) => Scaffold(
              body: Stack(
                children: [
                  Container(
                    constraints: const BoxConstraints.expand(),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/bird.png'),
                            fit: BoxFit.cover)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 77.h, right: 20.w),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 25.w),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: DefaultCirculeAvatar(
                                        onTap: () async {
                                          await provider.audioPlayer.stop();
                                          await provider
                                              .setIsSoundPlaying(false);
                                          AppRouter.router.pushNamedWithReplacementFunction(NumbersScreen.routeName);
                                        },
                                        iconData: MyFlutterApp.cancel,
                                        iconColor: const Color(0xFF034C1B),
                                        bgColor: const Color(0xFFDBECC2),
                                      )),
                                ),
                                DefaultCirculeAvatar(
                                  onTap: () async {
                                    await provider.playAudio(isSound: true);
                                  },
                                  iconData: MyFlutterApp.volumeMedium,
                                  iconColor: const Color(0xFF034C1B),
                                  bgColor: const Color(0xFFDBECC2),
                                ),
                                recorder.isRecording
                                    ? Padding(
                                        padding: EdgeInsets.only(
                                            top: 10.h, bottom: 10.h),
                                        child: GestureDetector(
                                          onTap: checkRecording,
                                          child: Container(
                                            height: 40.h,
                                            width: 80.w,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFF84FFB5),
                                              shape: BoxShape.rectangle,
                                              borderRadius:
                                                  BorderRadius.circular(33),
                                              boxShadow: [
                                                BoxShadow(
                                                    color:
                                                        const Color(0x4D074785),
                                                    offset: Offset(3.w, 6.h),
                                                    blurRadius: 9.r),
                                              ],
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.stop,
                                                  color:
                                                      const Color(0xFF074785),
                                                  size: 18.r,
                                                ),
                                                SizedBox(
                                                  width: 5.w,
                                                ),
                                                StreamBuilder<
                                                    RecordingDisposition>(
                                                  stream: recorder.onProgress,
                                                  builder: (context, snapshot) {
                                                    final duration =
                                                        snapshot.hasData
                                                            ? snapshot
                                                                .data!.duration
                                                            : Duration.zero;
                                                    recordLength = duration;
                                                    String twoDigits(int n) =>
                                                        n.toString().padLeft(1);
                                                    final twoDigitMinutes =
                                                        twoDigits(duration
                                                            .inMinutes
                                                            .remainder(60));
                                                    final twoDigitSeconds =
                                                        twoDigits(duration
                                                            .inSeconds
                                                            .remainder(60));
                                                    return Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 5.h),
                                                      child: Text(
                                                        '$twoDigitMinutes:$twoDigitSeconds',
                                                        style: TextStyle(
                                                          fontSize: 18.sp,
                                                          fontFamily: 'Tajawal',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: const Color(
                                                              0xFF074785),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    : Padding(
                                        padding: EdgeInsets.only(
                                            top: 10.h, bottom: 10.h),
                                        child: DefaultCirculeAvatar(
                                          onTap: checkRecording,
                                          iconData: MyFlutterApp.micNone,
                                          iconColor: const Color(0xFF034C1B),
                                          bgColor: const Color(0xFFDBECC2),
                                        ),
                                      ),
                                DefaultCirculeAvatar(
                                  onTap: () {
                                    return provider.allSolutions
                                                .firstWhere((element) =>
                                                    element.exampleId ==
                                                    provider.selectedLanguage
                                                        .exampleId)
                                                .numOfSolutions ==
                                            3
                                        ? AppRouter.router
                                            .pushNamedWithReplacementFunction(
                                                BravoScreen.routeName, [
                                            true,
                                            true,
                                            () {},
                                            () {
                                              AppRouter.router.pop();
                                            }
                                          ])
                                        : AppRouter.router.pushNamedFunction(
                                            ExampleNumbers.routeName);
                                    /* AppRouter.router
                                        .pushNamedWithReplacementFunction(
                                            ExampleNumbers.routeName);*/
                                  },
                                  iconData: MyFlutterApp.arrowRight_2,
                                  iconColor: const Color(0xFF034C1B),
                                  bgColor: const Color(0xFFDBECC2),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  PositionedTransition(
                    rect: RelativeRectTween(
                      begin: RelativeRect.fromLTRB(0, 250.h, 0, 0),
                      end: RelativeRect.fromLTRB(0, 300.h, 0, 0),
                    ).animate(CurvedAnimation(
                      parent: imageController,
                      curve: Curves.easeIn,
                    )),
                    child: Center(
                      child: Text(
                        ArabicNumbers()
                            .convert(provider.selectedLanguage.shape!),
                        style: TextStyle(
                            fontSize: 180.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF034C1B),
                            fontFamily: 'Urdu',
                            height: 0.0),
                      ), /*Image.asset(
                      provider.selectedLanguage.shape!,
                      color: const Color(0xFF034C1B),
                    )*/
                    ), //widget.imageUrl
                  )
                ],
              ),
            ));
  }

  Future record() async {
    if (!isRecorderReady) return;
    await recorder.startRecorder(
        toFile: '${provider.selectedLanguage.name}${provider.userModel!.code}');
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
                        langId: provider.selectedLanguage.name,
                        voicePath: fileRecPath,
                        percentageMatch: result,
                        isLetter: false,
                        length: recordLength.inSeconds.toString()),
                    voice.percentageMatch!)
            : provider.addVoice(Voice(
                    langId: provider.selectedLanguage.name,
                    voicePath: fileRecPath,
                    percentageMatch: result,
                    isLetter: false,
                    length: recordLength.inSeconds.toString())
                .toMap());
        //TODO: sure from this widget by wafaa
        AppRouter.router
            .pushNamedWithReplacementFunction(BravoScreen.routeName, [
          false,
          true,
          () {
            AppRouter.router
                .pushNamedWithReplacementFunction(ExampleNumbers.routeName);
          },
          () {
            AppRouter.router.pushNamedWithReplacementFunction(DisplayNumberScreen.routeName);
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
