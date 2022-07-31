class Voice {
  String? voiceId;
  String? userCode;
  String? langId;
  String? voicePath;
  double? percentageMatch;

  Voice(
      {required this.voiceId,
      required this.userCode,
      required this.langId,
      required this.voicePath,
      required this.percentageMatch});
  Voice.fromMap(Map<String, dynamic> map) {
    voiceId = map["voiceId"];
    userCode = map["code"];
    langId = map["langId"];
    voicePath = map["voicePath"];
    percentageMatch = map["percentageMatch"];
  }
  toMap() {
    return {
      "voiceId": voiceId,
      "code": userCode,
      "langId": langId,
      "voicePath": voicePath,
      "percentageMatch": percentageMatch,
    };
  }
}
