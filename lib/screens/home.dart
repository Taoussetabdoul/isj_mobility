import 'package:flutter/material.dart';

import 'homelander/settings.dart';
import 'homelander/souscrip.dart';
import 'homelander/convoit.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {

  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    Souscrip(),
    Convoit(),
    Settings(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: new AppBar(
        title: new Text('ISJ MOBILITY'),
        leading: new Icon(Icons.account_circle),
        actions: <Widget>[
          new Image.asset("images/logo_isj.jpg"),
        ],
        elevation: 10.0,
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: new Center(
           child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Trajets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[900],
        onTap: _onItemTapped,
      ),
    );
  }

}