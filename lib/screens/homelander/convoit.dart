import 'package:flutter/material.dart';

import 'ajoutCovoiturage.dart';

class Convoit extends StatefulWidget {
  Convoit({Key key}) : super(key: key);

  @override
  _Convoit createState() => _Convoit();
}

class _Convoit extends State<Convoit> {
  @override
  Widget build(BuildContext context) {
    return new ListView(
      children:<Widget>[
        new Card(
          elevation: 5.0,
          child : new Container(
            width: MediaQuery.of(context).size.width /1.6,
            child : new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new IconButton(
                  padding: EdgeInsets.all(0),
                  icon : new Icon(
                    Icons.add,
                    color : Colors.grey[700],
                  ),
                  iconSize: 100,
                  onPressed: pageAjouter,
                ),
                new Text("Ajouter un covoiturage",
                  style: new TextStyle(
                    color : Colors.blue[900],
                  ),
                ),
              ],
            ),
          ),
        ),
        new SingleChildScrollView (
          child : new Card(
            elevation: 5.0,
            child: new Container(
              width: MediaQuery.of(context).size.width /1.05,
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
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new IconButton(
                        icon : new Icon(
                          Icons.create,
                          color: Colors.green[700],
                        ),
                        onPressed: modCov,
                        alignment: Alignment.topLeft,
                      ),
                      new IconButton(
                        onPressed: delete,
                        icon : new Icon(
                          Icons.delete,
                          color: Colors.green[700],
                        ),
                        alignment: Alignment.topRight,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<Null> delete() async {
    return showDialog(
      context : context,
      barrierDismissible: true,
      builder: (BuildContext context){
        return new AlertDialog(
          title :new Text(
            'Voulez-vous supprimer ce covoiturage?',
            textAlign: TextAlign.center,
          ),
          content: new Text(
            'Vous allez supprimer définitivement ce covoiturage.',
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

  void pageAjouter(){
    Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
      return new AjoutCovoiturage("Créer un covoiturage");
    }));
  }

  void modCov(){
    Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
      return new AjoutCovoiturage("Modifier le covoiturage");
    }));
  }

}
