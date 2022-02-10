// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signUp_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignUpStore on _SignUpStoreBase, Store {
  Computed<UserEntity>? _$userEntityComputed;

  @override
  UserEntity get userEntity =>
      (_$userEntityComputed ??= Computed<UserEntity>(() => super.userEntity,
              name: '_SignUpStoreBase.userEntity'))
          .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_SignUpStoreBase.isFormValid'))
          .value;

  final _$emailAtom = Atom(name: '_SignUpStoreBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_SignUpStoreBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$nameAtom = Atom(name: '_SignUpStoreBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$phoneAtom = Atom(name: '_SignUpStoreBase.phone');

  @override
  String get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  final _$confirmPasswordAtom = Atom(name: '_SignUpStoreBase.confirmPassword');

  @override
  String get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  final _$signUpErrorAtom = Atom(name: '_SignUpStoreBase.signUpError');

  @override
  String get signUpError {
    _$signUpErrorAtom.reportRead();
    return super.signUpError;
  }

  @override
  set signUpError(String value) {
    _$signUpErrorAtom.reportWrite(value, super.signUpError, () {
      super.signUpError = value;
    });
  }

  final _$emailErrorAtom = Atom(name: '_SignUpStoreBase.emailError');

  @override
  String? get emailError {
    _$emailErrorAtom.reportRead();
    return super.emailError;
  }

  @override
  set emailError(String? value) {
    _$emailErrorAtom.reportWrite(value, super.emailError, () {
      super.emailError = value;
    });
  }

  final _$passwordErrorAtom = Atom(name: '_SignUpStoreBase.passwordError');

  @override
  String? get passwordError {
    _$passwordErrorAtom.reportRead();
    return super.passwordError;
  }

  @override
  set passwordError(String? value) {
    _$passwordErrorAtom.reportWrite(value, super.passwordError, () {
      super.passwordError = value;
    });
  }

  final _$nameErrorAtom = Atom(name: '_SignUpStoreBase.nameError');

  @override
  String? get nameError {
    _$nameErrorAtom.reportRead();
    return super.nameError;
  }

  @override
  set nameError(String? value) {
    _$nameErrorAtom.reportWrite(value, super.nameError, () {
      super.nameError = value;
    });
  }

  final _$phoneErrorAtom = Atom(name: '_SignUpStoreBase.phoneError');

  @override
  String? get phoneError {
    _$phoneErrorAtom.reportRead();
    return super.phoneError;
  }

  @override
  set phoneError(String? value) {
    _$phoneErrorAtom.reportWrite(value, super.phoneError, () {
      super.phoneError = value;
    });
  }

  final _$confirmPasswordErrorAtom =
      Atom(name: '_SignUpStoreBase.confirmPasswordError');

  @override
  String? get confirmPasswordError {
    _$confirmPasswordErrorAtom.reportRead();
    return super.confirmPasswordError;
  }

  @override
  set confirmPasswordError(String? value) {
    _$confirmPasswordErrorAtom.reportWrite(value, super.confirmPasswordError,
        () {
      super.confirmPasswordError = value;
    });
  }

  final _$passwordVisibleAtom = Atom(name: '_SignUpStoreBase.passwordVisible');

  @override
  bool get passwordVisible {
    _$passwordVisibleAtom.reportRead();
    return super.passwordVisible;
  }

  @override
  set passwordVisible(bool value) {
    _$passwordVisibleAtom.reportWrite(value, super.passwordVisible, () {
      super.passwordVisible = value;
    });
  }

  final _$confirmPasswordVisibleAtom =
      Atom(name: '_SignUpStoreBase.confirmPasswordVisible');

  @override
  bool get confirmPasswordVisible {
    _$confirmPasswordVisibleAtom.reportRead();
    return super.confirmPasswordVisible;
  }

  @override
  set confirmPasswordVisible(bool value) {
    _$confirmPasswordVisibleAtom
        .reportWrite(value, super.confirmPasswordVisible, () {
      super.confirmPasswordVisible = value;
    });
  }

  final _$loadingAtom = Atom(name: '_SignUpStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$signUpAsyncAction = AsyncAction('_SignUpStoreBase.signUp');

  @override
  Future<void> signUp() {
    return _$signUpAsyncAction.run(() => super.signUp());
  }

  final _$_SignUpStoreBaseActionController =
      ActionController(name: '_SignUpStoreBase');

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction(
        name: '_SignUpStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction(
        name: '_SignUpStoreBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(String value) {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction(
        name: '_SignUpStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(String value) {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction(
        name: '_SignUpStoreBase.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConfirmPassword(String value) {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction(
        name: '_SignUpStoreBase.setConfirmPassword');
    try {
      return super.setConfirmPassword(value);
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSignUpError(String value) {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction(
        name: '_SignUpStoreBase.setSignUpError');
    try {
      return super.setSignUpError(value);
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmailError(String? value) {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction(
        name: '_SignUpStoreBase.setEmailError');
    try {
      return super.setEmailError(value);
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPasswordError(String? value) {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction(
        name: '_SignUpStoreBase.setPasswordError');
    try {
      return super.setPasswordError(value);
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNameError(String? value) {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction(
        name: '_SignUpStoreBase.setNameError');
    try {
      return super.setNameError(value);
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhoneError(String? value) {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction(
        name: '_SignUpStoreBase.setPhoneError');
    try {
      return super.setPhoneError(value);
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConfirmPasswordError(String? value) {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction(
        name: '_SignUpStoreBase.setConfirmPasswordError');
    try {
      return super.setConfirmPasswordError(value);
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void togglePasswordVisibility() {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction(
        name: '_SignUpStoreBase.togglePasswordVisibility');
    try {
      return super.togglePasswordVisibility();
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleConfirmPasswordVisibility() {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction(
        name: '_SignUpStoreBase.toggleConfirmPasswordVisibility');
    try {
      return super.toggleConfirmPasswordVisibility();
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateEmail() {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction(
        name: '_SignUpStoreBase.validateEmail');
    try {
      return super.validateEmail();
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic validatePassword() {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction(
        name: '_SignUpStoreBase.validatePassword');
    try {
      return super.validatePassword();
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic validateName() {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction(
        name: '_SignUpStoreBase.validateName');
    try {
      return super.validateName();
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic validatePhone() {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction(
        name: '_SignUpStoreBase.validatePhone');
    try {
      return super.validatePhone();
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic validateConfirmPassword() {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction(
        name: '_SignUpStoreBase.validateConfirmPassword');
    try {
      return super.validateConfirmPassword();
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
name: ${name},
phone: ${phone},
confirmPassword: ${confirmPassword},
signUpError: ${signUpError},
emailError: ${emailError},
passwordError: ${passwordError},
nameError: ${nameError},
phoneError: ${phoneError},
confirmPasswordError: ${confirmPasswordError},
passwordVisible: ${passwordVisible},
confirmPasswordVisible: ${confirmPasswordVisible},
loading: ${loading},
userEntity: ${userEntity},
isFormValid: ${isFormValid}
    ''';
  }
}
