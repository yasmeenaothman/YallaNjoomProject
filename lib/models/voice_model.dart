class Voice {
  String? langId;
  String? voicePath;
  double? percentageMatch;
  late bool isLetter;
  String? length;

  Voice(
      {required this.langId,
      required this.voicePath,
      required this.percentageMatch,
      required this.isLetter,
      required this.length});
  Voice.fromMap(Map<String, dynamic> map) {
    langId = map["langId"];
    voicePath = map["voicePath"];
    percentageMatch = map["percentageMatch"];
    isLetter = map["isLetter"];
    length = map['length'];
  }
  toMap() {
    return {
      "langId": langId,
      "voicePath": voicePath,
      "percentageMatch": percentageMatch,
      "isLetter": isLetter,
      'length': length,
    };
  }
}
