import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../models/auth_model.dart';
import '../models/entities/user_entity.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;
abstract class _AuthStoreBase with Store {

  @observable
  UserEntity? user;

  AuthModel _authModel = Modular.get();

  void setUserModel(UserEntity value){
    user = value;
  }

  @action
  Future<bool> checkSignIn() async{

    UserEntity? _user = await _authModel.currentUser();

    if(_user != null){
      setUserModel(_user);
      if(_user.emailVerified!){
        Modular.to.pushReplacementNamed("/home/");
      }else{
        Modular.to.pushReplacementNamed("/auth/notEmailVerifying");
      }
    }else{
      Modular.to.pushReplacementNamed("/auth/");
    }

    return true;
  }

  @action
  signOut() async{
    await _authModel.signOut();
    Modular.to.pushReplacementNamed("/auth/");
  }
}