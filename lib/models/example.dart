class Example {
  Example({
    required this.id,
    required this.img1,
    required this.img2,
    required this.img3,
    required this.isLetterExample,
  });
  String? id, img1, img2, img3;
  late bool isLetterExample;

  Example.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    img1 = map["img1"];
    img2 = map["img2"];
    img3 = map["img3"];
    isLetterExample = map["isLetterExample"];
  }
  toMap() {
    return {
      "id": id,
      "img1": img1,
      "img2": img2,
      "img3": img3,
      "isLetterExample": isLetterExample,
    };
  }
}
