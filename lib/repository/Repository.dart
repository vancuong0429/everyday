
import 'package:everyday/provider/AppDatabase.dart';
import 'package:everyday/provider/FirestoreProvider.dart';
import 'package:everyday/provider/PostEntity.dart';
import 'package:everyday/provider/RoomProvider.dart';
import 'package:everyday/provider/UserDao.dart';
import 'package:everyday/provider/UserEntity.dart';

class Repository {
  final _firestoreProvider = FirestoreProvider();
  final _roomProvider = RoomProvider();

  Future<void> registerUser(String userId, String email, String name, String avatar) => _firestoreProvider.registerUser(userId, email, name, avatar);

  Future<void> insertUser(String userId, String name) => _roomProvider.registerAndReplaceUser(userId, name);

  Future<void> createPost(int date, String title, String content) => _roomProvider.createPost(date, title, content);

  Future<List<PostEntity>> getPost() {
    return _roomProvider.getPost();
  }

  Future<UserEntity> getUser(){
    return _roomProvider.getUser();
  }
}