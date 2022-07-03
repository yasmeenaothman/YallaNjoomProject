class Kid {
  String? name;
  String? imageUrl;
  String? code;

  Kid({
    required this.name,
    required this.imageUrl,
    required this.code,
  });

  Kid.fromMap(Map map) {
    name = map["name"];
    imageUrl = map["imageUrl"];
    code = map["code"];
  }

  toMap() {
    return {
      "name": name,
      "imageUrl": imageUrl,
      "code": code,
    };
  }
}
