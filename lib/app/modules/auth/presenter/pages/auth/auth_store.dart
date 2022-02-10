import 'package:flutter_firebase_white_label/app/modules/auth/domain/entities/user_entity.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/domain/usecases/current_user.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/domain/usecases/sign_out.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;
abstract class _AuthStoreBase with Store {

  @observable
  UserEntity? user;

  SignOut _signOutUseCase = Modular.get();
  CurrentUser _currentUser = Modular.get();

  void setUserModel(UserEntity value){
    user = value;
  }

  @action
  Future<bool> checkSignIn() async{

    UserEntity? _user = await _currentUser.call();

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
    await _signOutUseCase.call();
    Modular.to.pushReplacementNamed("/auth/");
  }
}