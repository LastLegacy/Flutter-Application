import 'EventCard.dart';
import 'MemoriesGallery.dart';
import 'package:flutter/material.dart';
import 'PastEventCard.dart';

class PastEvents extends StatelessWidget{

  final Shader linearGradient = LinearGradient(
    colors: <Color>[Colors.indigoAccent, Colors.redAccent],
  ).createShader(new Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Flexible(
          flex: 6,
          child: ListView(
            padding: EdgeInsets.all(20),
            physics: BouncingScrollPhysics(),
            children: [
              Container(
                child: Hero(
                  tag: "album",
                  child: PastEventCard(newRoute: MemoriesGallery(), title: "Test")
                ),
              ),
            ],
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.fromLTRB(20.0,0,20,10),
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                elevation: 6,
                minimumSize: Size(400, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                "Add Past Event",
                style: TextStyle(
                  fontFamily: "Raleway",
                  fontWeight: FontWeight.w600,
                  fontSize: 28,
                  foreground: new Paint()..shader = linearGradient,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}