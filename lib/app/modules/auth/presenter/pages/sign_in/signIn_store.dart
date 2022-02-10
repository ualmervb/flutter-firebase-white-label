import 'package:flutter_firebase_white_label/app/modules/auth/domain/entities/user_entity.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/domain/usecases/sign_in_with_email_and_password.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/domain/usecases/sign_in_with_facebook.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/domain/usecases/sign_in_with_google.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/domain/errors/firebase_errors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import 'package:mobx/mobx.dart';

part 'signIn_store.g.dart';

class SignInStore = _SignInStoreBase with _$SignInStore;

abstract class _SignInStoreBase with Store {
  SignInWithGoogle _authGoogle = Modular.get();
  SignInWithFacebook _authFacebook = Modular.get();
  SignInWithEmailAndPassword _authEmail = Modular.get();

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
  bool loadingFacebook = false;

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
          await _authEmail.call(email, password);

      loading = false;
      //_authStore.setUserModel(_user!);
      if(_user!.emailVerified!){
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

    try{
      loadingGoogle = true;

      UserEntity? _user =  await _authGoogle.call();

      loadingGoogle = false;

      //_authStore.setUserModel(_user!);
      if(_user!.emailVerified!){
        Modular.to.pushReplacementNamed("/home/");
      }else{
        Modular.to.pushReplacementNamed("/auth/notEmailVerifying");
      }

    } on FirebaseAuthException catch (e) {
      loadingGoogle = false;
      setSignInError(getErrorString(e.code));
    }

  }

  @action
  Future<void> signInWithFacebook() async {
    loadingGoogle = false;

    try{
      loadingFacebook = true;

      UserEntity? _user =  await _authFacebook.call();

      loadingFacebook = false;

      //_authStore.setUserModel(_user!);
      if(_user!.emailVerified!){
        Modular.to.pushReplacementNamed("/home/");
      }else{
        Modular.to.pushReplacementNamed("/auth/notEmailVerifying");
      }

    } on FirebaseAuthException catch (e) {
      loadingFacebook = false;
      setSignInError(getErrorString(e.code));
    }

  }
}
