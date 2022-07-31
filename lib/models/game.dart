class Game {
  Game({
    required this.gameId,
    required this.gameImg,
    required this.gameName,
    required this.coinsNeeded,
    this.isLocked = true,
  });
  String? gameId, gameImg, gameName;
  int? coinsNeeded;
  bool? isLocked;

  Game.fromMap(Map<String, dynamic> map) {
    gameId = map["gameId"];
    gameImg = map["gameImg"];
    gameName = map["gameName"];
    coinsNeeded = map["coinsNeeded"];
    //isLocked = map["isLocked"];
  }
  toMap() {
    return {
      "gameId": gameId,
      "gameImg": gameImg,
      "gameName": gameName,
      "coinsNeeded": coinsNeeded,
      //"isLocked":isLocked,
    };
  }
}

class OpenGame {
  OpenGame({
    required this.gameId,
    required this.code,
  });
  String? gameId, code;

  OpenGame.fromMap(Map<String, dynamic> map) {
    //id = map["id"];
    gameId = map["gameId"];
    code = map["code"];
  }
  toMap() {
    return {
      //"id":id,
      "gameId": gameId,
      "code": code,
    };
  }
}
