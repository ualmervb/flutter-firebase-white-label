import 'package:flutter_firebase_white_label/app/modules/auth/models/entities/user_entity.dart';

abstract class UserRepository{
  Future<UserEntity?> saveUser(UserEntity userEntity);
  Future<UserEntity?> loadUser(UserEntity userEntity);
}