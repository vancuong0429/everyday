import 'dart:async';
import 'package:everyday/provider/PostDao.dart';
import 'package:everyday/provider/PostEntity.dart';
import 'package:everyday/provider/UserDao.dart';
import 'package:everyday/provider/UserEntity.dart';
import 'package:floor/floor.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'AppDatabase.g.dart';
@Database(version: 1, entities: [UserEntity, PostEntity])
abstract class AppDatabase extends FloorDatabase {
  UserDao get userDao;
  PostDao get postDao;
}