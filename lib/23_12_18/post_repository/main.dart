import 'package:orm_dart/23_12_18/post_repository/post.dart';

import './post_file_repository_impl.dart';

void main() async {
  final Post post = Post(userId: 1, id: 2, title: 'title', body: 'body');
  PostFileRepositoryImpl postFileRepositoryImple = PostFileRepositoryImpl();
  print(await postFileRepositoryImple.getPosts());

  await postFileRepositoryImple.addPost(post);
  print(await postFileRepositoryImple.getPosts());

  post.title = 'title2';
  await postFileRepositoryImple.updatePost(post);
  print(await postFileRepositoryImple.getPosts());

  await postFileRepositoryImple.deletePost(post);
  print(await postFileRepositoryImple.getPosts());
}
