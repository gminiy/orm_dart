import 'package:orm_dart/23_12_18/post_repository/mock_post_memory_repository_impl.dart';
import 'package:orm_dart/23_12_18/post_repository/post.dart';
import 'package:orm_dart/23_12_18/post_repository/post_manager.dart';
import 'package:orm_dart/23_12_18/post_repository/post_repository.dart';
import 'package:test/test.dart';

void main() {
  test('add post', () async {
    final Post post = Post(userId: 1, id: 1, title: 'title', body: 'body');
    final PostRepository mockPostMemoryRepository =
        MockPostMemoryRepositoryImpl();
    final PostManager postManager = PostManager(mockPostMemoryRepository);

    await postManager.addPost(post);
    final List<Post> posts = await postManager.getPosts();
    expect(posts, [post]);
  });

  test('update post', () async {
    final Post post = Post(userId: 1, id: 1, title: 'title', body: 'body');
    final PostRepository mockPostMemoryRepository =
        MockPostMemoryRepositoryImpl();
    final PostManager postManager = PostManager(mockPostMemoryRepository);
    await postManager.addPost(post);

    final Post post2 = Post(userId: 1, id: 1, title: 'title2', body: 'body2');
    await postManager.updatePost(post2);
    final List<Post> posts = await postManager.getPosts();

    expect(posts, [post2]);
  });

  test('updating non-exist post', () async {
    final Post post = Post(userId: 1, id: 1, title: 'title', body: 'body');
    final PostRepository mockPostMemoryRepository =
        MockPostMemoryRepositoryImpl();
    final PostManager postManager = PostManager(mockPostMemoryRepository);
    await postManager.addPost(post);

    // The post with different id
    final Post post2 = Post(userId: 1, id: 2, title: 'title2', body: 'body2');

    expect(
        postManager.updatePost(post2),
        throwsA(isA<Exception>().having((e) => e.toString(), 'description',
            contains('There is no post with id(${post2.id})'))));
  });

  test('delete post', () async {
    final Post post = Post(userId: 1, id: 1, title: 'title', body: 'body');
    final PostRepository mockPostMemoryRepository =
        MockPostMemoryRepositoryImpl();
    final PostManager postManager = PostManager(mockPostMemoryRepository);
    await postManager.addPost(post);
    await postManager.deletePost(post);
    final List<Post> posts = await postManager.getPosts();
    expect(posts, []);
  });
}
