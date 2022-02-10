import 'package:flutter_firebase_white_label/app/modules/auth/domain/usecases/current_user.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/domain/usecases/resend_email_verification.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/domain/usecases/send_password_reset_email.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/domain/usecases/sign_in_with_email_and_password.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/domain/usecases/sign_in_with_facebook.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/domain/usecases/sign_out.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/external/datasources/auth_firebase_datasource_impl.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/external/datasources/user_firebase_datasource_impl.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/infra/datasources/auth_datasource.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/infra/datasources/user_datasource.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/presenter/pages/auth/auth_store.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/domain/usecases/sign_in_with_google.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/presenter/pages/not_email_verifying/notEmailVerifying_page.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/presenter/pages/not_email_verifying/notEmailVerifying_store.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/presenter/pages/password_reset/passwordReset_page.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/presenter/pages/password_reset/passwordReset_store.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/presenter/pages/sign_in/signIn_page.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/presenter/pages/sign_in/signIn_store.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/presenter/pages/sign_up/signUp_page.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/presenter/pages/sign_up/signUp_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'domain/repositories/auth_repository.dart';
import 'domain/repositories/user_repository.dart';
import 'domain/usecases/sign_up.dart';
import 'infra/repositories/auth_repository_impl.dart';
import 'infra/repositories/user_repository_impl.dart';

class AuthModule extends Module {


  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SignInStore()),
    Bind.lazySingleton((i) => SignUpStore()),
    Bind.lazySingleton((i) => NotEmailVerifyingStore()),
    Bind.lazySingleton((i) => PasswordResetStore()),
    Bind.singleton<AuthDataSource>((i) => AuthFirebaseDataSourceImpl(), export: true),
    Bind.singleton<UserDataSource>((i) => UserFirebaseDataSourceImpl(), export: true),
    Bind.singleton<SignInWithGoogle>((i) => SignInWithGoogleImpl()),
    Bind.singleton<SignInWithFacebook>((i) => SignInWithFacebookImpl()),
    Bind.singleton<SignInWithEmailAndPassword>((i) => SignInWithEmailAndPasswordImpl()),
    Bind.singleton<SignUp>((i) => SignUpImpl()),
    Bind.singleton<SendPasswordResetEmail>((i) => SendPasswordResetEmailImpl()),
    Bind.singleton<ResendEmailVerification>((i) => ResendEmailVerificationImpl()),
    Bind.singleton<SignOut>((i) => SignOutImpl(), export: true),
    Bind.singleton<CurrentUser>((i) => CurrentUserImpl(), export: true),
    Bind.singleton((i) => AuthStore(), export: true),
    Bind.singleton<AuthRepository>((i) => AuthRepositoryImpl(), export: true),
    Bind.singleton<UserRepository>((i) => UserRepositoryImpl(), export: true),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) =>  SignInPage()),
    ChildRoute('/signUp', child: (_, args) =>  SignUpPage()),
    ChildRoute('/notEmailVerifying', child: (_, args) =>  NotEmailVerifyingPage()),
    ChildRoute('/passwordReset', child: (_, args) => PasswordResetPage()),
  ];
}
