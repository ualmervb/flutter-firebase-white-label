import 'package:flutter_firebase_white_label/app/modules/auth/models/entities/user_entity.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/models/repositories/auth_repository.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/models/repositories/user_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'auth_model.dart';

class AuthModelImpl with AuthModel {

  AuthRepository _authRepository = Modular.get();
  UserRepository _userRepository = Modular.get();


  @override
  Future<UserEntity?> createUserWithEmailAndPassword(String email, String password) {
    return _authRepository.createUserWithEmailAndPassword(email, password);
  }

  @override
  Future<UserEntity?> currentUser() async{
    UserEntity? userEntity = await _authRepository.currentUser();
    if(userEntity != null){
      userEntity = await _userRepository.loadUserWithEmailAndPassword(userEntity);
    }
    return userEntity;
  }

  @override
  Future<UserEntity?> signInWithEmailAndPassword(String email, String password) async {
    UserEntity? userEntity = await _authRepository.signInWithEmailAndPassword(email, password);
    userEntity = await _userRepository.loadUserWithEmailAndPassword(userEntity!);
    return userEntity;
  }

  @override
  Future<void> signOut()  {
    return _authRepository.signOut();
  }

  @override
  Future<void> resendEmailVerification() {
    return _authRepository.resendEmailVerification();
  }

  @override
  Future<void> sendPasswordResetEmail(String email) {
    print(email);
    return _authRepository.sendPasswordResetEmail(email);
  }

}