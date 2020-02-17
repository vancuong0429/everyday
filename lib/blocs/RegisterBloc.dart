import 'dart:async';

import 'package:everyday/repository/Repository.dart';

class RegisterBloc {
  Repository _registerRepository;

  RegisterBloc() {
    _registerRepository = Repository();
  }

  Future<void> registerUserByFacebook(String userId, String email, String name, String avatar) {
    return _registerRepository.registerUser(userId, email, name, avatar);
  }

  Future<void> insertUser(String userId, String name) {
    return _registerRepository.insertUser(userId, name);
  }
}