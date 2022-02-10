import 'package:flutter_firebase_white_label/app/modules/auth/presenter/pages/password_reset/passwordReset_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:localization/src/extension.dart';

class PasswordResetPage extends StatefulWidget {
  final String title;

  const PasswordResetPage({Key? key, this.title = 'PasswordResetPage'})
      : super(key: key);

  @override
  PasswordResetPageState createState() => PasswordResetPageState();
}

class PasswordResetPageState extends State<PasswordResetPage> {
  final PasswordResetStore passwordResetStore = Modular.get();

  FocusNode? _focusEmail;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _focusEmail = FocusNode();

    _focusEmail!.addListener(() {
      if (!_focusEmail!.hasFocus) {
        passwordResetStore.validateEmail();
      }
    });
  }

  @override
  void dispose() {
    _focusEmail!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.black)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(
              height: 16,
            ),
            Text(
              'reset-password'.i18n().toUpperCase(),
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            const SizedBox(
              height: 50,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      'instruction-reset-password'.i18n(),
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Observer(
                      builder: (_) {
                        return TextField(
                          keyboardType: TextInputType.emailAddress,
                          onChanged: passwordResetStore.setEmail,
                          enabled: !passwordResetStore.loading,
                          focusNode: _focusEmail,
                          onEditingComplete: passwordResetStore.validateEmail,
                          onSubmitted: (_) {
                            passwordResetStore.validateEmail();
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            errorText: passwordResetStore.emailError,
                            labelText: 'email'.i18n().toUpperCase(),
                            prefixIcon: Icon(Icons.account_circle),
                          ),
                          textAlignVertical: TextAlignVertical.center,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Observer(
              builder: (_) {
                return SizedBox(
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
                    child: passwordResetStore.loading
                        ? CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                          )
                        : Text(
                            'confirm'.i18n().toUpperCase(),
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                    onPressed: passwordResetStore.isFormValid
                        ? (){_confirmPasswordReset(context);}: null,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _confirmPasswordReset(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context)
    {
      return Card(
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
      ),
          child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'confirm-reset-password'.i18n(),
                    textAlign: TextAlign.left,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'confirm-instruction-reset-password'.i18n(),
                    textAlign: TextAlign.left,
                    style: const TextStyle(fontSize: 15),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: double.infinity,
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
                      child: passwordResetStore.loading
                          ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                      )
                          : Text(
                        'confirm'.i18n().toUpperCase(),
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      onPressed: passwordResetStore.isFormValid
                          ? () async {
                        await passwordResetStore.sendPasswordResetEmail();
                        if (passwordResetStore.sendPasswordResetEmailError !=
                            "") {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                '${passwordResetStore.sendPasswordResetEmailError}'),
                            backgroundColor: Colors.red,
                            duration: Duration(milliseconds: 6000),
                          ));
                        }
                      } : null,
                    ),
                  )
                ],
              ),
            ),


      );
    }
    );
  }

}
