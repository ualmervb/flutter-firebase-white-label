import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_test/modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/sub_modules/sign_up/signUp_module.dart';
 
void main() {

  setUpAll(() {
    initModule(SignUpModule());
  });
}