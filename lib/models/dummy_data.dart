import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yalla_njoom/models/kid.dart';
import 'package:yalla_njoom/routers/app_router.dart';
import 'package:yalla_njoom/screens/letters_screen.dart';
import 'package:yalla_njoom/screens/numbers_screen.dart';
import 'package:yalla_njoom/screens/operation_screen.dart';
import 'example.dart';
import 'letters.dart';

/// be attentive if the pressFun was shared don't repeate it
class DummyData {
  DummyData._();
  static DummyData dummyData = DummyData._();
  Letter selectedLatter = Letter(
    name: 'حرف الألف',
    imageUrl: 'assets/images/ألف.png',
    isLocked: false,
  );
  // TODO: from provider
  Example selectedExample = Example(
    id: 'حرف الألف',
    example1: 'assets/images/carrot',
    example2: 'assets/images/peace',
    example3: 'assets/images/bear',
  ); // i will make method return the selected example from the table based on selected letter

  List<Example> otherExamples = [
    Example(
      id: 'حرف الباء',
      example1: 'assets/images/happy',
      example2: 'assets/images/lion',
      example3: 'assets/images/duck',
    ),
    Example(
      id: 'حرف التاء',
      example1: 'assets/images/bird',
      example2: 'assets/images/games',
      example3: 'assets/images/video',
    ),
    Example(
      id: 'حرف الثاء',
      example1: 'assets/images/operations',
      example2: 'assets/images/letters',
      example3: 'assets/images/numbers',
    ),
  ];
  List<Kid> kids = [
    Kid(
      name: 'غزل الحاج',
      imageUrl: 'assets/images/lion.png',
      code: 'A 10',
    ),
    Kid(
      name: 'ياسمين عثمان ',
      imageUrl: 'assets/images/lion.png',
      code: 'A 13',
    ),
    Kid(
      name: 'ياسمين عثمان ',
      imageUrl: 'assets/images/lion.png',
      code: 'A 13',
    )
  ];
  List<Number> numbers = [
    Number(
      name: 'رقم واحد',
      imageUrl: 'assets/images/1.png',
      isLocked: false,
    ),
    Number(
      name: 'رقم اثنان',
      imageUrl: 'assets/images/1.png',
      isLocked: true,
    ),
    Number(
      name: 'رقم ثلاثة',
      imageUrl: 'assets/images/1.png',
      isLocked: true,
    ),
  ];
  List<Letter> letters = [
    Letter(
      name: 'حرف الألف',
      imageUrl: 'assets/images/ألف.png',
      isLocked: false,
    ),
    Letter(
      name: 'حرف الباء',
      imageUrl: 'assets/images/باء.png',
      isLocked: true,
    ),
    Letter(
      name: 'حرف التاء',
      imageUrl: 'assets/images/ألف.png',
      isLocked: true,
    ),
  ];
  List<Example> examples = [
    /* Example(
      example1: 'assets/images/num1.png',
      example2: 'assets/images/num11.png',
      example3: 'assets/images/num111.png',
    ),
    Example(
      example1: 'assets/images/num2.png',
      example2: 'assets/images/num222.png',
      example3: 'assets/images/num22.png',
    ),*/
  ];
  List<TypeEducation> operationTypes = [
    TypeEducation(
        image: 'assets/images/plus_op.png',
        name: 'عمليةالجمع',
        bgColor: const Color(0xFF074785),
        pressFun: () {}),
    TypeEducation(
        image: 'assets/images/minus_op.png',
        name: 'عملية الطرح',
        bgColor: const Color(0xFFFFA4AC),
        pressFun: () {}),
    TypeEducation(
        image: 'assets/images/exer_img.png',
        name: 'مسائل عامة',
        bgColor: const Color(0xFF2FB0FD),
        pressFun: () {}),
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
        pressFun: () {}),
    TypeEducation(
        image: 'assets/images/games.png',
        name: 'ألعاب',
        bgColor: const Color(0xFFFFA4AC),
        pressFun: () {}),
  ];
  List<String> giveImagesToShow() {
    var random = Random();
    var index1 = random.nextInt(otherExamples.length - 1);
    var index2 = random.nextInt(otherExamples.length - 1);
    // TODO: make it in best way
    return [
      otherExamples[index1].example1,
      otherExamples[index2].example2,
      selectedExample.example1
    ];
  }
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
