// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notEmailVerifying_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NotEmailVerifyingStore on _NotEmailVerifyingStoreBase, Store {
  final _$loadingAtom = Atom(name: '_NotEmailVerifyingStoreBase.loading');

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

  final _$resendEmailErrorAtom =
      Atom(name: '_NotEmailVerifyingStoreBase.resendEmailError');

  @override
  String get resendEmailError {
    _$resendEmailErrorAtom.reportRead();
    return super.resendEmailError;
  }

  @override
  set resendEmailError(String value) {
    _$resendEmailErrorAtom.reportWrite(value, super.resendEmailError, () {
      super.resendEmailError = value;
    });
  }

  final _$_NotEmailVerifyingStoreBaseActionController =
      ActionController(name: '_NotEmailVerifyingStoreBase');

  @override
  void setResendEmailError(String value) {
    final _$actionInfo = _$_NotEmailVerifyingStoreBaseActionController
        .startAction(name: '_NotEmailVerifyingStoreBase.setResendEmailError');
    try {
      return super.setResendEmailError(value);
    } finally {
      _$_NotEmailVerifyingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
resendEmailError: ${resendEmailError}
    ''';
  }
}
