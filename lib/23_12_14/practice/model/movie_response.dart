import "./movie.dart";
import "./movie_dates.dart";

class MovieResponse {
  MovieDates dates;
  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  MovieResponse({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  Map<String, dynamic> toJson() {
    return {
      'dates': dates.toJson(),
      'page': page,
      'results': results.map((movie) => movie.toJson()).toList(),
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }

  factory MovieResponse.fromJson(Map<String, dynamic> json) {
    return MovieResponse(
      dates: MovieDates.fromJson(json['dates']),
      page: json['page'] as int,
      results: (json['results'] as List)
          .map((item) => Movie.fromJson(item))
          .toList(),
      totalPages: json['total_pages'] as int,
      totalResults: json['total_results'] as int,
    );
  }
}
