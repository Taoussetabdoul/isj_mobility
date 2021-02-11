import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Settings extends StatefulWidget {
  Settings({Key key}) : super(key: key);


  @override
  _Settings createState() => _Settings();
}


class _Settings extends State<Settings> {

  final TextEditingController _emailFilter = new TextEditingController();
  final TextEditingController _nomFilter = new TextEditingController();
  final TextEditingController _adressFilter = new TextEditingController();
  final TextEditingController _prenomFilter = new TextEditingController();
  final TextEditingController _telephoneFilter = new TextEditingController();
  String _nom;
  String _email;
  String _adress;
  String _prenom;
  String _telephone;

  @override
  Widget build(BuildContext context) {
    return new Center(
      child : new Card(
        color: Colors.white,
        child: new ListView(
          padding: EdgeInsets.all(10),
          children: <Widget>[
            new TextField(
              cursorColor: Colors.blue[900],
              controller: _nomFilter,
              decoration: new InputDecoration(
                labelText: 'Nom',
              ),
            ),
            new TextField(
              cursorColor: Colors.blue[900],
              controller: _emailFilter,
              decoration: new InputDecoration(
                labelText: 'Email',
              ),
            ),
            new TextField(
              cursorColor: Colors.blue[900],
              controller: _prenomFilter,
              decoration: new InputDecoration(
                labelText: 'Prenom',
              ),
            ),
            new TextField(
              cursorColor: Colors.blue[900],
              controller: _adressFilter,
              decoration: new InputDecoration(
                labelText: 'Adresse',
              ),
            ),
            new TextField(
              keyboardType: TextInputType.text,
              cursorColor: Colors.blue[900],
              controller: _telephoneFilter,
              decoration: new InputDecoration(
                labelText: 'Telephone',
              ),
            ),
          ],
        ),
      ),
    );
  }

}