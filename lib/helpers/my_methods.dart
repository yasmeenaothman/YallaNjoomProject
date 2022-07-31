import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:yalla_njoom/models/dummy_data.dart';
import 'package:yalla_njoom/models/example.dart';

import '../providers/firestore_provider.dart';

generateNewCode(context) {
  List codes = Provider.of<FirestoreProvider>(context, listen: false).codes;
  String code = (Random().nextInt(8999) + 1000).toString();
  while (codes.contains(code)) {
    code = (Random().nextInt(8999) + 1000).toString();
  }

  return code;
}

generateNumber() {
  return (Random().nextInt(50) + 15).toString();
}

chooseLetterRandomly(
    {required bool isFirstChoice, required FirestoreProvider provider}) {
  int index = Random().nextInt(provider.examplesWithoutSelected.length);
  print(
      '////////////////////////////////////////////${provider.examplesWithoutSelected.length}');
  return isFirstChoice
      ? provider.examplesWithoutSelected[index].img1
      : provider.examplesWithoutSelected[index].img2;
}

List generateImageList({required FirestoreProvider provider}) {
  String imageForSelectedLang = '';
  Example example = provider.examples.firstWhere(
      (element) => provider.selectedLanguage.id_example == element.id);
  switch (provider.numOfExampleSol) {
    case 0:
      imageForSelectedLang = example.img1!;
      break;
    case 1:
      imageForSelectedLang = example.img2!;
      break;
    case 2:
      imageForSelectedLang = example.img3!;
      break;
    //TODO:here you should take your situation
  }
  List<String> images = [
    imageForSelectedLang,
    chooseLetterRandomly(isFirstChoice: true, provider: provider),
    chooseLetterRandomly(isFirstChoice: false, provider: provider),
  ];
  images.shuffle();
  return [images, imageForSelectedLang];
}

double matchTwoAudios(String audio1, String audio2) {
  //TODO: here i will add code to match these audios
  return 0.85;
}

String selectRandomlyExampleImage(Example example) {
  List<String> list = [example.img1!, example.img2!, example.img3!];
  list.shuffle();
  return list[0];
}

Example selectRandomlyNumExample({required FirestoreProvider provider}) {
  List<Example> numbersExample = provider.numbersExample
      .getRange(0, provider.numbersExample.length)
      .toList();
  numbersExample.shuffle();
  return numbersExample[0];
}

List<int> generateListOfAnswer(int rightSol) {
  int answer1, answer2;
  List<int> choices;
  do {
    answer1 = Random().nextInt(21);
    answer2 = Random().nextInt(21);
  } while (answer1 == rightSol || answer2 == rightSol || answer1 == answer2);
  choices = [rightSol, answer1, answer2];
  choices.shuffle();
  return choices;
}

String returnOperation() {
  int result = Random().nextInt(2);
  return result == 1 ? '+' : '-';
}

int calTwoNum(bool value, String example1, String example2) {
  return value
      ? int.parse(example1) + int.parse(example2)
      : int.parse(example1) - int.parse(example2);
}
