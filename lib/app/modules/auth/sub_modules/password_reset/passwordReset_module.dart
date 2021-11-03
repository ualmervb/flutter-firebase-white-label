import 'package:flutter_firebase_white_label/app/modules/auth/sub_modules/password_reset/controllers/passwordReset_store.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/sub_modules/password_reset/views/passwordReset_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PasswordResetModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => PasswordResetStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => PasswordResetPage()),
  ];
}
