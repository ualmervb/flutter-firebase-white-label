
import 'package:flutter_firebase_white_label/app/modules/auth/domain/entities/user_entity.dart';

abstract class AuthDataSource{
  Future<UserEntity?> currentUser();
  Future<UserEntity?> signInWithEmailAndPassword(String email, String passwrod);
  Future<UserEntity?> createUserWithEmailAndPassword(String email, String password);
  Future<void> signOut();
  Future<void> resendEmailVerification();
  Future<void> sendPasswordResetEmail(String email);
  Future<UserEntity?> signInWithGoogle();
  Future<UserEntity?> signInWithFacebook();
}
