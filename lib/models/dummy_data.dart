import 'package:flutter/material.dart';

/// be attentive if the pressFun was shared don't repeate it
class DummyData {
  DummyData._();
  static DummyData dummyData = DummyData._();
  List<Example> examples = [
    Example(
      example1: 'assets/images/num1.png',
      example2: 'assets/images/num11.png',
      example3: 'assets/images/num111.png',
    ),
    Example(
      example1: 'assets/images/num2.png',
      example2: 'assets/images/num222.png',
      example3: 'assets/images/num22.png',
    ),
  ];
  List<TypeEducation> types = [
    TypeEducation(
        image: 'assets/images/letters.png',
        name: 'الحروف',
        bgColor: const Color(0xFF074785),
        pressFun: () {}),
    TypeEducation(
        image: 'assets/images/numbers.png',
        name: 'الأرقام',
        bgColor: const Color(0xFFFFA4AC),
        pressFun: () {}),
    TypeEducation(
        image: 'assets/images/operations.png',
        name: 'العمليات الحسابية',
        bgColor: const Color(0xFF2FB0FD),
        pressFun: () {}),
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
}

class TypeEducation {
  String image;
  String name;
  Color bgColor;
  Function pressFun;
  TypeEducation(
      {required this.image,
      required this.name,
      required this.bgColor,
      required this.pressFun});
}

class Example {
  Example({
    this.id = '',
    required this.example1,
    required this.example2,
    required this.example3,
  });

  String id, example1, example2, example3;
}
