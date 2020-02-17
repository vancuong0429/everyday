import 'package:everyday/provider/AppDatabase.dart';
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

  Future<UserEntity> getUser() async{
    final db = await database;
    return db.userDao.getUser();
  }
}