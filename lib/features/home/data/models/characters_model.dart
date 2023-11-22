class CharactersModel {
  String id;

  int characterId;

  String name;

  String birthday;

  List jobs;

  String image;

  String status;

  List appearancePerSeason;

  String firstAppearance;

  String lastAppearance;

  String nickname;

  String actorName;

  CharactersModel({
    required this.id,
    required this.characterId,
    required this.name,
    required this.birthday,
    required this.jobs,
    required this.image,
    required this.status,
    required this.appearancePerSeason,
    required this.firstAppearance,
    required this.lastAppearance,
    required this.nickname,
    required this.actorName,
  });

  factory CharactersModel.fromJson(Map<String, dynamic> json) {
    return CharactersModel(
      id: json['_id'],
      characterId: json['char_id'],
      name: json['name'],
      birthday: json['birthday'],
      jobs: json['occupation'],
      image: json['img'],
      status: json['status'],
      appearancePerSeason: json['appearance'],
      firstAppearance: json['firstAppearance'],
      lastAppearance: json['lastAppearance'],
      nickname: json['nickname'] ?? '',
      actorName: json['portrayed'],
    );
  }
}
