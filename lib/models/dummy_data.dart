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
      exampleId: 'أ',
      img1: 'assets/images/carrot.png',
      img2: 'assets/images/peace.png',
      img3: 'assets/images/crown.png',
      isLetterExample: true,
    ),
    Example(
      exampleId: 'ب',
      img1: 'assets/images/happy.png',
      img2: 'assets/images/lion.png',
      img3: 'assets/images/numbers.png',
      isLetterExample: true,
    ),
    Example(
      exampleId: 'ت',
      img1: 'assets/images/lion.png',
      img2: 'assets/images/games.png',
      img3: 'assets/images/video.png',
      isLetterExample: true,
    ),
    Example(
      exampleId: 'ث',
      img1: 'assets/images/operations.png',
      img2: 'assets/images/letters.png',
      img3: 'assets/images/numbers.png',
      isLetterExample: true,
    ),
    Example(
      exampleId: 'ج',
      img1: 'assets/images/operations.png',
      img2: 'assets/images/letters.png',
      img3: 'assets/images/numbers.png',
      isLetterExample: true,
    ),
    Example(
      exampleId: 'ح',
      img1: 'assets/images/operations.png',
      img2: 'assets/images/letters.png',
      img3: 'assets/images/numbers.png',
      isLetterExample: true,
    ),
    Example(
      exampleId: 'خ',
      img1: 'assets/images/operations.png',
      img2: 'assets/images/letters.png',
      img3: 'assets/images/numbers.png',
      isLetterExample: true,
    ),
    Example(
      exampleId: 'د',
      img1: 'assets/images/operations.png',
      img2: 'assets/images/letters.png',
      img3: 'assets/images/numbers.png',
      isLetterExample: true,
    ),
    Example(
      exampleId: 'ذ',
      img1: 'assets/images/operations.png',
      img2: 'assets/images/letters.png',
      img3: 'assets/images/numbers.png',
      isLetterExample: true,
    ),
    Example(
      exampleId: 'ر',
      img1: 'assets/images/operations.png',
      img2: 'assets/images/letters.png',
      img3: 'assets/images/numbers.png',
      isLetterExample: true,
    ),
    Example(
      exampleId: 'ز',
      img1: 'assets/images/operations.png',
      img2: 'assets/images/letters.png',
      img3: 'assets/images/numbers.png',
      isLetterExample: true,
    ),
    Example(
      exampleId: 'س',
      img1: 'assets/images/operations.png',
      img2: 'assets/images/letters.png',
      img3: 'assets/images/numbers.png',
      isLetterExample: true,
    ),
    Example(
      exampleId: 'ش',
      img1: 'assets/images/operations.png',
      img2: 'assets/images/letters.png',
      img3: 'assets/images/numbers.png',
      isLetterExample: true,
    ),
    Example(
      exampleId: 'ص',
      img1: 'assets/images/operations.png',
      img2: 'assets/images/letters.png',
      img3: 'assets/images/numbers.png',
      isLetterExample: true,
    ),
    Example(
      exampleId: 'ض',
      img1: 'assets/images/operations.png',
      img2: 'assets/images/letters.png',
      img3: 'assets/images/numbers.png',
      isLetterExample: true,
    ),
    Example(
      exampleId: 'ط',
      img1: 'assets/images/operations.png',
      img2: 'assets/images/letters.png',
      img3: 'assets/images/numbers.png',
      isLetterExample: true,
    ),
    Example(
      exampleId: 'ظ',
      img1: 'assets/images/operations.png',
      img2: 'assets/images/letters.png',
      img3: 'assets/images/numbers.png',
      isLetterExample: true,
    ),
    Example(
      exampleId: 'ع',
      img1: 'assets/images/operations.png',
      img2: 'assets/images/letters.png',
      img3: 'assets/images/numbers.png',
      isLetterExample: true,
    ),
    Example(
      exampleId: 'غ',
      img1: 'assets/images/operations.png',
      img2: 'assets/images/letters.png',
      img3: 'assets/images/numbers.png',
      isLetterExample: true,
    ),
    Example(
      exampleId: 'ف',
      img1: 'assets/images/operations.png',
      img2: 'assets/images/letters.png',
      img3: 'assets/images/numbers.png',
      isLetterExample: true,
    ),
    Example(
      exampleId: 'ق',
      img1: 'assets/images/operations.png',
      img2: 'assets/images/letters.png',
      img3: 'assets/images/numbers.png',
      isLetterExample: true,
    ),
    Example(
      exampleId: 'ك',
      img1: 'assets/images/operations.png',
      img2: 'assets/images/letters.png',
      img3: 'assets/images/numbers.png',
      isLetterExample: true,
    ),
    Example(
      exampleId: 'ل',
      img1: 'assets/images/operations.png',
      img2: 'assets/images/letters.png',
      img3: 'assets/images/numbers.png',
      isLetterExample: true,
    ),
    Example(
      exampleId: 'م',
      img1: 'assets/images/operations.png',
      img2: 'assets/images/letters.png',
      img3: 'assets/images/numbers.png',
      isLetterExample: true,
    ),
    Example(
      exampleId: 'ن',
      img1: 'assets/images/operations.png',
      img2: 'assets/images/letters.png',
      img3: 'assets/images/numbers.png',
      isLetterExample: true,
    ),
    Example(
      exampleId: 'ه',
      img1: 'assets/images/operations.png',
      img2: 'assets/images/letters.png',
      img3: 'assets/images/numbers.png',
      isLetterExample: true,
    ),
    Example(
      exampleId: 'و',
      img1: 'assets/images/operations.png',
      img2: 'assets/images/letters.png',
      img3: 'assets/images/numbers.png',
      isLetterExample: true,
    ),
    Example(
      exampleId: 'ي',
      img1: 'assets/images/operations.png',
      img2: 'assets/images/letters.png',
      img3: 'assets/images/numbers.png',
      isLetterExample: true,
    ),
    Example(
      exampleId: '١',
      img1: 'assets/images/img1.png',
      img2: 'assets/images/img11.png',
      img3: 'assets/images/img111.png',
      isLetterExample: false,
    ),
    Example(
      exampleId: '٢',
      img1: 'assets/images/img2.png',
      img2: 'assets/images/img22.png',
      img3: 'assets/images/img222.png',
      isLetterExample: false,
    ),
    Example(
      exampleId: '٣',
      img1: 'assets/images/img3.png',
      img2: 'assets/images/img33.png',
      img3: 'assets/images/img333.png',
      isLetterExample: false,
    ),
    Example(
      exampleId: '٤',
      img1: 'assets/images/img3.png',
      img2: 'assets/images/img33.png',
      img3: 'assets/images/img333.png',
      isLetterExample: false,
    ),
    Example(
      exampleId: '٥',
      img1: 'assets/images/img3.png',
      img2: 'assets/images/img33.png',
      img3: 'assets/images/img333.png',
      isLetterExample: false,
    ),
    Example(
      exampleId: '٦',
      img1: 'assets/images/img3.png',
      img2: 'assets/images/img33.png',
      img3: 'assets/images/img333.png',
      isLetterExample: false,
    ),
    Example(
      exampleId: '٧',
      img1: 'assets/images/img3.png',
      img2: 'assets/images/img33.png',
      img3: 'assets/images/img333.png',
      isLetterExample: false,
    ),
    Example(
      exampleId: '٨',
      img1: 'assets/images/img3.png',
      img2: 'assets/images/img33.png',
      img3: 'assets/images/img333.png',
      isLetterExample: false,
    ),
    Example(
      exampleId: '٩',
      img1: 'assets/images/img3.png',
      img2: 'assets/images/img33.png',
      img3: 'assets/images/img333.png',
      isLetterExample: false,
    ),
    Example(
      exampleId: '١٠',
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
      shape: '١',
      id_example: '١',
      isLocked: false,
      imageUrl: 'assets/images/flower1.png',
    ),
    Number(
      name: 'رقم اثنان',
      sound: 'assets/audio/music.mp3',
      shape: '٢',
      id_example: '٢',
      isLocked: true,
      imageUrl: 'assets/images/flower1.png',
    ),
    Number(
      name: 'رقم ثلاثة',
      sound: 'assets/audio/music.mp3',
      shape: '٣',
      id_example: '٣',
      isLocked: true,
      imageUrl: 'assets/images/flower1.png',
    ),
    Number(
      name: 'رقم أربعة',
      sound: 'assets/audio/music.mp3',
      shape: '٤',
      id_example: '٤',
      isLocked: true,
      imageUrl: 'assets/images/flower1.png',
    ),
    Number(
      name: 'رقم خمسة',
      sound: 'assets/audio/music.mp3',
      shape: '٥',
      id_example: '٥',
      isLocked: true,
      imageUrl: 'assets/images/flower1.png',
    ),
    Number(
      name: 'رقم ستة',
      sound: 'assets/audio/music.mp3',
      shape: '٦',
      id_example: '٦',
      isLocked: true,
      imageUrl: 'assets/images/flower1.png',
    ),
    Number(
      name: 'رقم سبعة',
      sound: 'assets/audio/music.mp3',
      shape: '٧',
      id_example: '٧',
      isLocked: true,
      imageUrl: 'assets/images/flower1.png',
    ),
    Number(
      name: 'رقم ثمانية',
      sound: 'assets/audio/music.mp3',
      shape: '٨',
      id_example: '٨',
      isLocked: true,
      imageUrl: 'assets/images/flower1.png',
    ),
    Number(
      name: 'رقم تسعة',
      sound: 'assets/audio/music.mp3',
      shape: '٩',
      id_example: '٩',
      isLocked: true,
      imageUrl: 'assets/images/flower1.png',
    ),
    Number(
      name: 'رقم عشرة',
      sound: 'assets/audio/music.mp3',
      shape: '١٠',
      id_example: '١٠',
      isLocked: true,
      imageUrl: 'assets/images/flower1.png',
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
      isLocked: true,
    ),
    Letter(
      name: 'حرف الثاء',
      sound: 'assets/audio/music.mp3',
      song: 'assets/audio/music.mp3',
      shape: 'ث',
      id_example: 'ث',
      isLocked: true,
    ),
    Letter(
      name: 'حرف الجيم',
      sound: 'assets/audio/music.mp3',
      song: 'assets/audio/music.mp3',
      shape: 'ج',
      id_example: 'ج',
      isLocked: true,
    ),
    Letter(
      name: 'حرف الحاء',
      sound: 'assets/audio/music.mp3',
      song: 'assets/audio/music.mp3',
      shape: 'ح',
      id_example: 'ح',
      isLocked: true,
    ),
    Letter(
      name: 'حرف الخاء',
      sound: 'assets/audio/music.mp3',
      song: 'assets/audio/music.mp3',
      shape: 'خ',
      id_example: 'خ',
      isLocked: true,
    ),
    Letter(
      name: 'حرف الدال',
      sound: 'assets/audio/music.mp3',
      song: 'assets/audio/music.mp3',
      shape: 'د',
      id_example: 'د',
      isLocked: true,
    ),
    Letter(
      name: 'حرف الذال',
      sound: 'assets/audio/music.mp3',
      song: 'assets/audio/music.mp3',
      shape: 'ذ',
      id_example: 'ذ',
      isLocked: true,
    ),
    Letter(
      name: 'حرف الراء',
      sound: 'assets/audio/music.mp3',
      song: 'assets/audio/music.mp3',
      shape: 'ر',
      id_example: 'ر',
      isLocked: true,
    ),
    Letter(
      name: 'حرف الزاي',
      sound: 'assets/audio/music.mp3',
      song: 'assets/audio/music.mp3',
      shape: 'ز',
      id_example: 'ز',
      isLocked: true,
    ),
    Letter(
      name: 'حرف السين',
      sound: 'assets/audio/music.mp3',
      song: 'assets/audio/music.mp3',
      shape: 'س',
      id_example: 'س',
      isLocked: true,
    ),
    Letter(
      name: 'حرف الشين',
      sound: 'assets/audio/music.mp3',
      song: 'assets/audio/music.mp3',
      shape: 'ش',
      id_example: 'ش',
      isLocked: true,
    ),
    Letter(
      name: 'حرف الصاد',
      sound: 'assets/audio/music.mp3',
      song: 'assets/audio/music.mp3',
      shape: 'ص',
      id_example: 'ص',
      isLocked: true,
    ),
    Letter(
      name: 'حرف الضاد',
      sound: 'assets/audio/music.mp3',
      song: 'assets/audio/music.mp3',
      shape: 'ض',
      id_example: 'ض',
      isLocked: true,
    ),
    Letter(
      name: 'حرف الطاء',
      sound: 'assets/audio/music.mp3',
      song: 'assets/audio/music.mp3',
      shape: 'ط',
      id_example: 'ط',
      isLocked: true,
    ),
    Letter(
      name: 'حرف الظاء',
      sound: 'assets/audio/music.mp3',
      song: 'assets/audio/music.mp3',
      shape: 'ظ',
      id_example: 'ظ',
      isLocked: true,
    ),
    Letter(
      name: 'حرف العين',
      sound: 'assets/audio/music.mp3',
      song: 'assets/audio/music.mp3',
      shape: 'ع',
      id_example: 'ع',
      isLocked: true,
    ),
    Letter(
      name: 'حرف الغين',
      sound: 'assets/audio/music.mp3',
      song: 'assets/audio/music.mp3',
      shape: 'غ',
      id_example: 'غ',
      isLocked: true,
    ),
    Letter(
      name: 'حرف الفاء',
      sound: 'assets/audio/music.mp3',
      song: 'assets/audio/music.mp3',
      shape: 'ف',
      id_example: 'ف',
      isLocked: true,
    ),
    Letter(
      name: 'حرف القاف',
      sound: 'assets/audio/music.mp3',
      song: 'assets/audio/music.mp3',
      shape: 'ق',
      id_example: 'ق',
      isLocked: true,
    ),
    Letter(
      name: 'حرف الكاف',
      sound: 'assets/audio/music.mp3',
      song: 'assets/audio/music.mp3',
      shape: 'ك',
      id_example: 'ك',
      isLocked: true,
    ),
    Letter(
      name: 'حرف اللام',
      sound: 'assets/audio/music.mp3',
      song: 'assets/audio/music.mp3',
      shape: 'ل',
      id_example: 'ل',
      isLocked: true,
    ),
    Letter(
      name: 'حرف الميم',
      sound: 'assets/audio/music.mp3',
      song: 'assets/audio/music.mp3',
      shape: 'م',
      id_example: 'م',
      isLocked: true,
    ),
    Letter(
      name: 'حرف النون',
      sound: 'assets/audio/music.mp3',
      song: 'assets/audio/music.mp3',
      shape: 'ن',
      id_example: 'ن',
      isLocked: true,
    ),
    Letter(
      name: 'حرف الهاء',
      sound: 'assets/audio/music.mp3',
      song: 'assets/audio/music.mp3',
      shape: 'ه',
      id_example: 'ه',
      isLocked: true,
    ),
    Letter(
      name: 'حرف الواو',
      sound: 'assets/audio/music.mp3',
      song: 'assets/audio/music.mp3',
      shape: 'و',
      id_example: 'و',
      isLocked: true,
    ),
    Letter(
      name: 'حرف الياء',
      sound: 'assets/audio/music.mp3',
      song: 'assets/audio/music.mp3',
      shape: 'ي',
      id_example: 'ي',
      isLocked: true,
    )
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
          AppRouter.router
              .pushNamedWithReplacementFunction(VideosScreen.routeName);
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
