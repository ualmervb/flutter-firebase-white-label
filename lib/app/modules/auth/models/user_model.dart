import 'package:flutter_firebase_white_label/app/modules/auth/models/entities/user_entity.dart';

abstract class UserModel{
  Future<UserEntity?> signUp(UserEntity user);
}