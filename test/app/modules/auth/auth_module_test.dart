import 'package:flutter_firebase_white_label/app/modules/auth/helpers/firebase_errors.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/models/auth_model.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/models/entities/user_entity.dart';
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

    AuthModel auth = Modular.get();

    try{
      UserEntity? user = await auth.signInWithEmailAndPassword("ualmer@gmail.com", "123456");
      print(user!.id);
    }on FirebaseAuthException catch(e){
      print(getErrorString(e.code));
    }
  });

}