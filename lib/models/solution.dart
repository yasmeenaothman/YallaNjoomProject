class Solution {
  String? exampleId;
  int? numOfSolutions;
  int numOfStars = 0;

  Solution({
    required this.exampleId,
    this.numOfSolutions = 0,
    this.numOfStars = 0,
  });
  Solution.fromMap(Map<String, dynamic> map) {
    exampleId = map["exampleId"];
    numOfSolutions = map["numOfSolutions"];
    numOfStars = map["numOfStars"];
  }
  toMap() {
    return {
      "exampleId": exampleId,
      "numOfSolutions": numOfSolutions,
      "numOfStars": numOfStars,
    };
  }
}
