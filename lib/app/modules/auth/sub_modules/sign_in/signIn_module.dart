import 'package:flutter_firebase_white_label/app/modules/auth/sub_modules/sign_in/views/signIn_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'controllers/signIn_store.dart';

class SignInModule extends Module {

  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SignInStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => SignInPage()),
  ];
}
