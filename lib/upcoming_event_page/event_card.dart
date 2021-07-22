
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class EventCard extends StatelessWidget{

  final String was;
  final String wer;
  final String wo;
  final String wann;
  final String beschreibung;
  final Widget newRoute;
  final VoidCallback callback;

  EventCard({
    this.newRoute,
    this.was,
    this.wer,
    this.wo,
    this.wann,
    this.beschreibung,
    this.callback
  });

  @override
  Widget build(BuildContext context){
    return SizedBox(
      height: 120,
      width: 200,
      child: Card(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 25),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 6,
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => this.newRoute),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Slidable(
              actionPane: SlidableDrawerActionPane(),
              //key: Key(),
              actions: [
                IconSlideAction(
                  color: Colors.indigoAccent,
                  onTap: () {},
                  icon: Icons.edit,
                  caption: "Edit"
                )
              ],
              secondaryActions: [
                IconSlideAction(
                  color: Colors.redAccent,
                  onTap: this.callback,
                  icon: Icons.delete,
                  caption: "Delete"
                )
              ],
              child: Container(
                decoration: BoxDecoration(
                  //borderRadius: BorderRadius.all(Radius.circular(20)),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.1,0.9],
                    colors: [
                      Colors.indigoAccent,
                      Colors.redAccent
                    ]
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20,5,20,5),
                  child: Column(
                    children: <Widget>[
                      Text(
                        this.was,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "Raleway",
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.white,
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            this.wann,
                            style: TextStyle(
                                fontFamily: "Raleway",
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white
                            ),
                          ),
                          Text(
                            " - ",
                            style: TextStyle(
                                fontFamily: "Raleway",
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white
                            ),
                          ),
                          Text(
                            this.wo,
                            style: TextStyle(
                                fontFamily: "Raleway",
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ),
              ),
            ),
          )
        ),
      )
    );
  }

}