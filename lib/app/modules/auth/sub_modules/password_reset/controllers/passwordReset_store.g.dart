// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passwordReset_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PasswordResetStore on _PasswordResetStoreBase, Store {
  Computed<UserEntity>? _$userEntityComputed;

  @override
  UserEntity get userEntity =>
      (_$userEntityComputed ??= Computed<UserEntity>(() => super.userEntity,
              name: '_PasswordResetStoreBase.userEntity'))
          .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_PasswordResetStoreBase.isFormValid'))
          .value;

  final _$emailAtom = Atom(name: '_PasswordResetStoreBase.email');

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

  final _$emailErrorAtom = Atom(name: '_PasswordResetStoreBase.emailError');

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

  final _$loadingAtom = Atom(name: '_PasswordResetStoreBase.loading');

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

  final _$sendPasswordResetEmailErrorAtom =
      Atom(name: '_PasswordResetStoreBase.sendPasswordResetEmailError');

  @override
  String get sendPasswordResetEmailError {
    _$sendPasswordResetEmailErrorAtom.reportRead();
    return super.sendPasswordResetEmailError;
  }

  @override
  set sendPasswordResetEmailError(String value) {
    _$sendPasswordResetEmailErrorAtom
        .reportWrite(value, super.sendPasswordResetEmailError, () {
      super.sendPasswordResetEmailError = value;
    });
  }

  final _$_PasswordResetStoreBaseActionController =
      ActionController(name: '_PasswordResetStoreBase');

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_PasswordResetStoreBaseActionController.startAction(
        name: '_PasswordResetStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_PasswordResetStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmailError(String? value) {
    final _$actionInfo = _$_PasswordResetStoreBaseActionController.startAction(
        name: '_PasswordResetStoreBase.setEmailError');
    try {
      return super.setEmailError(value);
    } finally {
      _$_PasswordResetStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateEmail() {
    final _$actionInfo = _$_PasswordResetStoreBaseActionController.startAction(
        name: '_PasswordResetStoreBase.validateEmail');
    try {
      return super.validateEmail();
    } finally {
      _$_PasswordResetStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSendPasswordResetEmailError(String value) {
    final _$actionInfo = _$_PasswordResetStoreBaseActionController.startAction(
        name: '_PasswordResetStoreBase.setSendPasswordResetEmailError');
    try {
      return super.setSendPasswordResetEmailError(value);
    } finally {
      _$_PasswordResetStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
emailError: ${emailError},
loading: ${loading},
sendPasswordResetEmailError: ${sendPasswordResetEmailError},
userEntity: ${userEntity},
isFormValid: ${isFormValid}
    ''';
  }
}
