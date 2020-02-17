import 'dart:async';

import 'package:everyday/provider/UserEntity.dart';
import 'package:everyday/repository/Repository.dart';

class ProfileBloc {
  Repository _registerRepository;

  final _userController = new StreamController();
  Stream get userStream => _userController.stream;

  ProfileBloc() {
    _registerRepository = Repository();
  }

  Future<UserEntity> getUser() async{
    UserEntity user =  await _registerRepository.getUser();
    _userController.sink.add(user);
  }

  void dispose() {
    _userController.close();
  }
}