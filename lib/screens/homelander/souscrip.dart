import 'package:flutter/material.dart';

import 'package:isj_mobility/screens/home.dart';
import 'package:isj_mobility/screens/homelander/recherche.dart';

class Souscrip extends StatefulWidget {
  Souscrip({Key key}) : super(key: key);

  @override
  _Souscrip createState() => _Souscrip();
}

class _Souscrip extends State<Souscrip> {
  @override
  Widget build(BuildContext context) {
    return new ListView(
      children:<Widget>[
        new Card(
          elevation: 5.0,
          child : new Container(
            width: MediaQuery.of(context).size.width /1.05,
            height: 30,
            child : new RaisedButton(
              color : Colors.white,
              onPressed: pageRecherche,
              child : new Row(
                children: <Widget>[
                  new Icon(Icons.search,
                    color: Colors.grey,
                  ),
                  new Text("Rechercher un trajet",
                    style: new TextStyle(
                      color : Colors.blue[900],
                      fontSize: 15.0,),
                  ),
                ],
              ),
            ),
          ),
        ),
        new SingleChildScrollView (
          child : new Card(
            elevation: 5.0,
            child: new Container(
              width: MediaQuery.of(context).size.width /1.05,
              child : new RaisedButton(
                color : Colors.white,
                onLongPress: outCovoiturage,
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
    );
  }

  Future<Null> outCovoiturage() async {
    return showDialog(
        context : context,
      barrierDismissible: true,
      builder: (BuildContext context){
          return new AlertDialog(
            title :new Text(
              'Voulez-vous quitter ce covoiturage?',
               textAlign: TextAlign.center,
            ),
            content: new Text(
              'Vous allez quitter ce covoiturage.',
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
                  print('Proceed');
                  Navigator.pop(context);
                },
                child: new Text("Quitter", style: new TextStyle(color: Colors.blue),),
              ),
            ],
          );
      },
    );
  }

  void pageRecherche(){
    Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
      return new Recherche();
    }));
  }

}
