import 'package:flutter_firebase_white_label/app/modules/auth/domain/entities/user_entity.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class SignInWithGoogle{
  Future<UserEntity?> call();
}

class SignInWithGoogleImpl implements SignInWithGoogle{

  AuthRepository _authRepository = Modular.get();

  @override
  Future<UserEntity?> call() async{

    UserEntity? userLogged = await  _authRepository.signInWithGoogle();

    return userLogged;
  }

}