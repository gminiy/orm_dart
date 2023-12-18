import 'package:orm_dart/23_12_18/post_repository/post.dart';
import 'package:orm_dart/23_12_18/post_repository/post_repository.dart';

class PostManager {
  final PostRepository _postRepository;

  PostManager(this._postRepository);

  Future<void> addPost(Post post) async {
    await _postRepository.addPost(post);
  }

  Future<void> deletePost(Post post) async {
    await _postRepository.deletePost(post);
  }

  Future<List<Post>> getPosts() async {
    return await _postRepository.getPosts();
  }

  Future<void> updatePost(Post post) async {
    await _postRepository.updatePost(post);
  }
}
