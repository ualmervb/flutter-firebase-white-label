import 'package:flutter_firebase_white_label/app/modules/auth/domain/entities/user_entity.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/domain/repositories/user_repository.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/infra/datasources/auth_datasource.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/infra/datasources/user_datasource.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UserRepositoryImpl with UserRepository{

  AuthDataSource _authDataSource = Modular.get();
  UserDataSource _userDataSource = Modular.get();

  @override
  Future<UserEntity?> saveUser(UserEntity user) async {

    await _userDataSource.saveUser(user);

    return user;
  }

}