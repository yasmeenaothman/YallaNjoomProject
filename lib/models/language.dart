class Language {
  String? name;
  String? sound;
  String id_example;
  String? shape;
  String? soundRecordedPath;
  late bool isLocked;

  Language({
    required this.name,
    required this.sound,
    required this.id_example,
    required this.isLocked,
    required this.shape,
    this.soundRecordedPath,
  });

  toMap() {
    return {
      "name": name,
      "audio": sound,
      "isLocked": isLocked,
      "shape": shape,
      "soundRecordedPath": soundRecordedPath,
    };
  }
}

class Letter extends Language {
  String? song;
  // TODO: here i think this need refactoring but later i will do
  Letter({
    required String name,
    required this.song,
    required String sound,
    required String id_example,
    required bool isLocked,
    required String shape,
  }) //required String imageUrl,
  : super(
            name: name,
            sound: sound,
            id_example: id_example,
            isLocked: isLocked,
            shape: shape); //imageUrl: imageUrl,
  Letter.fromMap(Map map)
      : song = map["song"],
        super(
          name: map["name"],
          sound: map["audio"],
          id_example: map["id"],
          //imageUrl: map["imageUrl"],
          isLocked: map["isLocked"],
          shape: map["shape"],
          soundRecordedPath: map["soundRecordedPath"],
        );
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
    required String imageUrl,
  }) //required String imageUrl,
  : super(
          name: name,
          sound: sound,
          id_example: id_example,
          isLocked: isLocked,
          shape: shape,
        ); //imageUrl: imageUrl,
  Number.fromMap(Map map)
      : imageUrl = map["imageUrl"],
        super(
          name: map["name"],
          sound: map["audio"],
          id_example: map["id"],
          isLocked: map["isLocked"],
          shape: map["shape"],
          soundRecordedPath: map["soundRecordedPath"],
        );
}
