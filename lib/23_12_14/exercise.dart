import 'dart:convert';
import 'package:http/http.dart' as http;
import 'todo.dart';

void main() async {
  final Todo todo = await getTodo(1);
  print(todo.title);

  List<Todo> todos = await getTodos();
  todos.forEach((e) {
    print(e.title);
  });
}

// 하나 받을 때 패턴
Future<Todo> getTodo(int id) async {
  final response =
  await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
  return Todo.fromJson(jsonDecode(response.body));
}

// 여러개 리스트 받을 때 패턴
Future<List<Todo>> getTodos() async {
  final response =
  await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
  final List<dynamic> jsonList = jsonDecode(response.body) as List<dynamic>;

  return jsonList.map((e) => Todo.fromJson(e)).toList();
}
