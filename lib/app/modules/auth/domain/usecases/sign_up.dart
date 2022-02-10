import 'package:flutter_firebase_white_label/app/modules/auth/domain/entities/user_entity.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/domain/repositories/user_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class SignUp{
  Future<UserEntity?> call(UserEntity user);
}

class SignUpImpl implements SignUp{

  UserRepository _userRepository = Modular.get();
  AuthRepository _authRepository = Modular.get();

  @override
  Future<UserEntity?> call(UserEntity user) async{

    UserEntity? userEntity = await _authRepository.createUserWithEmailAndPassword(user.email!, user.password!);

    if(userEntity!.id != null){
      user.id = userEntity.id;

      await _userRepository.saveUser(user);
    }
    return user;
  }

}