class SpokenLanguage {
  String englishName;
  String iso639_1;
  String name;

  SpokenLanguage(
      {required this.englishName, required this.iso639_1, required this.name});

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) {
    return SpokenLanguage(
      englishName: json['english_name'] as String,
      iso639_1: json['iso_639_1'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'english_name': englishName,
      'iso_639_1': iso639_1,
      'name': name,
    };
  }
}
