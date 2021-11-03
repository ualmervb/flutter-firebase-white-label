import 'package:flutter_firebase_white_label/app/modules/auth/sub_modules/sign_up/controllers/signUp_store.dart';
import 'package:flutter_test/flutter_test.dart';
 
void main() {
  late SignUpStore store;

  setUpAll(() {
    store = SignUpStore();
  });

  /*test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });*/
}