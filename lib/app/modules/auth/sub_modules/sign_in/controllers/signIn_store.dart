import 'package:flutter_firebase_white_label/app/modules/auth/controllers/auth_store.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/helpers/firebase_errors.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/models/auth_model.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/models/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import 'package:mobx/mobx.dart';

part 'signIn_store.g.dart';

class SignInStore = _SignInStoreBase with _$SignInStore;

abstract class _SignInStoreBase with Store {
  AuthModel _authModel = Modular.get();
  AuthStore _authStore = Modular.get();

  @observable
  String email = "";

  @action
  void setEmail(String value) {
    email = value;
    setEmailError(null);
  }

  @observable
  String password = "";

  @action
  void setPassword(String value) {
    password = value;
    setPasswordError(null);
  }

  @observable
  bool passwordVisible = false;

  @action
  void togglePasswordVisibility() => passwordVisible = !passwordVisible;

  @observable
  bool loading = false;

  @observable
  bool loadingGoogle = false;

  @observable
  String signInError = "";

  @action
  void setSignInError(String value) => signInError = value;

  @observable
  String? emailError;

  @action
  void setEmailError(String? value) => emailError = value;

  @observable
  String? passwordError;

  @action
  void setPasswordError(String? value) => passwordError = value;

  @action
  void validateEmail() {
    if (!userEntity.isEmailValid) {
      setEmailError("invalid-email".i18n());
    } else {
      setEmailError(null);
    }
  }

  @action
  validatePassword() {
    if (!userEntity.isPasswordValid) {
      setPasswordError("invalid-password".i18n());
    } else {
      setPasswordError(null);
    }
  }

  @computed
  UserEntity get userEntity => UserEntity(email: email, password: password);

  @computed
  bool get isFormValid => userEntity.isEmailValid && userEntity.isPasswordValid && !loading;

  @action
  Future<void> signInWithEmailAndPassword() async {
    loading = true;

    try {
      UserEntity? _user =
          await _authModel.signInWithEmailAndPassword(email, password);

      loading = false;
      _authStore.setUserModel(_user!);
      if(_user.emailVerified!){
        Modular.to.pushReplacementNamed("/home/");
      }else{
        Modular.to.pushReplacementNamed("/auth/notEmailVerifying");
      }
    } on FirebaseAuthException catch (e) {
      loading = false;
      setSignInError(getErrorString(e.code));
    }
  }
  @action
  Future<void> signInWithGoogle() async {
    loadingGoogle = false;
    print("teste");

    try{
      loadingGoogle = true;

      UserEntity? _user =  await _authModel.signInWithGoogle();

      loadingGoogle = false;

    } on FirebaseAuthException catch (e) {
      loadingGoogle = false;
      setSignInError(getErrorString(e.code));
    }

  }
}
