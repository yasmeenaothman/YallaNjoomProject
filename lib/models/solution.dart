class Solution {
  /* String? solutionId;
  String? userCode;*/
  String? exampleId;
  int? numOfSolutions;

  Solution(
      {/*required this.solutionId,
      required this.userCode,*/
      required this.exampleId,
      this.numOfSolutions = 0});
  Solution.fromMap(Map<String, dynamic> map) {
    /* solutionId = map["solutionId"];
    userCode = map["code"];*/
    exampleId = map["exampleId"];
    numOfSolutions = map["numOfSolutions"];
  }
  toMap() {
    return {
      /* "solutionId": solutionId,
      "code": userCode,*/
      "exampleId": exampleId,
      "numOfSolutions": numOfSolutions,
    };
  }
}
