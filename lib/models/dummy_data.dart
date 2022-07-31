// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:yalla_njoom/models/kid.dart';
// import 'package:yalla_njoom/routers/app_router.dart';
// import 'package:yalla_njoom/screens/exercises_screen.dart';
// import 'package:yalla_njoom/screens/letters_screen.dart';
// import 'package:yalla_njoom/screens/numbers_screen.dart';
// import 'package:yalla_njoom/screens/operation_screen.dart';
// import 'package:yalla_njoom/screens/videos_screen.dart';
// import 'example.dart';
// import 'language.dart';

// /// be attentive if the pressFun was shared don't repeate it
// class DummyData {
//   DummyData._();
//   static DummyData dummyData = DummyData._();
//   Letter selectedLatter = Letter(
//     name: 'حرف الألف',
//     sound: 'assets/audio/music.mp3',
//     song: 'assets/audio/music.mp3',
//     shape: 'أ',
//     //imageUrl: 'assets/images/ألف.png',
//     isLocked: false,
//   );
//   // TODO: from provider
//   Example selectedExample = Example(
//     id: 'حرف الألف',
//     example1: 'assets/images/carrot.png',
//     example2: 'assets/images/peace.png',
//     example3: 'assets/images/bear.png',
//   ); // i will make method return the selected example from the table based on selected letter

//   List<Example> otherExamples = [
//     Example(
//       id: 'حرف الباء',
//       example1: 'assets/images/happy',
//       example2: 'assets/images/lion',
//       example3: 'assets/images/duck',
//     ),
//     Example(
//       id: 'حرف التاء',
//       example1: 'assets/images/bird',
//       example2: 'assets/images/games',
//       example3: 'assets/images/video',
//     ),
//     Example(
//       id: 'حرف الثاء',
//       example1: 'assets/images/operations',
//       example2: 'assets/images/letters',
//       example3: 'assets/images/numbers',
//     ),
//   ];
//   List<Kid> kids = [
//     Kid(
//       name: 'غزل الحاج',
//       imageUrl: 'assets/images/lion.png',
//       code: 'A 10',
//     ),
//     Kid(
//       name: 'ياسمين عثمان ',
//       imageUrl: 'assets/images/lion.png',
//       code: 'A 13',
//     ),
//     Kid(
//       name: 'ياسمين عثمان ',
//       imageUrl: 'assets/images/lion.png',
//       code: 'A 13',
//     )
//   ];
//   List<Number> numbers = [
//     Number(
//       name: 'رقم واحد',
//       audio: 'assets/audio/music.mp3',
//       shape: '1',
//       // imageUrl: 'assets/images/1.png',
//       isLocked: false,
//     ),
//     Number(
//       name: 'رقم اثنان',
//       audio: 'assets/audio/music.mp3',
//       shape: '2',
//       // imageUrl: 'assets/images/1.png',
//       isLocked: true,
//     ),
//     Number(
//       name: 'رقم ثلاثة',
//       audio: 'assets/audio/music.mp3',
//       shape: '3',
//       //imageUrl: 'assets/images/1.png',
//       isLocked: true,
//     ),
//   ];
//   List<Letter> letters = [
//     Letter(
//       name: 'حرف الألف',
//       sound: 'assets/audio/music.mp3',
//       song: 'assets/audio/music.mp3',
//       shape: 'أ',
//       //imageUrl: 'assets/images/ألف.png',
//       isLocked: false,
//     ),
//     Letter(
//       name: 'حرف الباء',
//       sound: 'assets/audio/music.mp3',
//       song: 'assets/audio/music.mp3',
//       shape: 'ب',
//       //imageUrl: 'assets/images/باء.png',
//       isLocked: true,
//     ),
//     Letter(
//       name: 'حرف التاء',
//       sound: 'assets/audio/music.mp3',
//       song: 'assets/audio/music.mp3',
//       shape: 'ت',
//       //imageUrl: 'assets/images/ألف.png',
//       isLocked: true,
//     ),
//     Letter(
//       name: 'حرف الألف',
//       sound: 'assets/audio/music.mp3',
//       song: 'assets/audio/music.mp3',
//       shape: 'أ',
//       //imageUrl: 'assets/images/ألف.png',
//       isLocked: false,
//     ),
//     Letter(
//       name: 'حرف الباء',
//       sound: 'assets/audio/music.mp3',
//       song: 'assets/audio/music.mp3',
//       shape: 'ب',
//       //imageUrl: 'assets/images/باء.png',
//       isLocked: true,
//     ),
//     Letter(
//       name: 'حرف التاء',
//       sound: 'assets/audio/music.mp3',
//       song: 'assets/audio/music.mp3',
//       shape: 'ت',
//       //imageUrl: 'assets/images/ألف.png',
//       isLocked: true,
//     ),
//     Letter(
//       name: 'حرف الألف',
//       sound: 'assets/audio/music.mp3',
//       song: 'assets/audio/music.mp3',
//       shape: 'أ',
//       //imageUrl: 'assets/images/ألف.png',
//       isLocked: false,
//     ),
//     Letter(
//       name: 'حرف الباء',
//       sound: 'assets/audio/music.mp3',
//       song: 'assets/audio/music.mp3',
//       shape: 'ب',
//       //imageUrl: 'assets/images/باء.png',
//       isLocked: true,
//     ),
//     Letter(
//       name: 'حرف التاء',
//       sound: 'assets/audio/music.mp3',
//       song: 'assets/audio/music.mp3',
//       shape: 'ت',
//       //imageUrl: 'assets/images/ألف.png',
//       isLocked: true,
//     ),
//     Letter(
//       name: 'حرف الألف',
//       sound: 'assets/audio/music.mp3',
//       song: 'assets/audio/music.mp3',
//       shape: 'أ',
//       //imageUrl: 'assets/images/ألف.png',
//       isLocked: false,
//     ),
//     Letter(
//       name: 'حرف الباء',
//       sound: 'assets/audio/music.mp3',
//       song: 'assets/audio/music.mp3',
//       shape: 'ب',
//       //imageUrl: 'assets/images/باء.png',
//       isLocked: true,
//     ),
//     Letter(
//       name: 'حرف التاء',
//       sound: 'assets/audio/music.mp3',
//       song: 'assets/audio/music.mp3',
//       shape: 'ت',
//       //imageUrl: 'assets/images/ألف.png',
//       isLocked: true,
//     ),
//     Letter(
//       name: 'حرف الألف',
//       sound: 'assets/audio/music.mp3',
//       song: 'assets/audio/music.mp3',
//       shape: 'أ',
//       //imageUrl: 'assets/images/ألف.png',
//       isLocked: false,
//     ),
//     Letter(
//       name: 'حرف الباء',
//       sound: 'assets/audio/music.mp3',
//       song: 'assets/audio/music.mp3',
//       shape: 'ب',
//       //imageUrl: 'assets/images/باء.png',
//       isLocked: true,
//     ),
//     Letter(
//       name: 'حرف التاء',
//       sound: 'assets/audio/music.mp3',
//       song: 'assets/audio/music.mp3',
//       shape: 'ت',
//       //imageUrl: 'assets/images/ألف.png',
//       isLocked: true,
//     ),
//   ];
//   List<Example> examples = [
//     /* Example(
//       example1: 'assets/images/num1.png',
//       example2: 'assets/images/num11.png',
//       example3: 'assets/images/num111.png',
//     ),
//     Example(
//       example1: 'assets/images/num2.png',
//       example2: 'assets/images/num222.png',
//       example3: 'assets/images/num22.png',
//     ),*/
//   ];
//   List<TypeEducation> operationTypes = [
//     TypeEducation(
//         image: 'assets/images/plus_op.png',
//         name: 'عمليةالجمع',
//         bgColor: const Color(0xFF074785),
//         pressFun: () {}),
//     TypeEducation(
//         image: 'assets/images/minus_op.png',
//         name: 'عملية الطرح',
//         bgColor: const Color(0xFFFFA4AC),
//         pressFun: () {}),
//     TypeEducation(
//         image: 'assets/images/exer_img.png',
//         name: 'مسائل عامة',
//         bgColor: const Color(0xFF2FB0FD),
//         pressFun: () {
//           AppRouter.router
//               .pushNamedWithReplacementFunction(ExercisesScreen.routeName, [
//             Example(
//               id: 'حرف الباء',
//               example1: 'assets/images/happy.png',
//               example2: 'assets/images/lion.png',
//               example3: 'assets/images/duck.png',
//             ),
//             Example(
//               id: 'حرف التاء',
//               example1: 'assets/images/bird.png',
//               example2: 'assets/images/games.png',
//               example3: 'assets/images/video.png',
//             ),
//             Example(
//               id: 'حرف الثاء',
//               example1: 'assets/images/operations.png',
//               example2: 'assets/images/letters.png',
//               example3: 'assets/images/numbers.png',
//             ),
//           ]);
//         }),
//   ];
//   List<TypeEducation> types = [
//     TypeEducation(
//         image: 'assets/images/letters.png',
//         name: 'الحروف',
//         bgColor: const Color(0xFF074785),
//         pressFun: () {
//           AppRouter.router
//               .pushNamedWithReplacementFunction(LettersScreen.routeName);
//         }),
//     TypeEducation(
//         image: 'assets/images/numbers.png',
//         name: 'الأرقام',
//         bgColor: const Color(0xFFFFA4AC),
//         pressFun: () {
//           AppRouter.router
//               .pushNamedWithReplacementFunction(NumbersScreen.routeName);
//         }),
//     TypeEducation(
//         image: 'assets/images/operations.png',
//         name: 'العمليات الحسابية',
//         bgColor: const Color(0xFF2FB0FD),
//         pressFun: () {
//           AppRouter.router
//               .pushNamedWithReplacementFunction(OperationScreen.routeName);
//         }),
//     TypeEducation(
//         image: 'assets/images/video.png',
//         name: 'فيديو',
//         bgColor: const Color(0xFFF1854F),
//         pressFun: () {
//           AppRouter.router.pushNamedFunction(VideosScreen.routeName);
//         }),
//     TypeEducation(
//         image: 'assets/images/games.png',
//         name: 'ألعاب',
//         bgColor: const Color(0xFFFFA4AC),
//         pressFun: () {}),
//   ];
//   List<String> giveImagesToShow() {
//     var random = Random();
//     var index1 = random.nextInt(otherExamples.length - 1);
//     var index2 = random.nextInt(otherExamples.length - 1);
//     // TODO: make it in best way
//     return [
//       otherExamples[index1].example1,
//       otherExamples[index2].example2,
//       selectedExample.example1
//     ];
//   }
// }

// class TypeEducation {
//   String image;
//   String name;
//   Color bgColor;
//   Function() pressFun;
//   TypeEducation(
//       {required this.image,
//       required this.name,
//       required this.bgColor,
//       required this.pressFun});
// }
import 'package:flutter/material.dart';
import 'package:yalla_njoom/routers/app_router.dart';
import 'package:yalla_njoom/screens/exercises_screen.dart';
import 'package:yalla_njoom/screens/games_screen.dart';
import 'package:yalla_njoom/screens/letters_screen.dart';
import 'package:yalla_njoom/screens/numbers_screen.dart';
import 'package:yalla_njoom/screens/operation_screen.dart';

import '../screens/videos_screen.dart';
import 'example.dart';
import 'game.dart';
import 'language.dart';

/// be attentive if the pressFun was shared don't repeate it
class DummyData {
  DummyData._();

  static DummyData dummyData = DummyData._();
  static const String videoUrl = 'url';
  static const String videoName = 'name';
  Letter selectedLatter = Letter(
    name: 'حرف الألف',
    shape: 'أ',
    sound: 'assets/audio/music.mp3',
    song: 'assets/audio/music.mp3',
    id_example: 'أ',
    isLocked: false,
  );
  List<Example> examples = [
    Example(
      id: 'أ',
      img1: 'assets/images/carrot.png',
      img2: 'assets/images/peace.png',
      img3: 'assets/images/crown.png',
      isLetterExample: true,
    ),
    Example(
      id: 'ب',
      img1: 'assets/images/happy.png',
      img2: 'assets/images/lion.png',
      img3: 'assets/images/numbers.png',
      isLetterExample: true,
    ),
    Example(
      id: 'ت',
      img1: 'assets/images/lion.png',
      img2: 'assets/images/games.png',
      img3: 'assets/images/video.png',
      isLetterExample: true,
    ),
    Example(
      id: 'ث',
      img1: 'assets/images/operations.png',
      img2: 'assets/images/letters.png',
      img3: 'assets/images/numbers.png',
      isLetterExample: true,
    ),
    Example(
      id: '1',
      img1: 'assets/images/img1.png',
      img2: 'assets/images/img11.png',
      img3: 'assets/images/img111.png',
      isLetterExample: false,
    ),
    Example(
      id: '2',
      img1: 'assets/images/img2.png',
      img2: 'assets/images/img22.png',
      img3: 'assets/images/img222.png',
      isLetterExample: false,
    ),
    Example(
      id: '3',
      img1: 'assets/images/img3.png',
      img2: 'assets/images/img33.png',
      img3: 'assets/images/img333.png',
      isLetterExample: false,
    ),
  ];
  List videos = [
    {
      videoUrl: 'https://www.youtube.com/watch?v=8_4_F8EunRI',
      videoName: 'الألوان'
    },
    {
      videoUrl: 'https://www.youtube.com/watch?v=b1RicSEcI2g',
      videoName: 'الحواس'
    },
    {
      videoUrl: 'https://www.youtube.com/watch?v=2vqZmpnTjbI',
      videoName: 'الخطوط'
    },
    {
      videoUrl: 'https://www.youtube.com/watch?v=LyzupN62MGA',
      videoName: 'الحروف'
    },
    {
      videoUrl: 'https://www.youtube.com/watch?v=uCYv55twbhE',
      videoName: 'الأرقام'
    },
  ];
  List<Game> games = [
    Game(
      gameId: 'com.iz.baby.games.kids.toddler.learning.shark.puzzle.game',
      gameName: ' العب مع قرش البحر',
      coinsNeeded: 120,
      gameImg: 'assets/images/game3.jpeg',
    ),
    Game(
      gameId: 'com.bimiboo.playandlearn',
      gameName: 'لعبة التعرف على الحيوانات',
      coinsNeeded: 500,
      gameImg: 'assets/images/game2.jpeg',
    ),
    Game(
      gameId: 'com.minimuffin.birthdaystories',
      gameName: 'لعبة المطابقة',
      coinsNeeded: 10,
      gameImg: 'assets/images/game4.jpeg',
    ), //isLocked: true
    Game(
      gameId:
          'com.bonbongame.kids.doodle.drawing.games.coloring.book.car.games',
      gameName: 'لعبة الرسم',
      coinsNeeded: 10,
      gameImg: 'assets/images/game5.jpeg',
    ),
    Game(
      gameId: 'com.bonbongame.learn.colors.and.shapes.kids.games',
      gameName: 'لعبة الأشكال الهندسية',
      coinsNeeded: 10,
      gameImg: 'assets/images/game6.jpeg',
    ),
    Game(
      gameId: 'com.rvappstudios.shapes.colors.toddler',
      gameName: 'لعبة التلوين',
      coinsNeeded: 10,
      gameImg: 'assets/images/game7.jpeg',
    ),
    Game(
      gameId: 'com.bimiboo.tunes',
      gameName: 'لعبة الموسيقى',
      coinsNeeded: 10,
      gameImg: 'assets/images/game8.jpeg',
    ),
    Game(
      gameId: 'com.minimuffin.birthdaystories',
      gameName: 'لعبة الألغاز',
      coinsNeeded: 10,
      gameImg: 'assets/images/game9.jpeg',
    ),
    Game(
      gameId: 'com.happytools.learning.kids.games',
      gameName: 'لعبة البطة',
      coinsNeeded: 10,
      gameImg: 'assets/images/game10.jpeg',
    ),
    Game(
      gameId: 'com.bubbleshooter.popbubbles.shootbubblesgames',
      gameName: 'لعبة الكرات',
      coinsNeeded: 10,
      gameImg: 'assets/images/game11.jpeg',
    ),
  ];

  //TODO: remove it
  /* late List<Example> lettersExample = examples.where((element) => element.isLetterExample).toList();
  late List<Example> numbersExample = examples.where((element) => !element.isLetterExample).toList();*/

  List<Number> numbers = [
    Number(
      name: 'رقم واحد',
      sound: 'assets/audio/music.mp3',
      shape: '1',
      id_example: '1',
      isLocked: false,
      imageUrl: 'assets/images/flower1',
    ),
    Number(
      name: 'رقم اثنان',
      sound: 'assets/audio/music.mp3',
      shape: '2',
      id_example: '2',
      isLocked: true,
      imageUrl: 'assets/images/flower1',
    ),
    Number(
      name: 'رقم ثلاثة',
      sound: 'assets/audio/music.mp3',
      shape: '3',
      id_example: '3',
      isLocked: true,
      imageUrl: 'assets/images/flower1',
    ),
  ];
  List<Letter> letters = [
    Letter(
      name: 'حرف الألف',
      sound: 'assets/audio/music.mp3',
      song: 'assets/audio/music.mp3',
      shape: 'أ',
      id_example: 'أ',
      isLocked: false,
    ),
    Letter(
      name: 'حرف الباء',
      sound: 'assets/audio/music.mp3',
      song: 'assets/audio/music.mp3',
      shape: 'ب',
      id_example: 'ب',
      //imageUrl: 'assets/images/باء.png',
      isLocked: true,
    ),
    Letter(
      name: 'حرف التاء',
      sound: 'assets/audio/music.mp3',
      song: 'assets/audio/music.mp3',
      shape: 'ت',
      id_example: 'ت',
      //imageUrl: 'assets/images/ألف.png',
      isLocked: true,
    ),
  ];

  List<TypeEducation> operationTypes = [
    TypeEducation(
        image: 'assets/images/plus_op.png',
        name: 'عمليةالجمع',
        bgColor: const Color(0xFF074785),
        pressFun: () {
          AppRouter.router.pushNamedWithReplacementFunction(
              ExercisesScreen.routeName, [true, false]);
        }),
    TypeEducation(
        image: 'assets/images/minus_op.png',
        name: 'عملية الطرح',
        bgColor: const Color(0xFFFFA4AC),
        pressFun: () {
          AppRouter.router.pushNamedWithReplacementFunction(
              ExercisesScreen.routeName, [false, false]);
        }),
    TypeEducation(
        image: 'assets/images/exer_img.png',
        name: 'مسائل عامة',
        bgColor: const Color(0xFF2FB0FD),
        pressFun: () {
          AppRouter.router.pushNamedWithReplacementFunction(
              ExercisesScreen.routeName, [false, true]);
        }),
  ];
  List<TypeEducation> types = [
    TypeEducation(
        image: 'assets/images/letters.png',
        name: 'الحروف',
        bgColor: const Color(0xFF074785),
        pressFun: () {
          AppRouter.router
              .pushNamedWithReplacementFunction(LettersScreen.routeName);
        }),
    TypeEducation(
        image: 'assets/images/numbers.png',
        name: 'الأرقام',
        bgColor: const Color(0xFFFFA4AC),
        pressFun: () {
          AppRouter.router
              .pushNamedWithReplacementFunction(NumbersScreen.routeName);
        }),
    TypeEducation(
        image: 'assets/images/operations.png',
        name: 'العمليات الحسابية',
        bgColor: const Color(0xFF2FB0FD),
        pressFun: () {
          AppRouter.router
              .pushNamedWithReplacementFunction(OperationScreen.routeName);
        }),
    TypeEducation(
        image: 'assets/images/video.png',
        name: 'فيديو',
        bgColor: const Color(0xFFF1854F),
        pressFun: () {
          /*AppRouter.router
              .pushNamedWithReplacementFunction(VideosScreen.routeName);*/
        }),
    TypeEducation(
        image: 'assets/images/games.png',
        name: 'ألعاب',
        bgColor: const Color(0xFFFFA4AC),
        pressFun: () {
          AppRouter.router
              .pushNamedWithReplacementFunction(GamesScreen.routeName);
        }),
  ];
/*List<String> giveImagesToShow() {
    var random = Random();
    var index1 = random.nextInt(examples.length - 1);
    var index2 = random.nextInt(examples.length - 1);
    // TODO: make it in best way
    return [
      examples[index1].img1,
      examples[index2].img2,
      selectedExample.img1
    ];
  }*/
}

class TypeEducation {
  String image;
  String name;
  Color bgColor;
  Function() pressFun;

  TypeEducation(
      {required this.image,
      required this.name,
      required this.bgColor,
      required this.pressFun});
}
