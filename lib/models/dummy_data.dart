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
      img1: 'assets/images/أ.png',
      img2: 'assets/images/أأ.png',
      img3: 'assets/images/أأأ.png',
      isLetterExample: true,
    ),
    Example(
      exampleId: 'ب',
      img1: 'assets/images/ب.png',
      img2: 'assets/images/ب_ب.png',
      img3: 'assets/images/ب ب ب.png',
      isLetterExample: true,
    ),
    Example(
      exampleId: 'ت',
      img1: 'assets/images/ت.png',
      img2: 'assets/images/ت ت.png',
      img3: 'assets/images/ت ت ت.png',
      isLetterExample: true,
    ),
    Example(
      exampleId: 'ث',
      img1: 'assets/images/ث.png',
      img2: 'assets/images/ث ث.png',
      img3: 'assets/images/ث ث ث.png',
      isLetterExample: true,
    ),
    Example(
      exampleId: 'ج',
      img1: 'assets/images/ج.png',
      img2: 'assets/images/ج ج.png',
      img3: 'assets/images/ج ج ج.png',
      isLetterExample: true,
    ),
    Example(
      exampleId: 'ح',
      img1: 'assets/images/ح.png',
      img2: 'assets/images/ح ح.png',
      img3: 'assets/images/ح ح ح.png',
      isLetterExample: true,
    ),
    Example(
      exampleId: 'خ',
      img1: 'assets/images/خ.png',
      img2: 'assets/images/خ خ.png',
      img3: 'assets/images/خ خ خ.png',
      isLetterExample: true,
    ),
    Example(
      exampleId: 'د',
      img1: 'assets/images/د.png',
      img2: 'assets/images/د د.png',
      img3: 'assets/images/ددد.png',
      isLetterExample: true,
    ),
    Example(
      exampleId: 'ذ',
      img1: 'assets/images/ذ.png',
      img2: 'assets/images/ذذ.png',
      img3: 'assets/images/ذذذ.png',
      isLetterExample: true,
    ),
    Example(
      exampleId: 'ر',
      img1: 'assets/images/ر.png',
      img2: 'assets/images/رر.png',
      img3: 'assets/images/ررر.png',
      isLetterExample: true,
    ),
    Example(
      exampleId: 'ز',
      img1: 'assets/images/ز.png',
      img2: 'assets/images/زز.png',
      img3: 'assets/images/ززز.png',
      isLetterExample: true,
    ),
    Example(
      exampleId: 'س',
      img1: 'assets/images/س.png',
      img2: 'assets/images/س س.png',
      img3: 'assets/images/س س س.png',
      isLetterExample: true,
    ),
    Example(
      exampleId: 'ش',
      img1: 'assets/images/ش.png',
      img2: 'assets/images/ش ش.png',
      img3: 'assets/images/ش ش ش.png',
      isLetterExample: true,
    ),
    Example(
      exampleId: 'ص',
      img1: 'assets/images/ص.png',
      img2: 'assets/images/ص ص.png',
      img3: 'assets/images/ص ص ص.png',
      isLetterExample: true,
    ),
    Example(
      exampleId: 'ض',
      img1: 'assets/images/ض.png',
      img2: 'assets/images/ض ض.png',
      img3: 'assets/images/ض ض ض.png',
      isLetterExample: true,
    ),
    Example(
      exampleId: 'ط',
      img1: 'assets/images/ط.png',
      img2: 'assets/images/ط ط.png',
      img3: 'assets/images/ط ط ط.png',
      isLetterExample: true,
    ),
    Example(
      exampleId: 'ظ',
      img1: 'assets/images/ظ.png',
      img2: 'assets/images/ظ ظ.png',
      img3: 'assets/images/ظ ظ ظ.png',
      isLetterExample: true,
    ),
    Example(
      exampleId: 'ع',
      img1: 'assets/images/ع.png',
      img2: 'assets/images/ع ع.png',
      img3: 'assets/images/ع ع ع.png',
      isLetterExample: true,
    ),
    Example(
      exampleId: 'غ',
      img1: 'assets/images/غ.png',
      img2: 'assets/images/غ غ.png',
      img3: 'assets/images/غ غ غ.png',
      isLetterExample: true,
    ),
    Example(
      exampleId: 'ف',
      img1: 'assets/images/ف.png',
      img2: 'assets/images/ف ف.png',
      img3: 'assets/images/ف ف ف.png',
      isLetterExample: true,
    ),
    Example(
      exampleId: 'ق',
      img1: 'assets/images/ق.png',
      img2: 'assets/images/ق ق.png',
      img3: 'assets/images/ق ق ق.png',
      isLetterExample: true,
    ),
    Example(
      exampleId: 'ك',
      img1: 'assets/images/ك.png',
      img2: 'assets/images/ك ك.png',
      img3: 'assets/images/ك ك ك.png',
      isLetterExample: true,
    ),
    Example(
      exampleId: 'ل',
      img1: 'assets/images/ل.png',
      img2: 'assets/images/ل ل.png',
      img3: 'assets/images/ل ل ل.png',
      isLetterExample: true,
    ),
    Example(
      exampleId: 'م',
      img1: 'assets/images/م.png',
      img2: 'assets/images/م م.png',
      img3: 'assets/images/م م م.png',
      isLetterExample: true,
    ),
    Example(
      exampleId: 'ن',
      img1: 'assets/images/ن.png',
      img2: 'assets/images/ن ن.png',
      img3: 'assets/images/ن ن ن.jpg',
      isLetterExample: true,
    ),
    Example(
      exampleId: 'ه',
      img1: 'assets/images/ه.png',
      img2: 'assets/images/ه ه.png',
      img3: 'assets/images/ه ه ه.png',
      isLetterExample: true,
    ),
    Example(
      exampleId: 'و',
      img1: 'assets/images/و.png',
      img2: 'assets/images/وو.png',
      img3: 'assets/images/ووو.png',
      isLetterExample: true,
    ),
    Example(
      exampleId: 'ي',
      img1: 'assets/images/ي.png',
      img2: 'assets/images/ي ي.png',
      img3: 'assets/images/ي ي ي.jpg',
      isLetterExample: true,
    ),
    Example(
      exampleId: '1',
      img1: 'assets/images/img1.png',
      img2: 'assets/images/img11.png',
      img3: 'assets/images/img111.png',
      isLetterExample: false,
    ),
    Example(
      exampleId: '2',
      img1: 'assets/images/img2.png',
      img2: 'assets/images/img22.png',
      img3: 'assets/images/img222.png',
      isLetterExample: false,
    ),
    Example(
      exampleId: '3',
      img1: 'assets/images/img3.png',
      img2: 'assets/images/img33.png',
      img3: 'assets/images/img333.png',
      isLetterExample: false,
    ),
    Example(
      exampleId: '4',
      img1: 'assets/images/img4.png',
      img2: 'assets/images/img44.png',
      img3: 'assets/images/img444.png',
      isLetterExample: false,
    ),
    Example(
      exampleId: '5',
      img1: 'assets/images/img5.png',
      img2: 'assets/images/img55.png',
      img3: 'assets/images/img555.png',
      isLetterExample: false,
    ),
    Example(
      exampleId: '6',
      img1: 'assets/images/img6.png',
      img2: 'assets/images/img66.png',
      img3: 'assets/images/img666.png',
      isLetterExample: false,
    ),
    Example(
      exampleId: '7',
      img1: 'assets/images/img7.png',
      img2: 'assets/images/img77.png',
      img3: 'assets/images/img777.png',
      isLetterExample: false,
    ),
    Example(
      exampleId: '8',
      img1: 'assets/images/img8.png',
      img2: 'assets/images/img88.png',
      img3: 'assets/images/img888.png',
      isLetterExample: false,
    ),
    Example(
      exampleId: '9',
      img1: 'assets/images/img9.png',
      img2: 'assets/images/img99.png',
      img3: 'assets/images/img999.png',
      isLetterExample: false,
    ),
    Example(
      exampleId: '10',
      img1: 'assets/images/img10.png',
      img2: 'assets/images/img1010.png',
      img3: 'assets/images/img101010.png',
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
      coinsNeeded: 20,
      gameImg: 'assets/images/game4.jpeg',
    ), //isLocked: true
    Game(
      gameId:
          'com.bonbongame.kids.doodle.drawing.games.coloring.book.car.games',
      gameName: 'لعبة الرسم',
      coinsNeeded: 5,
      gameImg: 'assets/images/game5.jpeg',
    ),
    Game(
      gameId: 'com.bonbongame.learn.colors.and.shapes.kids.games',
      gameName: 'لعبة الأشكال الهندسية',
      coinsNeeded: 150,
      gameImg: 'assets/images/game6.jpeg',
    ),
    Game(
      gameId: 'com.rvappstudios.shapes.colors.toddler',
      gameName: 'لعبة التلوين',
      coinsNeeded: 30,
      gameImg: 'assets/images/game7.jpeg',
    ),
    Game(
      gameId: 'com.bimiboo.tunes',
      gameName: 'لعبة الموسيقى',
      coinsNeeded: 50,
      gameImg: 'assets/images/game8.jpeg',
    ),
    Game(
      gameId: 'com.minimuffin.birthdaystories',
      gameName: 'لعبة الألغاز',
      coinsNeeded: 600,
      gameImg: 'assets/images/game9.jpeg',
    ),
    Game(
      gameId: 'com.happytools.learning.kids.games',
      gameName: 'لعبة البطة',
      coinsNeeded: 70,
      gameImg: 'assets/images/game10.jpeg',
    ),
    Game(
      gameId: 'com.bubbleshooter.popbubbles.shootbubblesgames',
      gameName: 'لعبة الكرات',
      coinsNeeded: 180,
      gameImg: 'assets/images/game11.jpeg',
    ),
  ];
  //TODO: remove it
  /* late List<Example> lettersExample = examples.where((element) => element.isLetterExample).toList();
  late List<Example> numbersExample = examples.where((element) => !element.isLetterExample).toList();*/

  List<Number> numbers = [
    Number(
      name: 'رقم واحد',
      sound: 'assets/audio/pro1.mp3',
      shape: '1',
      id_example: '1',
      isLocked: false,
      imageUrl: 'assets/images/finger1.png',
    ),
    Number(
      name: 'رقم اثنان',
      sound: 'assets/audio/pro2.mp3',
      shape: '2',
      id_example: '2',
      isLocked: true,
      imageUrl: 'assets/images/finger2.png',
    ),
    Number(
      name: 'رقم ثلاثة',
      sound: 'assets/audio/pro3.mp3',
      shape: '3',
      id_example: '3',
      isLocked: true,
      imageUrl: 'assets/images/finger3.png',
    ),
    Number(
      name: 'رقم أربعة',
      sound: 'assets/audio/pro4.mp3',
      shape: '4',
      id_example: '4',
      isLocked: true,
      imageUrl: 'assets/images/finger4.png',
    ),
    Number(
      name: 'رقم خمسة',
      sound: 'assets/audio/pro5.mp3',
      shape: '5',
      id_example: '5',
      isLocked: true,
      imageUrl: 'assets/images/finger5.png',
    ),
    Number(
      name: 'رقم ستة',
      sound: 'assets/audio/pro6.mp3',
      shape: '6',
      id_example: '6',
      isLocked: true,
      imageUrl: 'assets/images/finger6.png',
    ),
    Number(
      name: 'رقم سبعة',
      sound: 'assets/audio/pro7.mp3',
      shape: '7',
      id_example: '7',
      isLocked: true,
      imageUrl: 'assets/images/finger7.png',
    ),
    Number(
      name: 'رقم ثمانية',
      sound: 'assets/audio/pro8.mp3',
      shape: '8',
      id_example: '8',
      isLocked: true,
      imageUrl: 'assets/images/finger8.png',
    ),
    Number(
      name: 'رقم تسعة',
      sound: 'assets/audio/pro9.mp3',
      shape: '9',
      id_example: '9',
      isLocked: true,
      imageUrl: 'assets/images/finger9.png',
    ),
    Number(
      name: 'رقم عشرة',
      sound: 'assets/audio/pro10.mp3',
      shape: '10',
      id_example: '10',
      isLocked: true,
      imageUrl: 'assets/images/finger10.png',
    ),
  ];
  List<Letter> letters = [
    Letter(
      name: 'حرف الألف',
      sound: 'assets/audio/proأ.mp3',
      song: 'assets/audio/أغنيةالألف.mp3',
      shape: 'أ',
      id_example: 'أ',
      isLocked: false,
    ),
    Letter(
      name: 'حرف الباء',
      sound: 'assets/audio/proب.mp3',
      song: 'assets/audio/أغنيةالباء.mp3',
      shape: 'ب',
      id_example: 'ب',
      isLocked: true,
    ),
    Letter(
      name: 'حرف التاء',
      sound: 'assets/audio/proت.mp3',
      song: 'assets/audio/أغنيةالتاء.mp3',
      shape: 'ت',
      id_example: 'ت',
      isLocked: true,
    ),
    Letter(
      name: 'حرف الثاء',
      sound: 'assets/audio/proث.mp3',
      song: 'assets/audio/أغنيةالثاء.mp3',
      shape: 'ث',
      id_example: 'ث',
      isLocked: true,
    ),
    Letter(
      name: 'حرف الجيم',
      sound: 'assets/audio/proج.mp3',
      song: 'assets/audio/أغنيةالجيم.mp3',
      shape: 'ج',
      id_example: 'ج',
      isLocked: true,
    ),
    Letter(
      name: 'حرف الحاء',
      sound: 'assets/audio/proح.mp3',
      song: 'assets/audio/أغنيةالحاء.mp3',
      shape: 'ح',
      id_example: 'ح',
      isLocked: true,
    ),
    Letter(
      name: 'حرف الخاء',
      sound: 'assets/audio/proخ.mp3',
      song: 'assets/audio/أغنيةالخاء.mp3',
      shape: 'خ',
      id_example: 'خ',
      isLocked: true,
    ),
    Letter(
      name: 'حرف الدال',
      sound: 'assets/audio/proد.mp3',
      song: 'assets/audio/أغنيةالدال.mp3',
      shape: 'د',
      id_example: 'د',
      isLocked: true,
    ),
    Letter(
      name: 'حرف الذال',
      sound: 'assets/audio/proذ.mp3',
      song: 'assets/audio/أغنيةالذال.mp3',
      shape: 'ذ',
      id_example: 'ذ',
      isLocked: true,
    ),
    Letter(
      name: 'حرف الراء',
      sound: 'assets/audio/proر.mp3',
      song: 'assets/audio/أغنيةالراء.mp3',
      shape: 'ر',
      id_example: 'ر',
      isLocked: true,
    ),
    Letter(
      name: 'حرف الزاي',
      sound: 'assets/audio/proز.mp3',
      song: 'assets/audio/أغنيةالزاي.mp3',
      shape: 'ز',
      id_example: 'ز',
      isLocked: true,
    ),
    Letter(
      name: 'حرف السين',
      sound: 'assets/audio/proس.mp3',
      song: 'assets/audio/أغنيةالسين.mp3',
      shape: 'س',
      id_example: 'س',
      isLocked: true,
    ),
    Letter(
      name: 'حرف الشين',
      sound: 'assets/audio/proش.mp3',
      song: 'assets/audio/أغنيةالشين.mp3',
      shape: 'ش',
      id_example: 'ش',
      isLocked: true,
    ),
    Letter(
      name: 'حرف الصاد',
      sound: 'assets/audio/proص.mp3',
      song: 'assets/audio/أغنيةالصاد.mp3',
      shape: 'ص',
      id_example: 'ص',
      isLocked: true,
    ),
    Letter(
      name: 'حرف الضاد',
      sound: 'assets/audio/proض.mp3',
      song: 'assets/audio/أغنيةالضاد.mp3',
      shape: 'ض',
      id_example: 'ض',
      isLocked: true,
    ),
    Letter(
      name: 'حرف الطاء',
      sound: 'assets/audio/proط.mp3',
      song: 'assets/audio/أغنيةالطاء.mp3',
      shape: 'ط',
      id_example: 'ط',
      isLocked: true,
    ),
    Letter(
      name: 'حرف الظاء',
      sound: 'assets/audio/proظ.mp3',
      song: 'assets/audio/أغنيةالظاء.mp3',
      shape: 'ظ',
      id_example: 'ظ',
      isLocked: true,
    ),
    Letter(
      name: 'حرف العين',
      sound: 'assets/audio/proع.mp3',
      song: 'assets/audio/أغنيةالعين.mp3',
      shape: 'ع',
      id_example: 'ع',
      isLocked: true,
    ),
    Letter(
      name: 'حرف الغين',
      sound: 'assets/audio/proغ.mp3',
      song: 'assets/audio/أغنيةالغين.mp3',
      shape: 'غ',
      id_example: 'غ',
      isLocked: true,
    ),
    Letter(
      name: 'حرف الفاء',
      sound: 'assets/audio/proف.mp3',
      song: 'assets/audio/أغنيةالفاء.mp3',
      shape: 'ف',
      id_example: 'ف',
      isLocked: true,
    ),
    Letter(
      name: 'حرف القاف',
      sound: 'assets/audio/proق.mp3',
      song: 'assets/audio/أغنيةالقاف.mp3',
      shape: 'ق',
      id_example: 'ق',
      isLocked: true,
    ),
    Letter(
      name: 'حرف الكاف',
      sound: 'assets/audio/proك.mp3',
      song: 'assets/audio/أغنيةالكاف.mp3',
      shape: 'ك',
      id_example: 'ك',
      isLocked: true,
    ),
    Letter(
      name: 'حرف اللام',
      sound: 'assets/audio/proل.mp3',
      song: 'assets/audio/أغنيةاللام.mp3',
      shape: 'ل',
      id_example: 'ل',
      isLocked: true,
    ),
    Letter(
      name: 'حرف الميم',
      sound: 'assets/audio/proم.mp3',
      song: 'assets/audio/أغنيةالميم.mp3',
      shape: 'م',
      id_example: 'م',
      isLocked: true,
    ),
    Letter(
      name: 'حرف النون',
      sound: 'assets/audio/proن.mp3',
      song: 'assets/audio/أغنيةالنون.mp3',
      shape: 'ن',
      id_example: 'ن',
      isLocked: true,
    ),
    Letter(
      name: 'حرف الهاء',
      sound: 'assets/audio/proه.mp3',
      song: 'assets/audio/أغنيةالهاء.mp3',
      shape: 'ه',
      id_example: 'ه',
      isLocked: true,
    ),
    Letter(
      name: 'حرف الواو',
      sound: 'assets/audio/proو.mp3',
      song: 'assets/audio/أغنيةالواو.mp3',
      shape: 'و',
      id_example: 'و',
      isLocked: true,
    ),
    Letter(
      name: 'حرف الياء',
      sound: 'assets/audio/proي.mp3',
      song: 'assets/audio/أغنيةالياء.mp3',
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
