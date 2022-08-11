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

// class GamesScreen extends StatelessWidget {
//   GamesScreen({Key? key}) : super(key: key);
//   static const String routeName = 'GamesScreen';
//   static const String gameUrl = 'url';
//   static const String gameName = 'name';
//   static const String coinsNeeded = 'coins';
//   static const String gameImg = 'img';
//   static const String isLocked = 'isLocked';
//   List games = [
//     {
//       gameUrl: 'https://www.youtube.com/watch?v=8_4_F8EunRI',
//       gameName: 'لعبة البطيخ',
//       coinsNeeded: '120',
//       gameImg: 'assets/images/nico.jpg',
//       isLocked: false
//     },
//     {
//       gameUrl: 'https://www.youtube.com/watch?v=b1RicSEcI2g',
//       gameName: 'لعبة الشمام',
//       coinsNeeded: '500',
//       gameImg: 'assets/images/exer_img.png',
//       isLocked: true
//     },
//     {
//       gameUrl: 'https://www.youtube.com/watch?v=2vqZmpnTjbI',
//       gameName: 'لعبة السيارات',
//       coinsNeeded: '0',
//       gameImg: 'assets/images/games.png',
//       isLocked: true
//     },
//   ];
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
//               'اختر اللعبة التي تحبها',
//               softWrap: true,
//               textDirection: TextDirection.rtl,
//               style: theme.textTheme.headline3!.copyWith(fontSize: 24.sp),
//             ),
//           ),
//           Expanded(
//             child: ListView.separated(
//               scrollDirection: Axis.horizontal,
//               itemBuilder: ((context, index) {
//                 return _buildGameContainer(theme, index);
//               }),
//               itemCount: 3,
//               separatorBuilder: (context, index) {
//                 return SizedBox(width: 20.w);
//               },
//             ),
//           ),
//         ],
//       ),
//     ));
//   }

//   _buildGameContainer(ThemeData theme, int index) {
//     return GestureDetector(
//       onTap: () {
//         //TODO: USING THE URL  GO TO THE SPECIFIC GAME BY PLAY STORE
//         //TODO: games[index][gameUrl]
//       },
//       child: Stack(
//         children: [
//           Column(
//             children: [
//               Container(
//                 clipBehavior: Clip.antiAliasWithSaveLayer,
//                 height: 279.h,
//                 width: 256.w,
//                 child: Image.asset(
//                   games[index][gameImg],
//                   fit: BoxFit.cover,
//                 ),
//                 decoration: BoxDecoration(
//                   color: theme.colorScheme.secondary,
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(20.r),
//                       topRight: Radius.circular(20.r)),
//                 ),
//               ),
//               Container(
//                 width: 256.w,
//                 height: 98.h,
//                 padding: EdgeInsets.symmetric(vertical: 20.h),
//                 child: Center(
//                   child: Column(
//                     children: [
//                       Text(
//                         games[index][gameName],
//                         style: theme.textTheme.headline3,
//                       ),
//                       SizedBox(
//                         height: 10.h,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Image.asset('assets/images/coin.png'),
//                           SizedBox(width: 10.w),
//                           Text(
//                             '${games[index][coinsNeeded]} ذهبية',
//                             style: theme.textTheme.headline3,
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 decoration: const BoxDecoration(
//                   color: Color(0xffFFDCD4),
//                   borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(20),
//                       bottomRight: Radius.circular(20)),
//                 ),
//               ),
//             ],
//           ),
//           games[index][isLocked]
//               ? Container(
//                   width: 256.w,
//                   height: 377.h,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20.r),
//                     color: Colors.black.withOpacity(0.5),
//                   ),
//                 )
//               : const SizedBox(),
//           games[index][isLocked]
//               ? Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Image.asset('assets/images/game_lock.png'),
//                 )
//               : const SizedBox(),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:yalla_njoom/screens/child_home_screen.dart';
import 'package:yalla_njoom/widgets/scaffold_with_background.dart';

import '../models/my_flutter_app.dart';
import '../providers/firestore_provider.dart';
import '../routers/app_router.dart';
import '../widgets/default_circular_avatar.dart';
import '../widgets/default_elevated_button.dart';
import '../widgets/user_code_dialog.dart';

class GamesScreen extends StatefulWidget {
  GamesScreen({Key? key}) : super(key: key);
  static const String routeName = 'GamesScreen';

  @override
  State<GamesScreen> createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {
  late BuildContext _buildContext;
  late FirestoreProvider provider;
  @override
  void initState() {
    // TODO: implement initState
    provider = Provider.of<FirestoreProvider>(context, listen: false);
    provider.audioPlayer.stop();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    _buildContext = context;
    ThemeData theme = Theme.of(context);
    provider.playEncourageAudio('assets/audio/اختر اللعبة التي تحبها.mp3');
    return  Consumer<FirestoreProvider>(
      builder:(context,provider,x)=> ScaffoldWithBackground(
            body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 25.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.centerRight,
                  child: DefaultCirculeAvatar(
                    onTap: () {
                      provider.audioPlayer.dispose();
                       AppRouter.router
                        .pop();
                    },
                    iconData: MyFlutterApp.cancel,
                  )),
              SizedBox(
                height: 50.h,
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.w, bottom: 33.h),
                child: Text(
                  'اختر اللعبة التي تحبها',
                  softWrap: true,
                  textDirection: TextDirection.rtl,
                  style: theme.textTheme.headline3!.copyWith(fontSize: 24.sp),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return _buildGameContainer(
                      theme,
                      index,
                      provider,
                    );
                  },
                  itemCount: provider.games.length,
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 20.w);
                  },
                ),
              ),
            ],
          ),
        )),
    );
  }

  _buildGameContainer(
    ThemeData theme,
    int index,
    FirestoreProvider provider,
  ) {
    return Column(
      children: [
        Stack(
          children: [
            Column(
              children: [
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  height: 279.h,
                  width: 256.w,
                  child: Image.asset(
                    provider.games[index].gameImg!,
                    fit: BoxFit.cover,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.secondary,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        topRight: Radius.circular(20.r)),
                  ),
                ),
                Container(
                  width: 256.w,
                  height: 98.h,
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          provider.games[index].gameName!,
                          style: theme.textTheme.headline3,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/coin.png'),
                              SizedBox(width: 10.w),
                              Text(
                                '${provider.games[index].isLocked! ? provider.games[index].coinsNeeded : 0} ذهبية', //provider.games[index].coinsNeeded
                                style: theme.textTheme.headline3,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  decoration: const BoxDecoration(
                    color: Color(0xffFFDCD4),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                  ),
                ),
              ],
            ),
            provider.games[index].isLocked! //provider.games[index].isLocked
                ? Container(
                    width: 256.w,
                    height: 377.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: Colors.black.withOpacity(0.5),
                    ),
                  )
                : const SizedBox(),
            provider.games[index].isLocked! //provider.games[index].isLocked
                ? Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset('assets/images/game_lock.png'),
                  )
                : const SizedBox(),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        DefaultElevatedButton(
          onPressed: () {
            provider.setGameSelected(provider.games[index]);
            provider.checkGame(ShowDialog);
          },
          child: Text(
            provider.games[index].isLocked!
                ? 'شراء اللعبة'
                : 'إلعب الآن', //provider.games[index].isLocked
            style: theme.textTheme.headline3
                ?.merge(const TextStyle(color: Colors.white)),
          ),
          size: Size(216.w, 49.h),
          radius: 20.r,
          top: 5,
          boxShadow: BoxShadow(
            offset: Offset(0.w, 3.h),
            color: const Color(0xB3074785),
            blurRadius: 6.r,
          ),
        )
      ],
    );
  }

  ShowDialog() {
    showDialog(
        context: _buildContext,
        barrierDismissible: true,
        barrierColor: const Color(0xBF000000),
        builder: (ctx) {
          provider.playEncourageAudio('assets/audio/تحتاج لمزيد.mp3');
          return Column(
            children: [
              SizedBox(
                height: 260.h,
              ),
              UserCodeDialog(
                isForGame: true,
                onPressed: () {},
                code: '',
              )
            ],
          );
        });
  }
}
