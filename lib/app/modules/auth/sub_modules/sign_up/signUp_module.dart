import 'package:flutter_firebase_white_label/app/modules/auth/sub_modules/sign_up/views/signUp_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'controllers/signUp_store.dart';

class SignUpModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SignUpStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => SignUpPage()),
  ];
}
