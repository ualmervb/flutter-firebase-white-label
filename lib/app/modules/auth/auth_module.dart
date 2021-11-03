import 'package:flutter_firebase_white_label/app/modules/auth/controllers/auth_store.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/sub_modules/not_email_verifying/notEmailVerifying_module.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/sub_modules/password_reset/passwordReset_module.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/sub_modules/sign_in/signIn_module.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/sub_modules/sign_up/signUp_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'models/auth_model.dart';
import 'models/auth_model_impl.dart';
import 'models/repositories/auth_firebase_repository_impl.dart';
import 'models/repositories/auth_repository.dart';
import 'models/repositories/user_firebase_repository_impl.dart';
import 'models/repositories/user_repository.dart';
import 'models/user_model.dart';
import 'models/user_model_impl.dart';

class AuthModule extends Module {


  @override
  final List<Bind> binds = [
    Bind.singleton((i) => AuthStore(), export: true),
    Bind.singleton<AuthModel>((i) => AuthModelImpl(), export: true),
    Bind.singleton<UserModel>((i) => UserModelImpl(), export: true),
    Bind.singleton<AuthRepository>((i) => AuthFirebaseRepositoryImpl(), export: true),
    Bind.singleton<UserRepository>((i) => UserFirebaseRepositoryImpl(), export: true),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: SignInModule()),
    ModuleRoute('/signUp', module: SignUpModule()),
    ModuleRoute('/notEmailVerifying', module: NotEmailVerifyingModule()),
    ModuleRoute('/passwordReset', module: PasswordResetModule()),
  ];
}
