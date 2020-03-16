import 'package:everyday/provider/UserEntity.dart';
import 'package:floor/floor.dart';

@dao
abstract class UserDao {
  @insert
  Future<void> insertUser(UserEntity userEntity);

  @Query('Select * from UserEntity')
  Future<UserEntity> getUser();

  @Query('DELETE FROM UserEntity where userId = :userEntity')
  Future<void> deleteUser(String userEntity);

  @transaction
  Future<void> replaceUser(UserEntity userEntity) async {
    await deleteUser(userEntity.userId);
    await insertUser(userEntity);
  }
}