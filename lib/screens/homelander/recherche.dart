import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Recherche extends StatefulWidget {
  Recherche({Key key}) : super(key: key);


  @override
  _Recherche createState() => _Recherche();
}

class _Recherche extends State<Recherche> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          title: new Text("Rechercher un Covoiturage"),
          backgroundColor: Colors.blue[900],
        ),
        body : new Center(
            child : new ListView(
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
                    labelText: 'Depart',
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
                    labelText: 'Destination',
                  ),
                ),
                new Text( 'Heure Depart: ',
                  style: new TextStyle(
                    fontSize: 15.0,
                  ),
                ),
                new FlatButton(
                  color: Colors.blue[100],
                  child: new Row (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text( (time==null)? '--:--' : time.format(context),
                        style: new TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      new Icon(Icons.access_time,
                        color : Colors.pink[400],
                      ),
                    ],
                  ),
                  onPressed : montrerHeure,
                ),
                new RaisedButton(
                  color : Colors.yellow[700],
                  textColor: Colors.white,
                  child : new Text('Rechercher'),
                  onPressed: (){
                    print('Rechercher');
                    Navigator.pop(context);
                    },
                  ),
                new SingleChildScrollView (
                  child : new Card(
                    elevation: 5.0,
                    child: new Container(
                      width: MediaQuery.of(context).size.width /1.05,
                      child : new RaisedButton(
                        color : Colors.white,
                        onLongPress: inCovoiturage,
                        child: new Column(
                          children: <Widget>[
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                new Column(
                                  children: <Widget>[
                                    new Icon(Icons.calendar_today,
                                      color : Colors.pink[400],
                                    ),
                                    new Text("7:00",
                                      style: new TextStyle(
                                        color : Colors.yellow[700],
                                        fontSize: 20.0,),
                                    ),
                                    new Text("8:00",
                                      style: new TextStyle(
                                        color : Colors.yellow[700],
                                        fontSize: 20.0,),
                                    ),
                                    new Icon(Icons.supervised_user_circle_outlined,
                                      color : Colors.pink[400],
                                    ),
                                    new Icon(Icons.drive_eta_rounded,
                                      color : Colors.pink[400],
                                    ),
                                  ],
                                ),
                                new Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    new Text("Aujourd'hui",
                                      style: new TextStyle(
                                        color : Colors.blue[900],
                                        fontSize: 20.0,
                                      ),
                                      maxLines: 1,
                                    ),
                                    new Row(
                                      children : <Widget>[
                                        new Column(
                                          children: <Widget>[
                                            new Icon(Icons.place,
                                              color : Colors.pink[400],
                                            ),
                                            Transform.rotate(
                                              angle: 180 * 3.14 / 180,
                                              child: Icon(
                                                Icons.place,
                                                color: Colors.pink[400],
                                              ),
                                            ),
                                          ],
                                        ),
                                        new Column(
                                          children: <Widget>[
                                            new Text("Carrefour MEEC",
                                              style: new TextStyle(
                                                color : Colors.blue[900],
                                                fontSize: 20.0,
                                              ),
                                              maxLines: 1,
                                            ),
                                            new Text("EYANG",
                                              style: new TextStyle(
                                                color : Colors.blue[900],
                                                fontSize: 20.0,
                                              ),
                                              maxLines: 1,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    new Text("Places disponibles",
                                      style: new TextStyle(
                                        color : Colors.blue[900],
                                        fontSize: 20.0,
                                      ),
                                      maxLines: 1,
                                    ),
                                    new Text("Conducteur",
                                      style: new TextStyle(
                                        color : Colors.blue[900],
                                        fontSize: 20.0,
                                      ),
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            new Text("1000FCFA",
                              style: new TextStyle(
                                color : Colors.blue[900],
                                fontSize: 25.0,
                              ),
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
  }


  String submitDepart;
  String submitDestination;
  TimeOfDay time;


  Future<Null> montrerHeure() async{
    TimeOfDay heure = await showTimePicker(
      context : context,
      initialTime: new TimeOfDay.now(),);
    if(heure != null){
      setState((){
        time = heure;
      });
    }
  }

  Future<Null> inCovoiturage() async {
    return showDialog(
      context : context,
      barrierDismissible: true,
      builder: (BuildContext context){
        return new AlertDialog(
          title :new Text(
            'Voulez-vous participer à ce covoiturage?',
            textAlign: TextAlign.center,
          ),
          content: new Text(
            "Vous allez faire une demande d'adhésion pour ce covoiturage.",
            textAlign: TextAlign.center,
          ),
          contentPadding: EdgeInsets.all(5.0),
          actions: <Widget>[
            new FlatButton(
              onPressed: (){
                print('Annuler');
                Navigator.pop(context);
              },
              child: new Text("Annuler", style: new TextStyle(color: Colors.red),),
            ),
            new FlatButton(
              onPressed: (){
                print('Demand');
                Navigator.pop(context);
              },
              child: new Text("Demander", style: new TextStyle(color: Colors.blue),),
            ),
          ],
        );
      },
    );
  }

}