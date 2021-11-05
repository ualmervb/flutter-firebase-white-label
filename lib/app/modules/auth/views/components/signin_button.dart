import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum SignInButtonType {FACEBOOK, GOOGLE}

class SignInButton extends StatelessWidget {

  final Function() onPressed;
  final String text;
  final bool loading;
  final SignInButtonType signInButtonType;



  SignInButton({required this.onPressed,
    required this.text,
    required this.loading,
    required this.signInButtonType});

  @override
  Widget build(BuildContext context) {
    return signInButtonType == SignInButtonType.FACEBOOK ? _facebookButton(context): _googleButton(context);
  }

  _googleButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        primary: Colors.white,
        shadowColor:
        Theme.of(context).primaryColor.withAlpha(100),
      ),
      child: this.loading
          ? CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Colors.black54),
      )
          :  Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(
            image: AssetImage("resources/images/google_logo.png"),
            height: 18.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              this.text,
              style: TextStyle(
                  color: Colors.black54,
                  overflow: TextOverflow.ellipsis
              ),
            ),
          )
        ],
      ),
      onPressed: this.onPressed,
    );
  }

  _facebookButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        primary: Colors.blueAccent,
        shadowColor:
        Theme.of(context).primaryColor.withAlpha(100),
      ),
      child: this.loading
          ? CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Colors.white),
      )
          :   Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.facebook,
            color: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              this.text,
              style: TextStyle(
                  color: Colors.white,
                  overflow: TextOverflow.ellipsis
              ),
            ),
          )
        ],
      ),
      onPressed: this.onPressed,
    );
  }
}
