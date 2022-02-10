import 'package:flutter_firebase_white_label/app/modules/auth/presenter/pages/auth/auth_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

class SplashScreenPage extends StatefulWidget {
  final String title;
  const SplashScreenPage({Key? key, this.title = 'SplashScreenPage'}) : super(key: key);
  @override
  SplashScreenPageState createState() => SplashScreenPageState();
}
class SplashScreenPageState extends State<SplashScreenPage> {

  ReactionDisposer? disposer;
  AuthStore authStore = Modular.get();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    disposer = autorun((_) async {
      await authStore.checkSignIn();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}