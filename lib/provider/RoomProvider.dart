import 'package:everyday/provider/AppDatabase.dart';
import 'package:everyday/provider/PostEntity.dart';
import 'package:everyday/provider/UserEntity.dart';

class RoomProvider{
  AppDatabase _appDatabase;

  Future<AppDatabase> get database async {
    if (_appDatabase != null) return _appDatabase;
    _appDatabase = await getDatabaseInstance();
    return _appDatabase;
  }

  Future<AppDatabase> getDatabaseInstance() async {
    return  await $FloorAppDatabase.databaseBuilder('app_database.db')
        .build();
  }

  Future<void> registerUser(String userId, String name) async{
    final db = await database;
    await db.userDao.insertUser(UserEntity(userId, name));
  }

  Future<void> createPost(int date, String title, String content) async{
    final db = await database;
    await db.postDao.insertPost(PostEntity(date, title, content));
  }

  Future<List<PostEntity>> getPost() async{
    final db = await database;
    return db.postDao.getPost();
  }

  Future<void> registerAndReplaceUser(String userId, String name) async{
    final db = await database;
    await db.userDao.replaceUser(UserEntity(userId, name));
  }

  Future<UserEntity> getUser() async{
    final db = await database;
    return db.userDao.getUser();
  }
}