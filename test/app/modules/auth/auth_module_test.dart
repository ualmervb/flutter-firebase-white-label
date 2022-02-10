import 'package:flutter_firebase_white_label/app/modules/auth/domain/errors/firebase_errors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_test/modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/auth_module.dart';
 
void main() async {

  setUpAll(() async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    initModule(AuthModule());
  });


  test('click signIn', () async{


  });

}