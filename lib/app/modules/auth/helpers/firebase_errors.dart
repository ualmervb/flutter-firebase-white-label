import 'package:localization/localization.dart';

String getErrorString(String code){
  switch (code) {
    case 'ERROR_WEAK_PASSWORD':
      return 'ERROR_WEAK_PASSWORD'.i18n();
    case 'invalid-email':
      return 'invalid-email'.i18n();
    case 'email-already-in-use':
      return 'email-already-in-use'.i18n();
    case 'ERROR_INVALID_CREDENTIAL':
      return 'ERROR_INVALID_CREDENTIAL'.i18n();
    case 'wrong-password':
      return 'wrong-password'.i18n();
    case 'user-not-found':
      return 'user-not-found'.i18n();
    case 'user-disabled':
      return 'user-disabled'.i18n();
    case 'too-many-requests':
      return 'too-many-requests'.i18n();
    case 'ERROR_OPERATION_NOT_ALLOWED':
      return 'ERROR_OPERATION_NOT_ALLOWED'.i18n();
    case 'network-request-failed':
      return 'network-request-failed'.i18n();
    case 'account-exists-with-different-credential':
      return 'account-exists-with-different-credential'.i18n();
    case 'invalid-credential':
      return 'invalid-credential'.i18n();

    default:
      return 'undefined-error'.i18n();
  }
}