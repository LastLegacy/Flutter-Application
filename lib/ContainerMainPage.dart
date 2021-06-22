import 'package:flutter/material.dart';

class ContainerMainPage extends StatelessWidget{
  final String title;
  final Widget newRoute;

  ContainerMainPage(this.title, this.newRoute);

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context, MaterialPageRoute(builder: (context) => this.newRoute),
        );
      },
      child: Container(
        child: FittedBox(
          fit: BoxFit.contain,
          child: Text(
            this.title,
            style: TextStyle(
                //fontWeight: FontWeight.bold,
                fontFamily: 'Raleway',
                fontSize: 100,    //twist: fontsize needs to be bigger!!!!!
                color: Colors.white
            ),
          ),
        ),
        padding: EdgeInsets.all(2),
        margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
        alignment: Alignment.center,
        width: 400,
        height: 45,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            //begin: Alignment.topLeft,
            //end: Alignment.bottomRight,
            stops: [0.2,1.0],
            colors: [
              Colors.indigoAccent,
              Colors.redAccent
            ]
          ),

          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0,3),
            )
          ]
        ),
      ),
    );
  }
}