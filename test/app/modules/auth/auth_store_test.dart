import 'package:flutter_firebase_white_label/app/modules/auth/controllers/auth_store.dart';
import 'package:flutter_test/flutter_test.dart';
 
void main() {
  late AuthStore store;

  setUpAll(() {
    store = AuthStore();
  });

  /*test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });*/
}