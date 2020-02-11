import 'package:floor/floor.dart';

@entity
class UserEntity {
  @primaryKey
  final String userId;

  final String name;

  UserEntity(this.userId, this.name);
}