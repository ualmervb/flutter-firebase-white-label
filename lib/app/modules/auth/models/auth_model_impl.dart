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
      userEntity = await _userRepository.loadUser(userEntity);
    }
    return userEntity;
  }

  @override
  Future<UserEntity?> signInWithEmailAndPassword(String email, String password) async {
    UserEntity? userEntity = await _authRepository.signInWithEmailAndPassword(email, password);
    userEntity = await _userRepository.loadUser(userEntity!);
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
    return _authRepository.sendPasswordResetEmail(email);
  }

  @override
  Future<UserEntity?> signInWithGoogle() async{
    UserEntity? userLogged = await  _authRepository.signInWithGoogle();

    UserEntity? user = await _userRepository.loadUser(userLogged!);

    print(user);

    if(user == null || user.name == null){

      await _userRepository.saveUser(userLogged);
    }

    return userLogged;

  }

  @override
  Future<UserEntity?> signInWithFacebook() async{
    UserEntity? userLogged = await  _authRepository.signInWithFacebook();

    UserEntity? user = await _userRepository.loadUser(userLogged!);

    print(user);

    if(user == null || user.name == null){

      await _userRepository.saveUser(userLogged);
    }

    return userLogged;
  }

}