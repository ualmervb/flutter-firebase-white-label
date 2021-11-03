import 'package:flutter_firebase_white_label/app/modules/auth/sub_modules/not_email_verifying/views/notEmailVerifying_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'controllers/notEmailVerifying_store.dart';

class NotEmailVerifyingModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => NotEmailVerifyingStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => NotEmailVerifyingPage()),
  ];
}
