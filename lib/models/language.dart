class Language {
  String? name;
  String? sound;
  //TODO: make object of example here
  //String? imageUrl;
  String? shape;
  late bool isLocked;

  Language({
    required this.name,
    required this.sound,
    // required this.imageUrl,
    required this.isLocked,
    required this.shape,
  });

  toMap() {
    return {
      "name": name,
      "audio": sound,
      //"imageUrl": imageUrl,
      "isLocked": isLocked,
      "shape": shape,
    };
  }
}

class Letter extends Language {
  String? song;
  // TODO: here i think this need refactoring but later i will do
  Letter(
      {required String name,
      required this.song,
      required String sound,
      required bool isLocked,
      required String shape}) //required String imageUrl,
      : super(
            name: name,
            sound: sound,
            isLocked: isLocked,
            shape: shape); //imageUrl: imageUrl,
  Letter.fromMap(Map map)
      : song = map["song"],
        super(
            name: map["name"],
            sound: map["audio"],
            //imageUrl: map["imageUrl"],
            isLocked: map["isLocked"],
            shape: map["shape"]);
}

class Number extends Language {
  // here no song
  Number(
      {required String name,
      required String audio,
      required bool isLocked,
      required String shape}) //required String imageUrl,
      : super(
            name: name,
            sound: audio,
            isLocked: isLocked,
            shape: shape); //imageUrl: imageUrl,
  Number.fromMap(Map map)
      : super(
            name: map["name"],
            sound: map["audio"],
            //imageUrl: map["imageUrl"],
            isLocked: map["isLocked"],
            shape: map["shape"]);
}
