import 'CustomAppBar.dart';
import 'package:flutter/material.dart';
import 'Event.dart';


class NewEvent extends StatefulWidget{

  static List<Event> events = [];

  @override
  _NewEventState createState() => _NewEventState();
}

class _NewEventState extends State<NewEvent> {

  final controllerWas = TextEditingController();
  final controllerWo = TextEditingController();
  final controllerWann = TextEditingController();
  final controllerWer = TextEditingController();
  final controllerBeschreibung = TextEditingController();

  String was;
  String wo;
  String wann;
  String wer;
  String beschreibung;

  @override
  void dispose(){
    super.dispose();
    controllerWas.dispose();
  }


  void click(){
    setState(() {

      NewEvent.events.add(
          new Event(
            was: controllerWas.text,
            wo: controllerWo.text,
            wann: controllerWann.text,
            wer: controllerWer.text,
            beschreibung: controllerBeschreibung.text,
          )
      );

      controllerWas.clear();
      controllerWo.clear();
      controllerWann.clear();
      controllerWer.clear();
      controllerBeschreibung.clear();

      Navigator.pop(context);
      FocusScope.of(context).unfocus();
    });
  }

  //Assoziationen haha mit callbacks viel spaß



  @override
  Widget build(BuildContext context){
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar: CustomAppBar("New Event"),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: controllerWas,
                  cursorColor: Colors.redAccent,
                  cursorHeight: 20,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    decoration: TextDecoration.none
                  ),
                  decoration: InputDecoration(
                    labelText: "Was?",
                    labelStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.white
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.white)
                    ),
                  ),
                ),

                Divider(
                  height: 20,
                  color: Colors.transparent,
                ),

                TextField(
                  controller: controllerWo,
                  cursorColor: Colors.redAccent,
                  cursorHeight: 20,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      decoration: TextDecoration.none
                  ),
                  decoration: InputDecoration(
                    labelText: "Wo?",
                    labelStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.white
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.white)
                    ),
                  ),
                ),

                Divider(
                  height: 20,
                  color: Colors.transparent,
                ),

                TextField(
                  controller: controllerWann,
                  cursorColor: Colors.redAccent,
                  cursorHeight: 20,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      decoration: TextDecoration.none
                  ),
                  decoration: InputDecoration(
                    labelText: "Wann?",
                    labelStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.white
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.white)
                    ),
                  ),
                ),

                Divider(
                  height: 20,
                  color: Colors.transparent,
                ),

                TextField(
                  controller: controllerWer,
                  cursorColor: Colors.redAccent,
                  cursorHeight: 20,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      decoration: TextDecoration.none
                  ),
                  decoration: InputDecoration(
                    labelText: "Wer?",
                    labelStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.white
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.white)
                    ),
                  ),
                ),

                Divider(
                  height: 20,
                  color: Colors.transparent,
                ),

                TextField(
                  controller: controllerBeschreibung,
                  cursorColor: Colors.redAccent,
                  cursorHeight: 20,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      decoration: TextDecoration.none
                  ),
                  decoration: InputDecoration(
                    labelText: "Beschreibung",
                    labelStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.white
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.white)
                    ),
                  ),
                ),

                Divider(
                  thickness: 1.0,
                  color: Colors.white,
                  height: 40,
                ),

                ElevatedButton(
                  onPressed: this.click,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.indigoAccent,
                    elevation: 6,
                    minimumSize: Size(400,50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    "Create",
                    style: TextStyle(
                      fontFamily: "Raleway",
                      fontWeight: FontWeight.w600,
                      fontSize: 28,
                      color: Colors.white
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}