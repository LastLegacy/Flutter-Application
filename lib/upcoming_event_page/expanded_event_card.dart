import 'package:flutter/material.dart';
import '../custom_app_bar.dart';
import 'event_card.dart';

class ExpandedEventCard extends StatelessWidget{

  final String tagname;
  final String was;
  final String wann;
  final String wer;
  final String wo;
  final String beschreibung;

  ExpandedEventCard({
    @required this.tagname,
    @required this.was,
    this.wann = " ",
    this.wer = " ",
    this.wo = " ",
    this.beschreibung = " "
  });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: CustomAppBar(""),
      body: Hero(
        tag: this.tagname,
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
          margin: EdgeInsets.all(20),
          constraints: BoxConstraints.tightForFinite(
            width: 400,
            height: 550
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.3,1.0],
              colors: [
                Colors.indigoAccent,
                Colors.redAccent
              ]
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(0,3),
              )
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Text(
                    this.was,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Raleway",
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      decoration: TextDecoration.none   //removes Yellow Underlining
                    ),
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: Colors.white,
                ),

                Card(
                  color: Colors.transparent,
                  elevation: 0,
                  child: ListTile(
                    title: Text(
                      "Wo?",
                      style: TextStyle(
                          fontFamily: "Raleway",
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          decoration: TextDecoration.none   //removes Yellow Underlining
                      ),
                    ),
                    subtitle: Text(
                      this.wo,
                      style: TextStyle(
                          fontFamily: "Raleway",
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          decoration: TextDecoration.none   //removes Yellow Underlining
                      ),
                    ),
                  ),
                ),

                Card(
                  color: Colors.transparent,
                  elevation: 0,
                  child: ListTile(
                    title: Text(
                      "Wann?",
                      style: TextStyle(
                          fontFamily: "Raleway",
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          decoration: TextDecoration.none   //removes Yellow Underlining
                      ),
                    ),
                    subtitle: Text(
                      this.wann,
                      style: TextStyle(
                          fontFamily: "Raleway",
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          decoration: TextDecoration.none   //removes Yellow Underlining
                      ),
                    ),
                  ),
                ),

                Card(
                  color: Colors.transparent,
                  elevation: 0,
                  child: ListTile(
                    title: Text(
                      "Mit wem?",
                      style: TextStyle(
                          fontFamily: "Raleway",
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          decoration: TextDecoration.none   //removes Yellow Underlining
                      ),
                    ),
                    subtitle: Text(
                      this.wer,
                      style: TextStyle(
                          fontFamily: "Raleway",
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          decoration: TextDecoration.none   //removes Yellow Underlining
                      ),
                    ),
                  ),
                ),

                Card(
                  color: Colors.transparent,
                  elevation: 0,
                  borderOnForeground: true,
                  child: ListTile(
                    title: Text(
                      "Beschreibung:",
                      style: TextStyle(
                          fontFamily: "Raleway",
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          decoration: TextDecoration.none   //removes Yellow Underlining
                      ),
                    ),
                    subtitle: Text(
                      this.beschreibung,
                      style: TextStyle(
                          fontFamily: "Raleway",
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          decoration: TextDecoration.none   //removes Yellow Underlining
                      ),
                    ),
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