import 'package:flutter_firebase_white_label/app/modules/auth/domain/entities/user_entity.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class SignInWithEmailAndPassword{
  Future<UserEntity?> call(String email, String passwrod);
}

class SignInWithEmailAndPasswordImpl implements SignInWithEmailAndPassword{

  AuthRepository _authRepository = Modular.get();

  @override
  Future<UserEntity?> call(String email, String passwrod) async{

    UserEntity? userLogged = await  _authRepository.signInWithEmailAndPassword(email, passwrod);

    return userLogged;
  }

}