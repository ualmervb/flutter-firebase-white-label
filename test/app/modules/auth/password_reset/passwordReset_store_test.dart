import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/sub_modules/password_reset/controllers/passwordReset_store.dart';
 
void main() {
  late PasswordResetStore store;

  setUpAll(() {
    store = PasswordResetStore();
  });

  /*test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  })*/
}