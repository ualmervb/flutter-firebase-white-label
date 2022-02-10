import 'package:flutter_firebase_white_label/app/modules/auth/domain/entities/user_entity.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/infra/datasources/auth_datasource.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/infra/datasources/user_datasource.dart';
import 'package:flutter_modular/flutter_modular.dart';


class AuthRepositoryImpl with AuthRepository {

  AuthDataSource _authDataSource = Modular.get();
  UserDataSource _userDataSource = Modular.get();


  @override
  Future<UserEntity?> createUserWithEmailAndPassword(String email, String password) {
    return _authDataSource.createUserWithEmailAndPassword(email, password);
  }

  @override
  Future<UserEntity?> currentUser() async{
    UserEntity? userEntity = await _authDataSource.currentUser();
    if(userEntity != null){
      userEntity = await _userDataSource.loadUser(userEntity);
    }
    return userEntity;
  }

  @override
  Future<UserEntity?> signInWithEmailAndPassword(String email, String password) async {
    UserEntity? userEntity = await _authDataSource.signInWithEmailAndPassword(email, password);
    userEntity = await _userDataSource.loadUser(userEntity!);
    return userEntity;
  }

  @override
  Future<void> signOut()  {
    return _authDataSource.signOut();
  }

  @override
  Future<void> resendEmailVerification() {
    return _authDataSource.resendEmailVerification();
  }

  @override
  Future<void> sendPasswordResetEmail(String email) {
    return _authDataSource.sendPasswordResetEmail(email);
  }

  @override
  Future<UserEntity?> signInWithGoogle() async{
    UserEntity? userLogged = await  _authDataSource.signInWithGoogle();

    UserEntity? user = await _userDataSource.loadUser(userLogged!);

    print(user);

    if(user == null || user.name == null){

      await _userDataSource.saveUser(userLogged);
    }

    return userLogged;

  }

  @override
  Future<UserEntity?> signInWithFacebook() async{
    UserEntity? userLogged = await  _authDataSource.signInWithFacebook();

    UserEntity? user = await _userDataSource.loadUser(userLogged!);

    print(user);

    if(user == null || user.name == null){

      await _userDataSource.saveUser(userLogged);
    }

    return userLogged;
  }

}