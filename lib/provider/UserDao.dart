import 'package:everyday/provider/UserEntity.dart';
import 'package:floor/floor.dart';

@dao
abstract class UserDao {
  @insert
  Future<void> insertUser(UserEntity userEntity);
}