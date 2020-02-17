import 'package:everyday/provider/UserEntity.dart';
import 'package:floor/floor.dart';

@dao
abstract class UserDao {
  @Insert(onConflict: OnConflictStrategy.REPLACE)
  Future<void> insertUser(UserEntity userEntity);

  @Query('Select * from UserEntity')
  Future<UserEntity> getUser();
}