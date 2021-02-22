import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:isj_mobility/widgets/customTextField.dart';
import 'package:isj_mobility/widgets/loading.dart';

class Register extends StatefulWidget {
  final Function visible;
  Register(this.visible);
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String err = "";
  bool _loading = false;
  CustomTextField emailText = new CustomTextField(
    title: "Email",
    placeholder: "Enter email",
  );
  CustomTextField nameText = new CustomTextField(
    title: "Name",
    placeholder: "Enter name",
  );
  void register(String name, String email, String pass)async{
    setState(() {
      _loading = true;
    });
    final response = await http.post("https://ordinaire-neutrons.000webhostapp.com/flutterMysql/register.php", body: {
      "name":name,
      "email":email,
      "pass":pass
    });
    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      var result = data['data'];
      int succes = result[1];
      if(succes == 1){
        setState(() {
          err = result[0];
          _loading = false;
        });
      }else{
        setState(() {
          err = result[0];
          _loading = false;
        });
      }
    }
  }
  CustomTextField passText = new CustomTextField(
      title: "Password", placeholder: "***********", ispass: true);
    CustomTextField confirmPassText = new CustomTextField(
      title: "Confirm Password", placeholder: "***********", ispass: true);
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    emailText.err = "enter email";
    nameText.err = "enter name";
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
                              "Register",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[900]),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            nameText.textfrofield(),
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
                            confirmPassText.textfrofield(),
                            SizedBox(
                              height: 10,
                            ),
                            RaisedButton(
                                onPressed: () {
                                  if(_key.currentState.validate()){
                                    if(passText.value == confirmPassText.value){
                                      register(nameText.value,emailText.value,passText.value);
                                    }else{
                                      print("les mots de passes sont différents");
                                    }
                                  }
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  "Register",
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
                                      "Login",
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
