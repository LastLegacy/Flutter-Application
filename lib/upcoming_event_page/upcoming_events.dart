
import 'package:eventapp/custom_app_bar.dart';
import 'package:eventapp/upcoming_event_page/widgets/new_event_text_field.dart';

import '../style_constants.dart';
import 'event_card.dart';
import 'package:flutter/material.dart';
import 'expanded_event_card.dart';
import '../entities/Event.dart';



class UpcomingEvents extends StatefulWidget{

  static List<Event> events = [];

  @override
  _UpcomingEvents createState() => _UpcomingEvents();

}

class _UpcomingEvents extends State<UpcomingEvents>{

  final Shader linearGradient = LinearGradient(
    colors: <Color>[Colors.indigoAccent, Colors.redAccent],
  ).createShader(new Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));


  var listEvents = UpcomingEvents.events;

  final controllerWas = TextEditingController();
  final controllerWo = TextEditingController();
  final controllerWann = TextEditingController();
  final controllerWer = TextEditingController();
  final controllerBeschreibung = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  void click(){
    setState(() {
      listEvents.add(
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


  @override
  Widget build(BuildContext context){
    return Column(
      children: <Widget>[
        Flexible(
          flex: 6,
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: listEvents.length,
              itemBuilder: (context, index){
                var oneEvent = listEvents[index];
                void removeItem(){
                  setState(() {
                    UpcomingEvents.events.remove(oneEvent);
                  });
                }
                return Hero(
                  tag: "$index",
                  child: EventCard(
                    newRoute: ExpandedEventCard(
                      tagname: "$index",
                      was: oneEvent.was,
                      wann: oneEvent.wann,
                      wo: oneEvent.wo,
                      wer: oneEvent.wer,
                      beschreibung: oneEvent.beschreibung,
                    ),
                    was: oneEvent.was,
                    wann: oneEvent.wann,
                    wo: oneEvent.wo,
                    wer: oneEvent.wer,
                    beschreibung: oneEvent.beschreibung,
                    callback: removeItem,
                  )
                );
              },
            ),
          ),
        ),
        Flexible(
          flex: 1,
            child: Material(      // ?????
              color: Colors.transparent,
              child: Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () =>
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => buildNewEvent(context)
                        ),
                      );
                    }),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    elevation: 6,
                    minimumSize: Size(400, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    "Add New Event",
                    style: TextStyle(
                      fontFamily: "Raleway",
                      fontWeight: FontWeight.w600,
                      fontSize: 28,
                      foreground: new Paint()..shader = linearGradient
                    ),
                  ),
                ),
              ),
            )
        ),
      ],
    );
  }

  Widget buildNewEvent(BuildContext context){
    return Scaffold(
      appBar: CustomAppBar("NewEvent"),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Form(
                  key: _formkey,
                  child: NewEventTextField(
                    label: "Was?",
                    pController: controllerWas,
                  ),
                ),
                Divider(height: 20, color: Colors.transparent,),
                NewEventTextField(
                  label: "Wo?",
                  pController: controllerWo
                ),
                Divider(height: 20, color: Colors.transparent,),
                NewEventTextField(
                  label: "Wann?",
                  pController: controllerWann
                ),
                Divider(height: 20, color: Colors.transparent,),
                NewEventTextField(
                  label: "Wer?",
                  pController: controllerWer
                ),
                Divider(height: 20, color: Colors.transparent,),
                NewEventTextField(
                  label: "Beschreibung",
                  pController: controllerBeschreibung
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
        ),
      ),
    );
  }
}