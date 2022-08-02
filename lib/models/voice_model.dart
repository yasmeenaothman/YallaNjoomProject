class Voice {
  String? langId;
  String? voicePath;
  double? percentageMatch;

  Voice(
      {required this.langId,
      required this.voicePath,
      required this.percentageMatch});
  Voice.fromMap(Map<String, dynamic> map) {
    langId = map["langId"];
    voicePath = map["voicePath"];
    percentageMatch = map["percentageMatch"];
  }
  toMap() {
    return {
      "langId": langId,
      "voicePath": voicePath,
      "percentageMatch": percentageMatch,
    };
  }
}
