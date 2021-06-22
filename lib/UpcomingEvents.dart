
import 'EventCard.dart';
import 'package:flutter/material.dart';
import 'ExpandedEventCard.dart';
import 'NewEvent.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class UpcomingEvents extends StatefulWidget{

  @override
  _UpcomingEvents createState() => _UpcomingEvents();


}

class _UpcomingEvents extends State<UpcomingEvents>{

  final Shader linearGradient = LinearGradient(
    colors: <Color>[Colors.indigoAccent, Colors.redAccent],
  ).createShader(new Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));


  var listEvents = NewEvent.events;


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
                  )
                );
              },
            ),
          ),
        ),
        Flexible(
          flex: 1,
            child: Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () =>
                  setState(() {
                    Navigator.push(
                      context, MaterialPageRoute(builder: (context) => NewEvent()),
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
            )
        ),
      ],
    );
  }
}