// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:yalla_njoom/widgets/scaffold_with_background.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// import '../models/my_flutter_app.dart';
// import '../routers/app_router.dart';
// import '../widgets/default_circular_avatar.dart';
// import 'numbers_screen.dart';

// class VideosScreen extends StatefulWidget {
//   const VideosScreen({Key? key}) : super(key: key);
//   static const String routeName = 'VideosScreen';

//   @override
//   State<VideosScreen> createState() => _VideosScreenState();
// }

// class _VideosScreenState extends State<VideosScreen> {
//   // static const String colorUrl = 'colorUrl';
//   // static const String sensesUrl = 'sensesUrl';
//   // static const String linesUrl = 'linesUrl';
//   // static const String lettersUrl = 'lettersUrl';
//   // static const String numbersURl = 'numbersURl';
//   static const String videoUrl = 'url';
//   static const String videoName = 'name';
//   List videos = [
//     {
//       videoUrl: 'https://www.youtube.com/watch?v=8_4_F8EunRI',
//       videoName: 'الألوان'
//     },
//     {
//       videoUrl: 'https://www.youtube.com/watch?v=b1RicSEcI2g',
//       videoName: 'الحواس'
//     },
//     {
//       videoUrl: 'https://www.youtube.com/watch?v=2vqZmpnTjbI',
//       videoName: 'الخطوط'
//     },
//     {
//       videoUrl: 'https://www.youtube.com/watch?v=LyzupN62MGA',
//       videoName: 'الحروف'
//     },
//     {
//       videoUrl: 'https://www.youtube.com/watch?v=uCYv55twbhE',
//       videoName: 'الأرقام'
//     },
//   ];

//   late YoutubePlayerController controller;

//   @override
//   void deactivate() {
//     controller.pause();
//     super.deactivate();
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     ThemeData theme = Theme.of(context);
//     return ScaffoldWithBackground(
//         body: Padding(
//       padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 25.h),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Align(
//               alignment: Alignment.centerRight,
//               child: DefaultCirculeAvatar(
//                 onTap: () => AppRouter.router.pop(),
//                 iconData: MyFlutterApp.cancel,
//               )),
//           SizedBox(
//             height: 50.h,
//           ),
//           Padding(
//             padding: EdgeInsets.only(right: 15.w, bottom: 33.h),
//             child: Text(
//               'فيديو تعليمي',
//               softWrap: true,
//               textDirection: TextDirection.rtl,
//               style: theme.textTheme.headline3!.copyWith(fontSize: 24.sp),
//             ),
//           ),
//           Expanded(
//             child: ListView.separated(
//               itemBuilder: ((context, index) {
//                 controller = YoutubePlayerController(
//                     initialVideoId:
//                         YoutubePlayer.convertUrlToId(videos[index][videoUrl])!,
//                     flags: const YoutubePlayerFlags(autoPlay: false));
//                 return YoutubePlayerBuilder(
//                     player: YoutubePlayer(controller: controller),
//                     builder: (context, player) => videoContainer(
//                         theme, player, videos[index][videoName]));
//               }),
//               itemCount: videos.length,
//               separatorBuilder: (context, index) {
//                 return SizedBox(height: 20.h);
//               },
//             ),
//           ),
//         ],
//       ),
//     ));
//   }

//   videoContainer(ThemeData theme, player, title) {
//     return Column(
//       children: [
//         Container(
//           clipBehavior: Clip.antiAliasWithSaveLayer,
//           height: 201.h,
//           width: double.infinity,
//           child: player,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(20.r),
//                 topRight: Radius.circular(20.r)),
//             border: Border.all(
//               color: theme.primaryColor,
//               width: 3.0,
//             ),
//           ),
//         ),
//         Container(
//           width: double.infinity,
//           padding: EdgeInsets.symmetric(vertical: 10.h),
//           child: Center(
//             child: Text(
//               title,
//               style: theme.textTheme.headline3!.copyWith(color: Colors.white),
//             ),
//           ),
//           decoration: BoxDecoration(
//             color: theme.primaryColor,
//             borderRadius: const BorderRadius.only(
//                 bottomLeft: Radius.circular(20),
//                 bottomRight: Radius.circular(20)),
//             border: Border.all(
//               color: theme.primaryColor,
//               width: 3.0,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:yalla_njoom/models/dummy_data.dart';
import 'package:yalla_njoom/widgets/scaffold_with_background.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../models/my_flutter_app.dart';
import '../providers/firestore_provider.dart';
import '../routers/app_router.dart';
import '../widgets/default_circular_avatar.dart';
import 'numbers_screen.dart';

class VideosScreen extends StatefulWidget {
  const VideosScreen({Key? key}) : super(key: key);
  static const String routeName = 'VideosScreen';
  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  late YoutubePlayerController controller;

  @override
  void deactivate() {
    controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    FirestoreProvider provider =
        Provider.of<FirestoreProvider>(context, listen: false);
    return ScaffoldWithBackground(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 25.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
              alignment: Alignment.centerRight,
              child: DefaultCirculeAvatar(
                onTap: () => AppRouter.router.pop(),
                iconData: MyFlutterApp.cancel,
              )),
          SizedBox(
            height: 50.h,
          ),
          Padding(
            padding: EdgeInsets.only(right: 15.w, bottom: 33.h),
            child: Text(
              'فيديو تعليمي',
              softWrap: true,
              textDirection: TextDirection.rtl,
              style: theme.textTheme.headline3!.copyWith(fontSize: 24.sp),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: ((context, index) {
                controller = YoutubePlayerController(
                    initialVideoId: YoutubePlayer.convertUrlToId(
                        DummyData.dummyData.videos[index][DummyData.videoUrl])!,
                    flags: const YoutubePlayerFlags(autoPlay: false));
                return YoutubePlayerBuilder(
                    player: YoutubePlayer(
                      controller: controller,
                      onEnded: (x) {
                        /// i//o
                        provider.updateKidCoins(2);
                      },
                    ),
                    builder: (context, player) => videoContainer(
                        theme,
                        player,
                        DummyData.dummyData.videos[index]
                            [DummyData.videoName]));
              }),
              itemCount: DummyData.dummyData.videos.length,
              separatorBuilder: (context, index) {
                return SizedBox(height: 20.h);
              },
            ),
          ),
        ],
      ),
    ));
  }

  videoContainer(ThemeData theme, player, title) {
    return Column(
      children: [
        Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          height: 201.h,
          width: double.infinity,
          child: player,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r)),
            border: Border.all(
              color: theme.primaryColor,
              width: 3.0,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Center(
            child: Text(
              title,
              style: theme.textTheme.headline3!.copyWith(color: Colors.white),
            ),
          ),
          decoration: BoxDecoration(
            color: theme.primaryColor,
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            border: Border.all(
              color: theme.primaryColor,
              width: 3.0,
            ),
          ),
        ),
      ],
    );
  }
}
