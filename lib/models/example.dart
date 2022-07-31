class Example {
  Example({
    required this.exampleId,
    required this.img1,
    required this.img2,
    required this.img3,
    required this.isLetterExample,
  });
  String? exampleId, img1, img2, img3;
  late bool isLetterExample;

  Example.fromMap(Map<String, dynamic> map) {
    exampleId = map["id"];
    img1 = map["img1"];
    img2 = map["img2"];
    img3 = map["img3"];
    isLetterExample = map["isLetterExample"];
  }
  toMap() {
    return {
      "id": exampleId,
      "img1": img1,
      "img2": img2,
      "img3": img3,
      "isLetterExample": isLetterExample,
    };
  }
}
