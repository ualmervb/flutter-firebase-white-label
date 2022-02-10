import 'package:brasil_fields/brasil_fields.dart';

class UserEntity {
/*
{
  "email": "email",
  "password": "password"
}
*/
  String? id;
  String? email;
  String? password;
  String? name;
  String? phone;
  String? confirmPassword;
  bool? emailVerified;

  UserEntity({
    this.id,
    this.email,
    this.password,
    this.name,
    this.phone,
    this.confirmPassword,
    this.emailVerified
  });


  bool get isEmailValid => RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
      .hasMatch(email!);

  bool get isPasswordValid => password!.trim().length >= 6;

  bool get isNameValid => name!.length > 3;

  bool get isFullName => name!.trim().split(' ').length > 1;

  bool get isPhoneValid => UtilBrasilFields.obterTelefone(phone!, mascara: false).length == 11;

  bool get isConfirmPasswordValid => password!.compareTo(confirmPassword!) == 0;


  UserEntity copyWith(
      { String? name,
        String? phone}) {
    return UserEntity(
        id: id,
        email: email,
        password: password,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        emailVerified: emailVerified
    );
  }

  UserEntity.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    email = json["email"];
    name = json["name"];
    phone = json["phone"];
    emailVerified = json["emailVerified"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = id;
    data["email"] = email;
    data["name"] = name;
    data["phone"] = phone;
    return data;
  }
}