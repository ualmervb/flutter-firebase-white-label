import 'package:flutter_firebase_white_label/app/modules/auth/helpers/firebase_errors.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/models/auth_model.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/models/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/src/extension.dart';
import 'package:mobx/mobx.dart';

part 'passwordReset_store.g.dart';

class PasswordResetStore = _PasswordResetStoreBase with _$PasswordResetStore;
abstract class _PasswordResetStoreBase with Store {

  AuthModel _authModel = Modular.get();

  @observable
  String email = "";

  @action
  void setEmail(String value) {
    email = value;
    setEmailError(null);
  }

  @observable
  String? emailError;

  @action
  void setEmailError(String? value) => emailError = value;

  @action
  void validateEmail() {
    if (!userEntity.isEmailValid) {
      setEmailError("invalid-email".i18n());
    } else {
      setEmailError(null);
    }
  }

  @computed
  UserEntity get userEntity => UserEntity(email: email);

  @computed
  bool get isFormValid => userEntity.isEmailValid && !loading;

  @observable
  bool loading = false;

  @observable
  String sendPasswordResetEmailError = "";

  @action
  void setSendPasswordResetEmailError(String value) => sendPasswordResetEmailError = value;

  Future<void> sendPasswordResetEmail() async{
    try{
      loading = true;
      await _authModel.sendPasswordResetEmail(email);
      loading = false;
    } on FirebaseAuthException catch (e) {
      loading = false;
      setSendPasswordResetEmailError(getErrorString(e.code));
    }
  }
}