import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../providers/firestore_provider.dart';
import '../routers/app_router.dart';
import '../widgets/container_with_image.dart';
import '../widgets/default_circular_avatar.dart';
import 'letters_screen.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({Key? key}) : super(key: key);
  static String routeName = 'MusicScreen';

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  Duration? duration = Duration.zero;
  int currentPosition = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirestoreProvider provider =
        Provider.of<FirestoreProvider>(context, listen: false);
    provider.audioPlayer.onPlayerStateChanged.listen((event) {
      setState(() {
        provider.isSongPlaying = event == PlayerState.playing;
      });
    });
    provider.audioPlayer.onPositionChanged.listen((event) {
      setState(() {
        currentPosition = event.inMilliseconds;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FirestoreProvider>(
      builder: (context, provider, x) {
        return Scaffold(
          body: ContainerWithImage(
            imageName: 'assets/images/background_examples.png',
            children: [
              SizedBox(
                height: 20.h,
              ),
              DefaultCirculeAvatar(
                onTap: () async {
                  await provider.audioPlayer.stop();
                  await provider.setIsSongPlaying(false);
                  AppRouter.router.pushNamedWithReplacementFunction(
                      LettersScreen.routeName);
                },
              ),
              SizedBox(
                height: 200.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 43.w),
                child: Row(
                  children: [
                    Image.asset(
                      provider.lettersExample
                          .firstWhere((element) =>
                              provider.selectedLanguage.exampleId ==
                              element.exampleId)
                          .img2!,
                      fit: BoxFit.fill,
                    ),
                    Text(
                      provider.selectedLanguage.shape!,
                      style: TextStyle(
                        fontSize: 128.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontFamily: 'Urdu',
                      ),
                    ), // we will take from selected letter that on the provider
                  ],
                ),
              ),
              SizedBox(
                height: 100.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Image.asset('assets/images/return.png'),
                    onTap: () async {
                      provider.isSongPlaying = false;
                      await provider.playAudio(
                        isSound: false,
                      );
                    },
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  GestureDetector(
                    child: Image.asset(
                        'assets/images/${provider.isSongPlaying ? 'start' : 'stop'}.png'),
                    onTap: () async {
                      print('${currentPosition} kkkkkkkkkkkkkkkk');
                      await provider.audioPlayer.seek(Duration(
                          milliseconds:
                              currentPosition)); //position??Duration.zero
                      await provider.playAudio(
                          isSound: false, isFromMusicSCr: true);
                    },
                  ),
                ],
              )
              /* Center(
                child: GestureDetector(
              child: Image.asset('assets/images/left.png'),
              onTap: () async {
                await provider.playAudio(isSound: false);
              },
            )),*/
            ],
          ),
        );
      },
    );
  }
}
