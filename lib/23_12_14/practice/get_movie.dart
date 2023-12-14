import 'package:orm_dart/23_12_14/practice/model/moive_detail.dart';
import 'package:orm_dart/23_12_14/practice/model/movie_response.dart';
import 'package:orm_dart/23_12_14/practice/movie_client.dart';

void main() async {
  // 연습문제 1번: 영화정보를 가져와서 모델에 담고 json 형태로 출력하기
  final MovieClient movieClient = MovieClient();
  final int page = 1;
  MovieResponse movieResponse = await movieClient.getUpcomingMovies(page);
  print(movieResponse.toJson());
  print('\n');

  print('-----------------------------------------------------');

  print('\n');

  // 연습문제 2번: 영화의 상세정보를 모델에 담고 json 형태로 출력하기
  final MovieDetail movieDetail =
      await movieClient.getMovieDetail(page, movieResponse.results[0].id);
  print(movieDetail.toJson());
}