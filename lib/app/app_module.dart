import 'package:flutter_firebase_white_label/app/core/pages/splash_screen_page.dart';
import 'package:flutter_firebase_white_label/app/modules/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/auth/auth_module.dart';



class AppModule extends Module {


  @override
  // TODO: implement imports
  final List<Module> imports = [
    AuthModule(),
  ];

  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => SplashScreenPage()),
    ModuleRoute('/auth', module: AuthModule()),
    ModuleRoute('/home', module: HomeModule()),
  ];

}