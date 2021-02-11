import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


  class AjoutCovoiturage extends StatelessWidget{

    AjoutCovoiturage(String title){
      this.title = title;
    }

    String title;

    @override
    Widget build(BuildContext context){
        return new Scaffold(
            backgroundColor: Colors.white,
            appBar: new AppBar(
              title: new Text(title),
              backgroundColor: Colors.blue[900],
            ),
            body : new Center(
              child: AjoutCovoiturageP(),
          ),
        );
    }

  }

class AjoutCovoiturageP extends StatefulWidget {
  AjoutCovoiturageP({Key key}) : super(key: key);


  @override
  _AjoutCovoiturage createState() => _AjoutCovoiturage();
}

class _AjoutCovoiturage extends State<AjoutCovoiturageP> {
  @override
  Widget build(BuildContext context) {
    return new  ListView(
      padding: EdgeInsets.all(10),
      children: <Widget>[
        new TextField(
          cursorColor: Colors.blue[900],
          onSubmitted : (String string){
            setState((){
              submitDepart = string;
            });
          },
          decoration: new InputDecoration(
            labelText: 'Lieu de Depart',
          ),
        ),
        new TextField(
          cursorColor: Colors.blue[900],
          onSubmitted : (String string){
            setState((){
              submitDestination = string;
            });
          },
          decoration: new InputDecoration(
            labelText: 'Lieu de destination',
          ),
        ),
        new Text( 'Heure de Depart: ',
          style: new TextStyle(
            fontSize: 15.0,
          ),
        ),
        new FlatButton(
          color: Colors.blue[100],
          child: new Row (
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Text( (timeDepart==null)? '--:--' : timeDepart.format(context),
                style: new TextStyle(
                  fontSize: 20.0,
                ),
              ),
              new Icon(Icons.access_time,
                color : Colors.grey,
              ),
            ],
          ),
          onPressed : HeureDepart,
        ),
        new Text( 'Heure de Retour: ',
          style: new TextStyle(
            fontSize: 15.0,
          ),
        ),
        new FlatButton(
          color: Colors.blue[100],
          child: new Row (
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Text( (timeRetour==null)? '--:--' : timeRetour.format(context),
                style: new TextStyle(
                  fontSize: 20.0,
                ),
              ),
              new Icon(Icons.access_time,
                color : Colors.grey,
              ),
            ],
          ),
          onPressed : HeureRetour,
        ),
        new TextField(
          cursorColor: Colors.blue[900],
          onSubmitted : (String string){
            setState((){
              submitPlace = string;
            });
          },
          decoration: new InputDecoration(
            labelText: 'Nombre de place',
          ),
        ),
        new TextField(
          cursorColor: Colors.blue[900],
          onSubmitted : (String string){
            setState((){
              submittrajet = string;
            });
          },
          decoration: new InputDecoration(
            labelText: 'Type de tajet',
          ),
        ),
        new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: checkList(),
        ),
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            new RaisedButton(
              padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width /6.2, 0, MediaQuery.of(context).size.width /6.2, 0),
              color : Colors.red[400],
              textColor: Colors.white,
              child : new Text('Annuler'),
              onPressed: (){
                print('Annuler');
                Navigator.pop(context);
              },
            ),
            new RaisedButton(
              padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width /6.2, 0, MediaQuery.of(context).size.width /6.2, 0),
              color : Colors.blue[900],
              textColor: Colors.white,
              child : new Text('Proposer'),
              onPressed: (){
                print('Proposer');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ],
    );
  }


  String submitDepart;
  String submitDestination;
  String submitPlace;
  String submittrajet;
  TimeOfDay timeDepart;
  TimeOfDay timeRetour;
  Map check = {
    'Lundi' :false,
    'Mardi' :false,
    'Mercredi' :false,
    'Jeudi' :false,
    'Vendredi' :false,
    'Samedi' :false,
    'Dimanche' :false,
  };

  List<Widget> checkList(){
    List<Widget> l = [];
    check.forEach((key, value){
      Row row = new Row(
        children: <Widget>[
          new Text(key),
          new Checkbox(
            value : (value),
            onChanged: (bool b){
              setState(() {
                check[key] = b;
              });
            },
          ),
        ],
      );
      l.add(row);
    });
    return l;
  }

  Future<Null> HeureDepart() async{
    TimeOfDay heure = await showTimePicker(
      context : context,
      initialTime: new TimeOfDay.now(),);
    if(heure != null){
      setState((){
        timeDepart = heure;
      });
    }
  }

  Future<Null> HeureRetour() async{
    TimeOfDay heure = await showTimePicker(
      context : context,
      initialTime: new TimeOfDay.now(),);
    if(heure != null){
      setState((){
        timeRetour = heure;
      });
    }
  }
}