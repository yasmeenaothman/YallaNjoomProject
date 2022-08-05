class Language {
  String? name;
  String? sound;
  String exampleId;
  String? shape;
  String? soundRecordedPath;
  late bool isLocked;

  Language({
    required this.name,
    required this.sound,
    required this.exampleId,
    required this.isLocked,
    required this.shape,
    this.soundRecordedPath,
  });

  toMap() {
    return {
      "name": name,
      "audio": sound,
      "isLocked": isLocked,
      "id": exampleId,
      "shape": shape,
      "soundRecordedPath": soundRecordedPath,
    };
  }
}

class Letter extends Language {
  String? song;
  Letter({
    required String name,
    required this.song,
    required String sound,
    required String id_example,
    required bool isLocked,
    required String shape,
  }) : super(
            name: name,
            sound: sound,
            exampleId: id_example,
            isLocked: isLocked,
            shape: shape);
  Letter.fromMap(Map map)
      : song = map["song"],
        super(
          name: map["name"],
          sound: map["audio"],
          exampleId: map["id"],
          isLocked: map["isLocked"],
          shape: map["shape"],
          soundRecordedPath: map["soundRecordedPath"],
        );
  @override
  toMap() {
    //Map map = super.toMap();
    Map<String, dynamic> m = {
      ...super.toMap(),
      "song": song,
    };
    return m;
  }
}

class Number extends Language {
  // here no song
  String? imageUrl;
  Number({
    required String name,
    required String sound,
    required String id_example,
    required bool isLocked,
    required String shape,
    required this.imageUrl,
  }) : super(
          name: name,
          sound: sound,
          exampleId: id_example,
          isLocked: isLocked,
          shape: shape,
        );
  Number.fromMap(Map map)
      : imageUrl = map["imageUrl"],
        super(
          name: map["name"],
          sound: map["audio"],
          exampleId: map["id"],
          isLocked: map["isLocked"],
          shape: map["shape"],
          soundRecordedPath: map["soundRecordedPath"],
        );
  @override
  toMap() {
    Map<String, dynamic> m = {
      ...super.toMap(),
      "imageUrl": imageUrl,
    };
    return m;
  }
}
