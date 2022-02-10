
import 'package:flutter_firebase_white_label/app/modules/auth/domain/entities/user_entity.dart';

abstract class UserDataSource{
  Future<UserEntity?> saveUser(UserEntity userEntity);
  Future<UserEntity?> loadUser(UserEntity userEntity);
}