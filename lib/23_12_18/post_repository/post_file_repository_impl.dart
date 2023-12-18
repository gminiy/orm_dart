import 'dart:convert';

import 'package:orm_dart/23_12_18/post_repository/post.dart';
import 'package:orm_dart/23_12_18/post_repository/post_repository.dart';
import 'dart:io';

class PostFileRepositoryImpl implements PostRepository {
  static String currentDir =
      Directory(Platform.script.toFilePath()).parent.path;
  final _file = File('$currentDir/posts.json');

  Post? _findWithId(List<Post> posts, int id) {
    final List<Post> postsWithId = posts.where((e) => e.id == id).toList();

    if (postsWithId.isEmpty) {
      return null;
    }

    if (postsWithId.length > 1) {
      throw Exception('There are posts with same id($id)');
    }

    return postsWithId[0];
  }

  String _postsTojson(List<Post> posts) {
    List<dynamic> jsonList = posts.map((post) => post.toJson()).toList();

    return jsonEncode(jsonList);
  }

  Future<void> _writePosts(List<Post> posts) async {
    final json = _postsTojson(posts);
    await _file.writeAsString(json);
  }

  @override
  Future<void> addPost(Post post) async {
    final List<Post> posts = await getPosts();
    if (_findWithId(posts, post.id) != null) {
      await Future.error(
          Exception('There is the post with same id(${post.id})'));
    }
    posts.add(post);

    await _writePosts(posts);
  }

  @override
  Future<void> deletePost(Post post) async {
    final List<Post> posts = await getPosts();
    posts.removeWhere((e) => e.id == post.id);

    await _writePosts(posts);
  }

  @override
  Future<List<Post>> getPosts() async {
    try {
      final String json = await _file.readAsString();
      List<dynamic> jsonList = jsonDecode(json);

      return jsonList.map((e) => Post.fromJson(e)).toList();
    } on PathNotFoundException {
      return [];
    } catch (e) {
      print(e);
      return await Future.error(Exception(e));
    }
  }

  @override
  Future<void> updatePost(Post post) async {
    final posts = await getPosts();
    int index = posts.indexWhere((e) => e.id == post.id);

    if (index == -1) {
      return await Future.error(
          Exception('There is no post with id(${post.id})'));
    }

    posts[index] = post;
    await _writePosts(posts);
  }
}
