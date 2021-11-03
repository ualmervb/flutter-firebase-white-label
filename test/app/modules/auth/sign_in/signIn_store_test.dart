import 'package:flutter_firebase_white_label/app/modules/auth/sub_modules/sign_in/controllers/signIn_store.dart';
import 'package:flutter_test/flutter_test.dart';

 
void main() {
  late SignInStore store;

  setUpAll(() {
    store = SignInStore();
  });

  /*test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });*/
}