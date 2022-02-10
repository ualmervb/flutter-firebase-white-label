import 'package:flutter_firebase_white_label/app/modules/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class SignOut{
  Future<void> call();
}

class SignOutImpl implements SignOut{

  AuthRepository _authRepository = Modular.get();

  @override
  Future<void> call() async{

    await  _authRepository.signOut();

  }

}