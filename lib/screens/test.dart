// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';
// // import 'package:google_speech/speech_client_authenticator.dart';
// // import 'package:google_speech/google_speech.dart';
// // import 'package:permission_handler/permission_handler.dart';
// // import 'package:loading_indicator/loading_indicator.dart';
// // import 'dart:io';
// // import 'dart:async';
//
// // class TestScreen extends StatefulWidget {
// //   TestScreen({Key? key, required this.title}) : super(key: key);
// //   static const String routeName = 'TestScreen';
// //   final String title;
//
// //   @override
// //   _TestScreenState createState() => _TestScreenState();
// // }
//
// // class _TestScreenState extends State<TestScreen> {
// //   bool is_Transcribing = false;
// //   String content = '';
//
// //   void transcribe() async {
// //     setState(() {
// //       is_Transcribing = true;
// //     });
// //     final serviceAccount = ServiceAccount.fromString(
// //         '${(await rootBundle.loadString('assets/testjson.json'))}');
// //     final speechToText = SpeechToText.viaServiceAccount(serviceAccount);
//
// //     final config = RecognitionConfig(
// //         encoding: AudioEncoding.LINEAR16,
// //         model: RecognitionModel.command_and_search,
// //         enableAutomaticPunctuation: false,
// //         audioChannelCount: 2,
// //         sampleRateHertz: 48000,
// //         languageCode: 'ar-PS');
//
// //     final audio = await _getAudioContent('test.wav');
// //     await speechToText.recognize(config, audio).then((value) {
// //       setState(() {
// //         print(value.results);
// //         content = value.results.map((e) {
// //           print('dgldf;ogkfdo4e$e');
// //           return e.alternatives.first.transcript;
// //         }).join('\n');
// //         print('content$content');
// //       });
// //     }).whenComplete(() {
// //       setState(() {
// //         is_Transcribing = false;
// //       });
// //     });
// //   }
//
// //   Future<List<int>> _getAudioContent(String name) async {
// //     //final directory = await getApplicationDocumentsDirectory();
// //     //final path = directory.path + '/$name';
// // //'/storage/emulated/0/Download/letters.wav'
// //     return File('/storage/emulated/0/Download/letters.wav')
// //         .readAsBytesSync()
// //         .toList();
// //   }
//
// //   @override
// //   void initState() {
// //     setPermissions();
// //     super.initState();
// //   }
//
// //   void setPermissions() async {
// //     await Permission.manageExternalStorage.request();
// //     await Permission.storage.request();
// //   }
//
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Color.fromARGB(255, 0, 0, 0),
// //       appBar: AppBar(
// //         toolbarHeight: 80,
// //         backgroundColor: Color.fromARGB(255, 8, 148, 94),
// //         elevation: 0,
// //         centerTitle: true,
// //         title: Text('Transcribe Your Audio'),
// //       ),
// //       body: SingleChildScrollView(
// //         child: Container(
// //           height: MediaQuery.of(context).size.height,
// //           width: MediaQuery.of(context).size.width,
// //           decoration: BoxDecoration(
// //             color: Colors.white,
// //             borderRadius: BorderRadius.only(
// //               topRight: Radius.circular(50),
// //               topLeft: Radius.circular(50),
// //             ),
// //           ),
// //           child: Center(
// //             child: Column(
// //               mainAxisAlignment: MainAxisAlignment.start,
// //               children: <Widget>[
// //                 SizedBox(
// //                   height: 70,
// //                 ),
// //                 Container(
// //                   height: 200,
// //                   width: 300,
// //                   decoration: BoxDecoration(
// //                     border: Border.all(color: Colors.black),
// //                     borderRadius: BorderRadius.circular(20),
// //                   ),
// //                   padding: EdgeInsets.all(5.0),
// //                   child: content == ''
// //                       ? Text(
// //                           'Your text will appear here',
// //                           style: TextStyle(color: Colors.grey),
// //                         )
// //                       : Text(
// //                           content,
// //                           style: TextStyle(fontSize: 20),
// //                         ),
// //                 ),
// //                 SizedBox(
// //                   height: 10,
// //                 ),
// //                 Container(
// //                   child: is_Transcribing
// //                       ? Expanded(
// //                           child: LoadingIndicator(
// //                             indicatorType: Indicator.ballPulse,
// //                             colors: [Colors.red, Colors.green, Colors.blue],
// //                           ),
// //                         )
// //                       : ElevatedButton(
// //                           style: ElevatedButton.styleFrom(
// //                             elevation: 10,
// //                             primary: Color.fromARGB(255, 108, 96, 225),
// //                             shape: RoundedRectangleBorder(
// //                               borderRadius: BorderRadius.circular(15),
// //                             ),
// //                           ),
// //                           onPressed: is_Transcribing ? () {} : transcribe,
// //                           child: is_Transcribing
// //                               ? CircularProgressIndicator()
// //                               : Text(
// //                                   'Transcribe',
// //                                   style: TextStyle(fontSize: 20),
// //                                 ),
// //                         ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'dart:io';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_speech/google_speech.dart';
// import 'package:google_speech/speech_client_authenticator.dart';
// import 'package:google_speech/speech_to_text.dart';
// import 'dart:async';
// import 'package:path_provider/path_provider.dart';
// import 'package:record_mp3/record_mp3.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// class TestScreen extends StatefulWidget {
//   static const String routeName = 'TestScreen';
//   @override
//   _TestScreenState createState() => _TestScreenState();
// }
//
// class _TestScreenState extends State<TestScreen> {
//   String statusText = "";
//   bool isComplete = false;
//   bool is_Transcribing = false;
//   String content = '';
//   void transcribe() async {
//     setState(() {
//       is_Transcribing = true;
//     });
//     final serviceAccount = ServiceAccount.fromString(
//         '${(await rootBundle.loadString('assets/testjson.json'))}');
//     final speechToText = SpeechToText.viaServiceAccount(serviceAccount);
//
//     final config = RecognitionConfig(
//         encoding: AudioEncoding.ENCODING_UNSPECIFIED,
//         model: RecognitionModel.command_and_search,
//         enableAutomaticPunctuation: true,
//         audioChannelCount: 2,
//         sampleRateHertz: 16000,
//         languageCode: 'en-US');
//     // final config = RecognitionConfig(
//     //     encoding: AudioEncoding.LINEAR16,
//     //     model: RecognitionModel.command_and_search,
//     //     enableAutomaticPunctuation: false,
//     //     audioChannelCount: 2,
//     //     sampleRateHertz: 48000,
//     //     languageCode: 'ar-PS');
//
//     final audio = await _getAudioContent('test.wav');
//     await speechToText.recognize(config, audio).then((value) {
//       setState(() {
//         print(value.results);
//         content = value.results.map((e) {
//           print('dgldf;ogkfdo4e$e');
//           return e.alternatives.first.transcript;
//         }).join('\n');
//         print('content$content');
//       });
//     }).whenComplete(() {
//       setState(() {
//         is_Transcribing = false;
//       });
//     });
//   }
//
//   Future<List<int>> _getAudioContent(String name) async {
//     //final directory = await getApplicationDocumentsDirectory();
//     //final path = directory.path + '/$name';
// //'/storage/emulated/0/Download/letters.wav'
//     print('$recordFilePath hi its recordfilepath');
//     return File(recordFilePath!).readAsBytesSync().toList();
//   }
//
//   @override
//   void initState() {
//     setPermissions();
//     super.initState();
//   }
//
//   void setPermissions() async {
//     await Permission.manageExternalStorage.request();
//     await Permission.storage.request();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Plugin example app'),
//         ),
//         body: Column(children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Expanded(
//                 child: GestureDetector(
//                   child: Container(
//                     height: 48.0,
//                     decoration: BoxDecoration(color: Colors.red.shade300),
//                     child: Center(
//                       child: Text(
//                         'start',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                   ),
//                   onTap: () async {
//                     startRecord();
//                   },
//                 ),
//               ),
//               Expanded(
//                 child: GestureDetector(
//                   child: Container(
//                     height: 48.0,
//                     decoration: BoxDecoration(color: Colors.blue.shade300),
//                     child: Center(
//                       child: Text(
//                         RecordMp3.instance.status == RecordStatus.PAUSE
//                             ? 'resume'
//                             : 'pause',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                   ),
//                   onTap: () {
//                     pauseRecord();
//                   },
//                 ),
//               ),
//               Expanded(
//                 child: GestureDetector(
//                   child: Container(
//                     height: 48.0,
//                     decoration: BoxDecoration(color: Colors.green.shade300),
//                     child: Center(
//                       child: Text(
//                         'stop',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                   ),
//                   onTap: () {
//                     stopRecord();
//                   },
//                 ),
//               ),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 20.0),
//             child: Text(
//               statusText,
//               style: TextStyle(color: Colors.red, fontSize: 20),
//             ),
//           ),
//           GestureDetector(
//             behavior: HitTestBehavior.opaque,
//             onTap: () {
//               play();
//             },
//             child: Container(
//               margin: EdgeInsets.only(top: 30),
//               alignment: AlignmentDirectional.center,
//               width: 100,
//               height: 50,
//               child: isComplete && recordFilePath != null
//                   ? Text(
//                       "play",
//                       style: TextStyle(color: Colors.red, fontSize: 20),
//                     )
//                   : Container(),
//             ),
//           ),
//           GestureDetector(
//             onTap: is_Transcribing ? () {} : transcribe,
//             child: Container(child: Text('press here to transcript')),
//           ),
//           Text(
//             content,
//             style: TextStyle(fontSize: 20),
//           )
//         ]),
//       ),
//     );
//   }
//
//   Future<bool> checkPermission() async {
//     if (!await Permission.microphone.isGranted) {
//       PermissionStatus status = await Permission.microphone.request();
//       if (status != PermissionStatus.granted) {
//         return false;
//       }
//     }
//     return true;
//   }
//
//   void startRecord() async {
//     bool hasPermission = await checkPermission();
//     if (hasPermission) {
//       statusText = "Recording...";
//       recordFilePath = await getFilePath();
//       isComplete = false;
//       RecordMp3.instance.start(recordFilePath!, (type) {
//         statusText = "Record error--->$type";
//         setState(() {});
//       });
//     } else {
//       statusText = "No microphone permission";
//     }
//     setState(() {});
//   }
//
//   void pauseRecord() {
//     if (RecordMp3.instance.status == RecordStatus.PAUSE) {
//       bool s = RecordMp3.instance.resume();
//       if (s) {
//         statusText = "Recording...";
//         setState(() {});
//       }
//     } else {
//       bool s = RecordMp3.instance.pause();
//       if (s) {
//         statusText = "Recording pause...";
//         setState(() {});
//       }
//     }
//   }
//
//   void stopRecord() {
//     bool s = RecordMp3.instance.stop();
//     if (s) {
//       statusText = "Record complete";
//       isComplete = true;
//       setState(() {});
//     }
//   }
//
//   void resumeRecord() {
//     bool s = RecordMp3.instance.resume();
//     if (s) {
//       statusText = "Recording...";
//       setState(() {});
//     }
//   }
//
//   String? recordFilePath;
//
//   void play() {
//     if (recordFilePath != null && File(recordFilePath!).existsSync()) {
//       AudioPlayer audioPlayer = AudioPlayer();
//       audioPlayer.play(
//         DeviceFileSource(recordFilePath!),
//       );
//       print(recordFilePath);
//     }
//   }
//
//   int i = 0;
//
//   Future<String> getFilePath() async {
//     Directory storageDirectory = await getApplicationDocumentsDirectory();
//     String sdPath = storageDirectory.path + "/record";
//     var d = Directory(sdPath);
//     if (!d.existsSync()) {
//       d.createSync(recursive: true);
//     }
//
//     return sdPath + "/test_${i++}.mp3";
//   }
// }