import 'package:flutter_firebase_white_label/app/modules/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class SendPasswordResetEmail{
  Future<void> call(String email);
}

class SendPasswordResetEmailImpl implements SendPasswordResetEmail{

  AuthRepository _authRepository = Modular.get();

  @override
  Future<void> call(String email) async{

    await  _authRepository.sendPasswordResetEmail(email);

  }

}