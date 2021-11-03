import 'package:flutter_firebase_white_label/app/modules/auth/helpers/firebase_errors.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/models/auth_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'notEmailVerifying_store.g.dart';

class NotEmailVerifyingStore = _NotEmailVerifyingStoreBase with _$NotEmailVerifyingStore;
abstract class _NotEmailVerifyingStoreBase with Store {

  AuthModel _authModel = Modular.get();

  @observable
  bool loading = false;

  @observable
  String resendEmailError = "";

  @action
  void setResendEmailError(String value) => resendEmailError = value;

  Future<void> resendEmailVerification() async{
    try{
      loading = true;
      await _authModel.resendEmailVerification();
      loading = false;
    } on FirebaseAuthException catch (e) {
      loading = false;
      setResendEmailError(getErrorString(e.code));
    }
  }

}