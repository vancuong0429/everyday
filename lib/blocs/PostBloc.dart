import 'dart:async';

import 'package:everyday/provider/PostEntity.dart';
import 'package:everyday/provider/UserEntity.dart';
import 'package:everyday/repository/Repository.dart';

class PostBloc {
  Repository _postRepository;
  final _postController = new StreamController();
  Stream get postStream => _postController.stream;

  PostBloc() {
    _postRepository = Repository();
  }

  Future<void> createPost(int date, String title, String content) {
    return _postRepository.createPost(date, title, content);
  }


  Future<List<PostEntity>> getPost() async{
    var post = await _postRepository.getPost();
    _postController.sink.add(post);
  }

  void dispose() {
    _postController.close();
  }

}