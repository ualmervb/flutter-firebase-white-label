import 'package:flutter_firebase_white_label/app/modules/auth/domain/entities/user_entity.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/domain/usecases/sign_up.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/domain/errors/firebase_errors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import 'package:mobx/mobx.dart';


part 'signUp_store.g.dart';

class SignUpStore = _SignUpStoreBase with _$SignUpStore;
abstract class _SignUpStoreBase with Store {

  SignUp _signUp = Modular.get();

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
  String name = "";

  @action
  void setName(String value) {
    name = value;
    setNameError(null);
  }

  @observable
  String phone = "";

  @action
  void setPhone(String value) {
    phone = value;
    setPhoneError(null);
  }

  @observable
  String confirmPassword = "";

  @action
  void setConfirmPassword(String value) {
    confirmPassword = value;
    setConfirmPasswordError(null);
  }

  @observable
  String signUpError = "";

  @action
  void setSignUpError(String value) => signUpError = value;

  @observable
  String? emailError;

  @action
  void setEmailError(String? value) => emailError = value;

  @observable
  String? passwordError;

  @action
  void setPasswordError(String? value) => passwordError = value;

  @observable
  String? nameError;

  @action
  void setNameError(String? value) => nameError = value;

  @observable
  String? phoneError;

  @action
  void setPhoneError(String? value) => phoneError = value;

  @observable
  String? confirmPasswordError;

  @action
  void setConfirmPasswordError(String? value) => confirmPasswordError = value;

  @observable
  bool passwordVisible = false;

  @action
  void togglePasswordVisibility() => passwordVisible = !passwordVisible;

  @observable
  bool confirmPasswordVisible = false;

  @action
  void toggleConfirmPasswordVisibility() => confirmPasswordVisible = !confirmPasswordVisible;

  @observable
  bool loading = false;

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
    } else if(confirmPassword.trim() != "" && !userEntity.isConfirmPasswordValid){
      setConfirmPasswordError("passwords-dont-match".i18n());
    }else {
      setPasswordError(null);
      setConfirmPasswordError(null);
    }
  }

  @action
  validateName() {
    if (!userEntity.isNameValid) {
      setNameError("invalid-name".i18n());
    }else if(!userEntity.isFullName){
      setNameError("invalid-full-name".i18n());
    }
    else {
      setNameError(null);
    }
  }

  @action
  validatePhone() {
    if (!userEntity.isPhoneValid) {
      setPhoneError("invalid-phone".i18n());
    } else {
      setPhoneError(null);
    }
  }

  @action
  validateConfirmPassword() {
    if (!userEntity.isConfirmPasswordValid) {
      setConfirmPasswordError("passwords-dont-match".i18n());
    } else {
      setConfirmPasswordError(null);
    }
  }

  @computed
  UserEntity get userEntity => UserEntity(email: email, password: password, name: name, phone: phone, confirmPassword: confirmPassword);

  @computed
  bool get isFormValid => userEntity.isEmailValid && userEntity.isPasswordValid && userEntity.isNameValid && userEntity.isPhoneValid && userEntity.isFullName && userEntity.isConfirmPasswordValid && !loading;

  @action
  Future<void> signUp() async {
    loading = true;

    try {
      UserEntity? _user = await _signUp.call(userEntity);
      loading = false;
      setSignUpError("");
      Modular.to.pushReplacementNamed("/auth/notEmailVerifying");
    } on FirebaseAuthException catch (e) {
      loading = false;
      print(e.code);
      setSignUpError(getErrorString(e.code));
      //signInError = e.code;
    }
  }

}