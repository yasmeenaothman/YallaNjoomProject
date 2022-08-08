import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_speech/speech_client_authenticator.dart';
import 'package:google_speech/google_speech.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';
import 'package:yalla_njoom/providers/firestore_provider.dart';
import 'dart:io';
import 'dart:async';

import '../helpers/firestore_helper.dart';
import '../models/voice_model.dart';

class TestScreen extends StatefulWidget {
  TestScreen({Key? key, required this.title}) : super(key: key);
  static const String routeName = 'TestScreen';
  final String title;

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  bool is_Transcribing = false;
  String content = '';

  void transcribe() async {
    setState(() {
      is_Transcribing = true;
    });
    final serviceAccount = ServiceAccount.fromString(
        '${(await rootBundle.loadString('assets/testjson.json'))}');
    final speechToText = SpeechToText.viaServiceAccount(serviceAccount);

    final config = RecognitionConfig(
        encoding: AudioEncoding.LINEAR16,
        model: RecognitionModel.command_and_search,
        enableAutomaticPunctuation: false,
        audioChannelCount: 2,
        sampleRateHertz: 48000,
        languageCode: 'ar-PS');

    final audio = await _getAudioContent('test.wav');
    await speechToText.recognize(config, audio).then((value) {
      setState(() {
        print(value.results);
        content = value.results.map((e) {
          print('dgldf;ogkfdo4e$e');
          return e.alternatives.first.transcript;
        }).join('\n');
        print('content$content');
      });
    }).whenComplete(() {
      setState(() {
        is_Transcribing = false;
      });
    });
  }

  Future<List<int>> _getAudioContent(String name) async {
    //final directory = await getApplicationDocumentsDirectory();
    //final path = directory.path + '/$name';
//'/storage/emulated/0/Download/letters.wav'
    return File('/storage/emulated/0/Download/letters.wav')
        .readAsBytesSync()
        .toList();
  }

  @override
  void initState() {
    setPermissions();
    super.initState();
  }

  void setPermissions() async {
    await Permission.manageExternalStorage.request();
    await Permission.storage.request();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Color.fromARGB(255, 8, 148, 94),
        elevation: 0,
        centerTitle: true,
        title: Text('Transcribe Your Audio'),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(50),
              topLeft: Radius.circular(50),
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 70,
                ),
                Container(
                  height: 200,
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.all(5.0),
                  child: content == ''
                      ? Text(
                          'Your text will appear here',
                          style: TextStyle(color: Colors.grey),
                        )
                      : Text(
                          content,
                          style: TextStyle(fontSize: 20),
                        ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: is_Transcribing
                      ? Expanded(
                          child: LoadingIndicator(
                            indicatorType: Indicator.ballPulse,
                            colors: [Colors.red, Colors.green, Colors.blue],
                          ),
                        )
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 10,
                            primary: Color.fromARGB(255, 108, 96, 225),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: is_Transcribing ? () {} : transcribe,
                          child: is_Transcribing
                              ? CircularProgressIndicator()
                              : Text(
                                  'Transcribe',
                                  style: TextStyle(fontSize: 20),
                                ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
