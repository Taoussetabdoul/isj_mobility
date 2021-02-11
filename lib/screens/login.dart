import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

import 'home.dart';

const users = const {
  'dribbble@gmail.com': '12345',
  'admin@test.cm': 'admin',
};

class Login extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String> _authUser(LoginData data) {
    print('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'Username not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'Username not exists';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body : Container (
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/isj_uni.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child :
          FlutterLogin(
            title: 'BIENVENUE',
            logo: "images/logo_isj.jpg",
            onLogin: _authUser,
            onSignup: _authUser,
            theme: LoginTheme(
              primaryColor: Colors.indigo,
              pageColorLight: Colors.transparent,
              pageColorDark: Colors.transparent,
            ),
            onSubmitAnimationCompleted: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => Home(),
              ));
            },
            onRecoverPassword: _recoverPassword,
          ),
      ),
    );
  }

}