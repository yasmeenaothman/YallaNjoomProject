import 'package:flutter/material.dart';

class Language {
  String? name;
  String? imageUrl;
  late bool isLocked;

  Language({
    required this.name,
    required this.imageUrl,
    required this.isLocked,
  });

  toMap() {
    return {
      "name": name,
      "imageUrl": imageUrl,
      "isLocked": isLocked,
    };
  }
}

class Letter extends Language {
  Letter(
      {required String name, required String imageUrl, required bool isLocked})
      : super(name: name, imageUrl: imageUrl, isLocked: isLocked);
  Letter.fromMap(Map map)
      : super(
            name: map["name"],
            imageUrl: map["imageUrl"],
            isLocked: map["isLocked"]);
}

class Number extends Language {
  Number(
      {required String name, required String imageUrl, required bool isLocked})
      : super(name: name, imageUrl: imageUrl, isLocked: isLocked);
  Number.fromMap(Map map)
      : super(
            name: map["name"],
            imageUrl: map["imageUrl"],
            isLocked: map["isLocked"]);
}
