import 'package:flutter_firebase_white_label/app/modules/auth/domain/entities/user_entity.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class CurrentUser{
  Future<UserEntity?> call();
}

class CurrentUserImpl implements CurrentUser{

  AuthRepository _authRepository = Modular.get();

  @override
  Future<UserEntity?> call() async{

    return await  _authRepository.currentUser();

  }

}