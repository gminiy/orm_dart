import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:orm_dart/23_12_14/practice/model/movie/movie_detail.dart';
import './model/movie/movie_response.dart';

class MovieClient {
  final String _baseUrl = 'https://api.themoviedb.org/3/movie';
  final String _apiKey = 'a64533e7ece6c72731da47c9c8bc691f';

  Future<MovieResponse> getUpcomingMovies(int page) async {
    final response = await http.get(
        Uri.parse('$_baseUrl/upcoming?api_key=$_apiKey&language=ko-KR&$page'));

    return MovieResponse.fromJson(jsonDecode(response.body));
  }

  Future<MovieDetail> getMovieDetail(int page, int movieId) async {
    final response = await http.get(
        Uri.parse('$_baseUrl/$movieId?api_key=$_apiKey&language=ko-KR&$page'));

    return MovieDetail.fromJson(jsonDecode(response.body));
  }
}
