import 'package:floor/floor.dart';

@Entity(tableName: 'post')
class PostEntity {
  @primaryKey
  final int date;

  final String title;

  final String content;

  PostEntity(this.date, this.title, this.content);
}