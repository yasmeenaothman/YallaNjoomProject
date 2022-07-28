import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_njoom/widgets/scaffold_with_background.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../models/my_flutter_app.dart';
import '../routers/app_router.dart';
import '../widgets/default_circular_avatar.dart';
import 'numbers_screen.dart';

class GamesScreen extends StatelessWidget {
  GamesScreen({Key? key}) : super(key: key);
  static const String routeName = 'GamesScreen';
  static const String gameUrl = 'url';
  static const String gameName = 'name';
  static const String coinsNeeded = 'coins';
  static const String gameImg = 'img';
  static const String isLocked = 'isLocked';
  List games = [
    {
      gameUrl: 'https://www.youtube.com/watch?v=8_4_F8EunRI',
      gameName: 'لعبة البطيخ',
      coinsNeeded: '120',
      gameImg: 'assets/images/nico.jpg',
      isLocked: false
    },
    {
      gameUrl: 'https://www.youtube.com/watch?v=b1RicSEcI2g',
      gameName: 'لعبة الشمام',
      coinsNeeded: '500',
      gameImg: 'assets/images/exer_img.png',
      isLocked: true
    },
    {
      gameUrl: 'https://www.youtube.com/watch?v=2vqZmpnTjbI',
      gameName: 'لعبة السيارات',
      coinsNeeded: '0',
      gameImg: 'assets/images/games.png',
      isLocked: true
    },
  ];
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
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
              'اختر اللعبة التي تحبها',
              softWrap: true,
              textDirection: TextDirection.rtl,
              style: theme.textTheme.headline3!.copyWith(fontSize: 24.sp),
            ),
          ),
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) {
                return _buildGameContainer(theme, index);
              }),
              itemCount: 3,
              separatorBuilder: (context, index) {
                return SizedBox(width: 20.w);
              },
            ),
          ),
        ],
      ),
    ));
  }

  _buildGameContainer(ThemeData theme, int index) {
    return GestureDetector(
      onTap: () {
        //TODO: USING THE URL  GO TO THE SPECIFIC GAME BY PLAY STORE
        //TODO: games[index][gameUrl]
      },
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                height: 279.h,
                width: 256.w,
                child: Image.asset(
                  games[index][gameImg],
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
                        games[index][gameName],
                        style: theme.textTheme.headline3,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/coin.png'),
                          SizedBox(width: 10.w),
                          Text(
                            '${games[index][coinsNeeded]} ذهبية',
                            style: theme.textTheme.headline3,
                          ),
                        ],
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
          games[index][isLocked]
              ? Container(
                  width: 256.w,
                  height: 377.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: Colors.black.withOpacity(0.5),
                  ),
                )
              : const SizedBox(),
          games[index][isLocked]
              ? Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset('assets/images/game_lock.png'),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
