import 'package:orm_dart/23_12_18/post_repository/post.dart';
import 'package:orm_dart/23_12_18/post_repository/post_repository.dart';

class MockPostMemoryRepositoryImpl implements PostRepository {
  final List<Post> posts = [];

  @override
  Future<void> addPost(Post post) async {
    posts.add(post);
  }

  @override
  Future<void> deletePost(Post post) async {
    posts.removeWhere((e) => e.id == post.id);
  }

  @override
  Future<List<Post>> getPosts() async {
    return posts;
  }

  @override
  Future<void> updatePost(Post post) async {
    int index = posts.indexWhere((e) => e.id == post.id);

    if (index == -1) {
      return await Future.error(
          Exception('There is no post with id(${post.id})'));
    }

    posts[index] = post;
  }
}
