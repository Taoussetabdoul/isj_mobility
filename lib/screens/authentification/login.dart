import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:isj_mobility/crypt/encrypt.dart';
import 'package:isj_mobility/model/userModel/userModel.dart';
import 'package:isj_mobility/widgets/customTextField.dart';
import 'package:isj_mobility/widgets/loading.dart';

class Login extends StatefulWidget {
  final Function visible, login;
  Login(this.visible, this.login);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String err = "";
  bool _loading = false;
  void login(String email, String pass) async{
    setState(() {
      err = "";
      _loading = true;
    });
    final response = await http.post("http://192.168.8.101/flutterMysql/login.php", body: {
      "email":encrypt(email),
      "pass":encrypt(pass)
    });
    if(response.statusCode == 200){
      var data = jsonDecode(decrypt(response.body));
      var result = data['data'];
      print(result);
      int succes = result[1];
      if(succes == 1){
        setState(() {
          err = result[0];
          UserModel.saveUser(UserModel.fromJson(result[2]));
          _loading = false;
          widget.login.call();
        });
      }else{
        setState(() {
          err = result[0];
          _loading = false;
        });
      }
    }
  }
  CustomTextField emailText = new CustomTextField(
    title: "Email",
    placeholder: "Enter email",
  );
  CustomTextField passText = new CustomTextField(
      title: "Password", placeholder: "***********", ispass: true);
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    emailText.err = "enter email";
    passText.err = "enter password";
    return _loading?Loading():Scaffold(
      body: Container (
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage("images/isj_uni.jpg"),
        fit: BoxFit.cover,
        ),
        ),
        child :Center(
        child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Container(
              width: MediaQuery.of(context).size.width/4,
              child: new Image.asset("images/logo_isj.jpg"),
            ),
            new Card(
              color: Colors.white,
              child: SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.all(30),
                    child: Form(
                      key: _key,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "ISJ MOBILITY",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[900]),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          emailText.textfrofield(),
                          SizedBox(
                            height: 10,
                          ),
                          passText.textfrofield(),
                          SizedBox(
                            height: 10,
                          ),
                          RaisedButton(
                              onPressed: () async{
                                if(_key.currentState.validate()){
                                  login(emailText.value,passText.value);
                                }
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                "Login",
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                              color: Colors.blue[900].withOpacity(.7)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Avez-vous un compte? '),
                              FlatButton(
                                  onPressed: widget.visible,
                                  child: Text(
                                    "Register",
                                    style: TextStyle(color: Colors.blue[900]),
                                  ))
                            ],
                          ),
                          SizedBox(height: 30,),
                          Text(err, style: TextStyle(color: Colors.blue[900]), textAlign: TextAlign.center,)
                        ],
                      ),
                    )),
              ),
            ),
          ],
      ),
    ),
    ),
    ),
    );
  }
}
