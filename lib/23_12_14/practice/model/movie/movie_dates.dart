class MovieDates {
  String maximum;
  String minimum;

  MovieDates({required this.maximum, required this.minimum});

  Map<String, dynamic> toJson() {
    return {
      'maximum': maximum,
      'minimum': minimum,
    };
  }

  factory MovieDates.fromJson(Map<String, dynamic> json) {
    return MovieDates(
      maximum: json['maximum'] as String,
      minimum: json['minimum'] as String,
    );
  }
}
