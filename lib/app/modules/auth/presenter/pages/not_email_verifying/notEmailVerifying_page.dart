import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:localization/src/extension.dart';
import 'package:localization/localization.dart';

import 'notEmailVerifying_store.dart';

class NotEmailVerifyingPage extends StatefulWidget {
  final String title;
  const NotEmailVerifyingPage({Key? key, this.title = 'NotEmailVerifyingPage'}) : super(key: key);
  @override
  NotEmailVerifyingPageState createState() => NotEmailVerifyingPageState();
}
class NotEmailVerifyingPageState extends State<NotEmailVerifyingPage> {
  final NotEmailVerifyingStore notEmailVerifyingStore = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            Expanded(child: ListView(

              children: [
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                      'thanks-for-registering'.i18n().toUpperCase(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    )
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'please-check-your-email'.i18n(),
                      textAlign: TextAlign.justify,
                      style: const TextStyle(fontSize: 20),
                    )
                ),
              ],
            )),
            Observer(
              builder: (_) {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        primary: Theme.of(context).primaryColor,
                        shadowColor:
                        Theme.of(context).primaryColor.withAlpha(100),
                      ),
                      child: notEmailVerifyingStore.loading
                          ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                      )
                          :  Text(
                        'resend-email'.i18n().toUpperCase(),
                        style:
                        TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      onPressed: () async {
                        await notEmailVerifyingStore.resendEmailVerification();
                        if (notEmailVerifyingStore.resendEmailError != "") {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(
                            content: Text(
                                '${notEmailVerifyingStore.resendEmailError}'),
                            backgroundColor: Colors.red,
                            duration: Duration(milliseconds: 6000),
                          ));
                        }
                      },
                    ),
                  ),
                );
              },
            ),

            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {
                  Modular.to.pushReplacementNamed("/auth/");
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.only(right: 5)),
                ),
                child: Text('sign-in'.i18n().toUpperCase(),
                  style:
                  TextStyle(fontSize: 18),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}