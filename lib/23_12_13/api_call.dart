import 'dart:convert';

Future<String> getMovieInfo() async {
  await Future.delayed(Duration(seconds: 2));
  final mockData = {
    'title': 'Star Wars',
    'director': 'George Lucas',
    'year': 1977
  };

  return jsonEncode(mockData);
}

Future<void> main() async {
  final Map<String, dynamic> movie = jsonDecode(await getMovieInfo());

  print(movie['director']);
}
