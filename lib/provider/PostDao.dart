import 'package:everyday/provider/PostEntity.dart';
import 'package:floor/floor.dart';

@dao
abstract class PostDao {
  @insert
  Future<void> insertPost(PostEntity postEntity);

  @Query('Select * from post')
  Future<List<PostEntity>> getPost();

}