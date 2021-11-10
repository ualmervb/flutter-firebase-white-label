// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signIn_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignInStore on _SignInStoreBase, Store {
  Computed<UserEntity>? _$userEntityComputed;

  @override
  UserEntity get userEntity =>
      (_$userEntityComputed ??= Computed<UserEntity>(() => super.userEntity,
              name: '_SignInStoreBase.userEntity'))
          .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_SignInStoreBase.isFormValid'))
          .value;

  final _$emailAtom = Atom(name: '_SignInStoreBase.email');

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

  final _$passwordAtom = Atom(name: '_SignInStoreBase.password');

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

  final _$passwordVisibleAtom = Atom(name: '_SignInStoreBase.passwordVisible');

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

  final _$loadingAtom = Atom(name: '_SignInStoreBase.loading');

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

  final _$loadingGoogleAtom = Atom(name: '_SignInStoreBase.loadingGoogle');

  @override
  bool get loadingGoogle {
    _$loadingGoogleAtom.reportRead();
    return super.loadingGoogle;
  }

  @override
  set loadingGoogle(bool value) {
    _$loadingGoogleAtom.reportWrite(value, super.loadingGoogle, () {
      super.loadingGoogle = value;
    });
  }

  final _$loadingFacebookAtom = Atom(name: '_SignInStoreBase.loadingFacebook');

  @override
  bool get loadingFacebook {
    _$loadingFacebookAtom.reportRead();
    return super.loadingFacebook;
  }

  @override
  set loadingFacebook(bool value) {
    _$loadingFacebookAtom.reportWrite(value, super.loadingFacebook, () {
      super.loadingFacebook = value;
    });
  }

  final _$signInErrorAtom = Atom(name: '_SignInStoreBase.signInError');

  @override
  String get signInError {
    _$signInErrorAtom.reportRead();
    return super.signInError;
  }

  @override
  set signInError(String value) {
    _$signInErrorAtom.reportWrite(value, super.signInError, () {
      super.signInError = value;
    });
  }

  final _$emailErrorAtom = Atom(name: '_SignInStoreBase.emailError');

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

  final _$passwordErrorAtom = Atom(name: '_SignInStoreBase.passwordError');

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

  final _$signInWithEmailAndPasswordAsyncAction =
      AsyncAction('_SignInStoreBase.signInWithEmailAndPassword');

  @override
  Future<void> signInWithEmailAndPassword() {
    return _$signInWithEmailAndPasswordAsyncAction
        .run(() => super.signInWithEmailAndPassword());
  }

  final _$signInWithGoogleAsyncAction =
      AsyncAction('_SignInStoreBase.signInWithGoogle');

  @override
  Future<void> signInWithGoogle() {
    return _$signInWithGoogleAsyncAction.run(() => super.signInWithGoogle());
  }

  final _$signInWithFacebookAsyncAction =
      AsyncAction('_SignInStoreBase.signInWithFacebook');

  @override
  Future<void> signInWithFacebook() {
    return _$signInWithFacebookAsyncAction
        .run(() => super.signInWithFacebook());
  }

  final _$_SignInStoreBaseActionController =
      ActionController(name: '_SignInStoreBase');

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_SignInStoreBaseActionController.startAction(
        name: '_SignInStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_SignInStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_SignInStoreBaseActionController.startAction(
        name: '_SignInStoreBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_SignInStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void togglePasswordVisibility() {
    final _$actionInfo = _$_SignInStoreBaseActionController.startAction(
        name: '_SignInStoreBase.togglePasswordVisibility');
    try {
      return super.togglePasswordVisibility();
    } finally {
      _$_SignInStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSignInError(String value) {
    final _$actionInfo = _$_SignInStoreBaseActionController.startAction(
        name: '_SignInStoreBase.setSignInError');
    try {
      return super.setSignInError(value);
    } finally {
      _$_SignInStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmailError(String? value) {
    final _$actionInfo = _$_SignInStoreBaseActionController.startAction(
        name: '_SignInStoreBase.setEmailError');
    try {
      return super.setEmailError(value);
    } finally {
      _$_SignInStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPasswordError(String? value) {
    final _$actionInfo = _$_SignInStoreBaseActionController.startAction(
        name: '_SignInStoreBase.setPasswordError');
    try {
      return super.setPasswordError(value);
    } finally {
      _$_SignInStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateEmail() {
    final _$actionInfo = _$_SignInStoreBaseActionController.startAction(
        name: '_SignInStoreBase.validateEmail');
    try {
      return super.validateEmail();
    } finally {
      _$_SignInStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic validatePassword() {
    final _$actionInfo = _$_SignInStoreBaseActionController.startAction(
        name: '_SignInStoreBase.validatePassword');
    try {
      return super.validatePassword();
    } finally {
      _$_SignInStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
passwordVisible: ${passwordVisible},
loading: ${loading},
loadingGoogle: ${loadingGoogle},
loadingFacebook: ${loadingFacebook},
signInError: ${signInError},
emailError: ${emailError},
passwordError: ${passwordError},
userEntity: ${userEntity},
isFormValid: ${isFormValid}
    ''';
  }
}
