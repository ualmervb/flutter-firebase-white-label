import 'package:flutter_firebase_white_label/app/modules/auth/controllers/auth_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'custom/custom_drawer/custom_drawer.dart';
import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {

  AuthStore authStore = Modular.get();

  final PageController pageController = PageController();

  final HomeStore homeStore = Modular.get();

  ReactionDisposer? disposer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    disposer = reaction(
            (_) => homeStore.page,
            (int page) => pageController.jumpToPage(page));
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          drawer: CustomDrawer(),
          appBar: AppBar(
            title: const Text('Home1'),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.exit_to_app),
                tooltip: 'Show Snackbar',
                onPressed: () {
                  authStore.signOut();
                },
              ),
            ]

          ),
        ),
        Scaffold(
          drawer: CustomDrawer(),
          appBar: AppBar(
            title: const Text('Home2'),
          ),
        ),
        Scaffold(
          drawer: CustomDrawer(),
          appBar: AppBar(
            title: const Text('Home3'),
          ),
        ),
        Scaffold(
          drawer: CustomDrawer(),
          appBar: AppBar(
            title: const Text('Home4'),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    disposer!();
    super.dispose();
  }
}
