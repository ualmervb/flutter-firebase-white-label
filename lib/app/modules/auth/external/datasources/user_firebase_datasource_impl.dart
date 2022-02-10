import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/domain/entities/user_entity.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/infra/datasources/user_datasource.dart';

class UserFirebaseDataSourceImpl with UserDataSource{
  @override
  Future<UserEntity?> saveUser(UserEntity userEntity) async{

    await FirebaseFirestore.instance.collection("user").doc(userEntity.id).set(userEntity.toJson());
  }

  @override
  Future<UserEntity?> loadUser(UserEntity userEntity) async{


    final DocumentSnapshot docUser = await FirebaseFirestore.instance.collection("user").doc(userEntity.id).get();



    if(docUser.exists){
      userEntity = userEntity.copyWith(name: docUser['name'], phone: docUser['phone']);
    }

    return userEntity;

  }

}