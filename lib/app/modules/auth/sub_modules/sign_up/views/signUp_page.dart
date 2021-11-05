import 'package:flutter_firebase_white_label/app/modules/auth/sub_modules/sign_up/controllers/signUp_store.dart';
import 'package:flutter/services.dart';
import 'package:flutter_firebase_white_label/app/modules/auth/views/components/signin_button.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import 'package:flutter/material.dart';
import 'package:brasil_fields/brasil_fields.dart';

class SignUpPage extends StatefulWidget {
  final String title;
  const SignUpPage({Key? key, this.title = 'SignUpPage'}) : super(key: key);
  @override
  SignUpPageState createState() => SignUpPageState();
}
class SignUpPageState extends State<SignUpPage> {
  final SignUpStore signUpStore = Modular.get();

  FocusNode? _focusEmail;
  FocusNode? _focusPassword;
  FocusNode? _focusName;
  FocusNode? _focusPhone;
  FocusNode? _focusConfirmPassword;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _focusEmail = FocusNode();
    _focusPassword = FocusNode();
    _focusName = FocusNode();
    _focusPhone = FocusNode();
    _focusConfirmPassword = FocusNode();

    _focusEmail!.addListener(() {
      if (!_focusEmail!.hasFocus) {
        signUpStore.validateEmail();
      }
    });

    _focusPassword!.addListener(() {
      if (!_focusPassword!.hasFocus) {
        signUpStore.validatePassword();
      }
    });

    _focusName!.addListener(() {
      if (!_focusName!.hasFocus) {
        signUpStore.validateName();
      }
    });

    _focusPhone!.addListener(() {
      if (!_focusPhone!.hasFocus) {
        signUpStore.validatePhone();
      }
    });

    _focusConfirmPassword!.addListener(() {
      if (!_focusConfirmPassword!.hasFocus) {
        signUpStore.validateConfirmPassword();
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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child:  Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

        Expanded(
        child: Center(
        child: SingleChildScrollView(
        child: Column(
        children: [

              Observer(
                builder: (_) {
                  return TextField(
                    onChanged: signUpStore.setName,
                    enabled: !signUpStore.loading,
                    focusNode: _focusName,
                    onEditingComplete: signUpStore.validateName,
                    onSubmitted: (_){
                      signUpStore.validateName();
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      errorText: signUpStore.nameError,
                      labelText: 'name'.i18n().toUpperCase(),
                      prefixIcon: Icon(Icons.account_circle),
                    ),
                    textAlignVertical: TextAlignVertical.center,
                  );
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Observer(
                builder: (_) {
                  return TextField(
                    onChanged: signUpStore.setPhone,
                    enabled: !signUpStore.loading,
                    focusNode: _focusPhone,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly, TelefoneInputFormatter()],
                    onEditingComplete: signUpStore.validatePhone,
                    onSubmitted: (_){
                      signUpStore.validatePhone();
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      errorText: signUpStore.phoneError,
                      labelText: 'phone'.i18n().toUpperCase(),
                      prefixIcon: Icon(Icons.account_circle),

                    ),
                    textAlignVertical: TextAlignVertical.center,
                  );
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Observer(
                builder: (_) {
                  return TextField(
                    keyboardType: TextInputType.emailAddress,
                    onChanged: signUpStore.setEmail,
                    enabled: !signUpStore.loading,
                    focusNode: _focusEmail,
                    onEditingComplete: signUpStore.validateEmail,
                    onSubmitted: (_){
                      signUpStore.validateEmail();
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      errorText: signUpStore.emailError,
                      labelText: 'email'.i18n().toUpperCase(),
                      prefixIcon: Icon(Icons.account_circle),
                    ),
                    textAlignVertical: TextAlignVertical.center,
                  );
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Observer(
                builder: (_) {
                  return TextField(
                    obscureText: !signUpStore.passwordVisible,
                    onChanged: signUpStore.setPassword,
                    enabled: !signUpStore.loading,
                    focusNode: _focusPassword,
                    onEditingComplete: signUpStore.validatePassword,
                    onSubmitted: (_){
                      signUpStore.validatePassword();
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        errorText: signUpStore.passwordError,
                        labelText: "password".i18n().toUpperCase(),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: ClipRRect(
                          borderRadius: BorderRadius.circular(32),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              child: Icon(
                                signUpStore.passwordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onTap: signUpStore.togglePasswordVisibility,
                            ),
                          ),
                        )),
                    textAlignVertical: TextAlignVertical.center,
                  );
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Observer(
                builder: (_) {
                  return TextField(
                    obscureText: !signUpStore.confirmPasswordVisible,
                    onChanged: signUpStore.setConfirmPassword,
                    enabled: !signUpStore.loading,
                    focusNode: _focusConfirmPassword,
                    onEditingComplete: signUpStore.validateConfirmPassword,
                    onSubmitted: (_){
                      signUpStore.validateConfirmPassword();
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        errorText: signUpStore.confirmPasswordError,
                        labelText: "confirm-password".i18n().toUpperCase(),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: ClipRRect(
                          borderRadius: BorderRadius.circular(32),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              child: Icon(
                                signUpStore.confirmPasswordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onTap: signUpStore.toggleConfirmPasswordVisibility,
                            ),
                          ),
                        )),
                    textAlignVertical: TextAlignVertical.center,
                  );
                },
              ),
        ]
    )
    )
    )
        ),
              Observer(
                builder: (_) {
                  return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        primary: Theme.of(context).primaryColor,
                        shadowColor:
                        Theme.of(context).primaryColor.withAlpha(100),
                      ),
                      child: signUpStore.loading
                          ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                      )
                          :  Text(
                        'sign-up'.i18n().toUpperCase(),
                        style:
                        TextStyle(color: Colors.white),
                      ),
                      onPressed: signUpStore.isFormValid
                          ? () async {
                        await signUpStore.signUp();
                        if (signUpStore.signUpError != "") {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(
                            content: Text(
                                '${signUpStore.signUpError}'),
                            backgroundColor: Colors.red,
                            duration: Duration(milliseconds: 6000),
                          ));
                        }
                      }
                          : null,
                    );
                },
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: SignInButton(
                      onPressed: (){},
                      text: "sign-in-with-google".i18n().toUpperCase(),
                      loading: false,
                      signInButtonType: SignInButtonType.GOOGLE,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: SignInButton(
                      onPressed: (){},
                      text: "sign-in-with-facebook".i18n().toUpperCase(),
                      loading: false,
                      signInButtonType: SignInButtonType.FACEBOOK,
                    ),
                  ),
                ],
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
                  child: Text('already-have-account'.i18n().toUpperCase(),
                    ),
                ),
              ),
            ],
          ),
      ),
    );
  }
}