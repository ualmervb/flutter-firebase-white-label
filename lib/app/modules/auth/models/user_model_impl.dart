import 'package:flutter_firebase_white_label/app/modules/auth/models/entities/user_entity.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/models/repositories/auth_repository.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/models/repositories/user_repository.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/models/user_model.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UserModelImpl with UserModel{

  AuthRepository _authRepository = Modular.get();
  UserRepository _userRepository = Modular.get();

  @override
  Future<UserEntity?> signUp(UserEntity user) async {
    UserEntity? userEntity = await _authRepository.createUserWithEmailAndPassword(user.email!, user.password!);

    if(userEntity!.id != null){
      user.id = userEntity.id;

      await _userRepository.saveUser(user);
    }

    return user;
  }

}