import 'package:flutter_firebase_white_label/app/modules/auth/domain/entities/user_entity.dart';

abstract class UserRepository{
  Future<UserEntity?> saveUser(UserEntity user);
}