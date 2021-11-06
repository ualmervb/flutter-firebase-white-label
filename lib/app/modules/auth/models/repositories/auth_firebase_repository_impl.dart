import 'package:flutter_firebase_white_label/app/modules/auth/models/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'auth_repository.dart';

class AuthFirebaseRepositoryImpl with AuthRepository{

  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  Future<UserEntity?> currentUser() async{
    User? currentUserFirebase = await auth.currentUser;
    UserEntity? currenteUser;
    if(currentUserFirebase != null) {
      currenteUser = UserEntity(id: currentUserFirebase.uid,
                                email: currentUserFirebase.email,
                                emailVerified: currentUserFirebase.emailVerified);
    }

    return currenteUser;
  }

  @override
  Future<UserEntity?> signInWithEmailAndPassword(String email, String password) async{

    final UserCredential credential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password);


    User? currentUserFirebase = credential.user;
    UserEntity? currentUser;
    if (currentUserFirebase != null) {
      currentUser = UserEntity(
          id: currentUserFirebase.uid,
          email: currentUserFirebase.email,
          emailVerified: currentUserFirebase.emailVerified);
    }
    return currentUser;

  }

  @override
  Future<void> signOut() {
    return auth.signOut();
  }

  @override
  Future<UserEntity?> createUserWithEmailAndPassword(String email, String password) async{
    final UserCredential credential = await auth.createUserWithEmailAndPassword(
        email: email, password: password);

    User? currentUserFirebase = credential.user;
    UserEntity? currentUser;
    if (currentUserFirebase != null) {
      currentUserFirebase.sendEmailVerification();
      currentUser = UserEntity(
          id: currentUserFirebase.uid,
          email: currentUserFirebase.email,
          emailVerified: currentUserFirebase.emailVerified);
    }
    return currentUser;

  }

  @override
  Future<void> resendEmailVerification() async{
    User? currentUserFirebase = await auth.currentUser;
    if(currentUserFirebase != null){
      currentUserFirebase.sendEmailVerification();
    }
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    return await auth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<UserEntity?> signInWithGoogle() async{
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication? googleSignInAuthentication = await googleSignInAccount?.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(idToken: googleSignInAuthentication?.idToken, accessToken: googleSignInAuthentication?.accessToken);

    final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

    final User? currentUserFirebase = userCredential.user;

    UserEntity? currentUser;
    if (currentUserFirebase != null) {
      currentUser = UserEntity(
          id: currentUserFirebase.uid,
          email: currentUserFirebase.email,
          emailVerified: currentUserFirebase.emailVerified);
    }
    return currentUser;

  }


  
}