
import 'package:everyday/provider/AppDatabase.dart';
import 'package:everyday/provider/FirestoreProvider.dart';
import 'package:everyday/provider/UserDao.dart';

class Repository {
  final _firestoreProvider = FirestoreProvider();
  UserDao _userDao;

  Repository() async {
    final database = await $FloorAppDatabase.databaseBuilder("app_database.db").build();
  }

  Future<void> registerUser(String userId, String email, String name, String avatar) => _firestoreProvider.registerUser(userId, email, name, avatar);
}