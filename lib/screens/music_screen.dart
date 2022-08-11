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

class _MusicScreenState extends State<MusicScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  Duration? duration = Duration.zero;
  int currentPosition = 0;
  late FirestoreProvider provider ;
  @override
  void initState() {
    // TODO: implement initState
    provider =Provider.of<FirestoreProvider>(context,listen: false);

    provider.audioPlayer.onPlayerStateChanged.listen((event) {
      if (mounted) {
        setState(() {
          // Your state change code goes here
          provider.isSongPlaying = event == PlayerState.playing;
        });
      }
    });
    provider.audioPlayer.onPositionChanged.listen((event) {

      if (mounted) {
        setState(() {
          // Your state change code goes here
          currentPosition = event.inMilliseconds;
        });
      }
    });


    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    animation = CurvedAnimation(parent: controller, curve: Curves.easeInOut);
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    provider.audioPlayer.dispose();
    super.dispose();
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
                  provider.setIsSongPlaying(false);
                  await provider.audioPlayer.stop();
                  AppRouter.router.pop();
                },
              ),
              SizedBox(
                height: 200.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 43.w),
                child: Row(
                  children: [
                    RotationTransition(
                      turns: Tween<double>(begin: -0.05, end: 0.05)
                          .animate(animation),
                      child: Image.asset(
                          provider.lettersExample
                              .firstWhere((element) =>
                                  provider.selectedLanguage.exampleId ==
                                  element.exampleId)
                              .img2!,
                          fit: BoxFit.fill),
                    ),
                    // Image.asset(
                    //   provider.lettersExample
                    //       .firstWhere((element) =>
                    //           provider.selectedLanguage.exampleId ==
                    //           element.exampleId)
                    //       .img2!,
                    //   fit: BoxFit.fill,
                    // ),
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
