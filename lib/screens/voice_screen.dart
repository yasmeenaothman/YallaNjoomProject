import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:yalla_njoom/models/my_flutter_app.dart';
import 'package:yalla_njoom/models/voice_model.dart';
import 'package:yalla_njoom/providers/firestore_provider.dart';
import 'package:yalla_njoom/screens/child_tracker_screen.dart';
import 'package:yalla_njoom/widgets/scaffold_with_background.dart';

import '../routers/app_router.dart';
import '../widgets/default_circular_avatar.dart';

class VoiceScreen extends StatefulWidget {
  VoiceScreen({Key? key, required this.isLetter}) : super(key: key);
  static const String routeName = 'VoiceScreen';
  bool isLetter;

  @override
  State<VoiceScreen> createState() => _VoiceScreenState();
}

class _VoiceScreenState extends State<VoiceScreen>   with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  final audioPlayer = AudioPlayer();

  bool isPlaying = false;
  int voicePressedIndex = 0;
  Duration lengthOfAudio = Duration.zero;



  @override
  void initState() {
    // TODO: implement initState

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    animation = CurvedAnimation(parent: controller, curve: Curves.easeInOut);
    controller.repeat(reverse: true,);


    super.initState();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    controller.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    audioPlayer.onPlayerComplete.listen((event) => setState(() {
          isPlaying = false;
        }));
    return Consumer<FirestoreProvider>(builder: (context, provider, x) {
      int itemCount = widget.isLetter
          ? provider.childPressedLettersVoices.length
          : provider.childPressedNumbersVoices.length;
      return ScaffoldWithBackground(
          body: Directionality(
        textDirection: TextDirection.ltr,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 25.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.centerRight,
                  child: DefaultCirculeAvatar(
                    onTap: () => AppRouter.router
                        .pop(),
                    iconData: MyFlutterApp.cancel,
                  )),
              SizedBox(
                height: 50.h,
              ),
              Expanded(
                child: itemCount == 0
                    ? Center(
                        child: _buildNoVoices(theme),
                      )
                    : ListView.separated(
                        itemBuilder: ((context, index) {
                          List<Voice> voices = widget.isLetter
                              ? provider.childPressedLettersVoices
                              : provider.childPressedNumbersVoices;
                          return _buildVoiceWidget(
                              theme: theme, voice: voices[index], index: index);
                        }),
                        itemCount: itemCount,
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 20.h);
                        },
                      ),
              ),
            ],
          ),
        ),
      ));
    });
  }

  Column _buildNoVoices(ThemeData theme) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
    RotationTransition(
    turns: Tween<double>(begin: -0.05, end: 0.05).animate(animation),
    child: Image.asset('assets/images/unhappy_star.png')),
        SizedBox(
          height: 10.h,
        ),
        Text(
          'لا يوجد قراءات لهذا الطفل',
          style: theme.textTheme.headline1!.copyWith(fontSize: 20.sp),
        )
      ],
    );
  }

  _buildVoiceWidget({required theme, required Voice voice, required index}) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Row(
          children: [
            // if (!isLocked)
            GestureDetector(
              onTap: () async {
                await audioPlayer.setSourceUrl(voice.voicePath!);

                isPlaying = true;
                await audioPlayer.resume();
                voicePressedIndex = index;
                print(voicePressedIndex);
                setState(() {});
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                height: 65.h,
                width: 65.w,
                child: Icon(
                  isPlaying && voicePressedIndex == index
                      ? Icons.pause_rounded
                      : Icons.arrow_left_rounded,
                  size: isPlaying && voicePressedIndex == index ? 32.r : 45.r,
                  color: theme.primaryColor,
                ),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: theme.primaryColor,
                        offset: Offset(0.w, 3.h),
                        blurRadius: 6.r)
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      bottomLeft: Radius.circular(20.r)),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 65.h,
                padding: EdgeInsets.all(20.h),
                child: Row(
                  children: [
                    // if (!isLocked)
                    ...[
                      Text(
                        'ث ',
                        style: theme.textTheme.subtitle1!
                            .copyWith(color: Colors.white),
                      ),
                      Text(
                        voice.length! == '0' ? '0.5' : voice.length!,
                        style: theme.textTheme.subtitle1!
                            .copyWith(color: Colors.white),
                      ),
                    ],
                    const Expanded(child: SizedBox()),
                    Text(
                      voice.langId ?? '',
                      style: theme.textTheme.headline1!
                          .copyWith(color: Colors.white),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: theme.primaryColor,
                  boxShadow: [
                    BoxShadow(
                        color: theme.primaryColor,
                        offset: Offset(0.w, 3.h),
                        blurRadius: 6.r)
                  ],
                  // isLocked
                  //     ? BorderRadius.circular(20.r)
                  //     :
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.r),
                      bottomRight: Radius.circular(20.r)),
                ),
              ),
            ),
          ],
        ),
        // if (isLocked)
        //   Container(
        //     height: 65.h,
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(20.r),
        //       color: Colors.black.withOpacity(0.5),
        //     ),
        //   ),
        // if (isLocked)
        //   Padding(
        //     padding: EdgeInsets.only(left: 20.w),
        //     child: const Icon(
        //       MyFlutterApp.micNone,
        //       color: Colors.white,
        //     ),
        //   )
      ],
    );
  }
}
