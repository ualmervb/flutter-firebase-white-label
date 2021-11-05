import 'package:flutter_firebase_white_label/app/modules/auth/models/entities/user_entity.dart';

abstract class AuthRepository{
  Future<UserEntity?> currentUser();
  Future<UserEntity?> signInWithEmailAndPassword(String email, String passwrod);
  Future<UserEntity?> createUserWithEmailAndPassword(String email, String password);
  Future<void> signOut();
  Future<void> resendEmailVerification();
  Future<void> sendPasswordResetEmail(String email);
  Future<UserEntity?> signInWithGoogle();
}
