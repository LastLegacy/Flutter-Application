
import 'dart:io';
import 'package:eventapp/style_constants.dart';
import 'package:image_picker/image_picker.dart';
import 'memories_gallery.dart';
import 'package:flutter/material.dart';
import '../entities/PastEvent.dart';
import 'past_event_card.dart';

class PastEvents extends StatefulWidget{

  static List<PastEvent> pasteventsList = [];

  @override
  _PastEventsState createState() => _PastEventsState();
}

class _PastEventsState extends State<PastEvents> {

  final _formKey = GlobalKey<FormState>();
  final controllerGalleryName = TextEditingController();

  final Shader linearGradient = LinearGradient(
    colors: <Color>[Colors.indigoAccent, Colors.redAccent],
  ).createShader(new Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));


  void addGallery(){

    final isValid = _formKey.currentState.validate();
    if (!isValid){
      return;
    }else {
      setState(() {
        //Widget gallery = new MemoriesGallery();
        PastEvents.pasteventsList.add(
          new PastEvent(
            name: controllerGalleryName.text,
            //gallery: gallery,
          )
        );
      });
    }
    controllerGalleryName.clear();
    Navigator.of(context).pop();
    print(PastEvents.pasteventsList[0].name);
  }


  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Flexible(
          flex: 6,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(20),
            itemCount: PastEvents.pasteventsList.length,
            itemBuilder: (context, index){
              var onePastEvent = PastEvents.pasteventsList[index];
              return Hero(
                tag: "gallery$index",
                child: PastEventCard(
                  title: onePastEvent.name,
                  event: onePastEvent,
                  newRoute: MemoriesGallery(
                    tag: "gallery$index",
                    event: onePastEvent,
                  ),
                )
              );
            }
          )
        ),
        Flexible(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.fromLTRB(20.0,0,20,10),
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () => pastEventDialog(context),
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

  Future<void> pastEventDialog(BuildContext context){
    return showDialog(
      context: context,
      builder: (BuildContext context){
        return buildPastEventDialog(context);
      }
    );
  }

  Widget buildPastEventDialog(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      content: Form(
        key: _formKey,
        child: SizedBox(
          width: 300,
          height: 200,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
              child: Column(
                children: [
                  Text(
                    "Give the gallery a name:",
                    style: kAlertDialogTextStyle,
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                    controller: controllerGalleryName,
                    decoration: InputDecoration(
                      labelText: "galleryname",
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                    ),
                    maxLines: null,
                    cursorColor: Colors.black,
                    validator: (String value) {
                      if (value.isEmpty){
                        return "galleryname required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: Size(120, 40),
                        primary: Colors.black
                    ),
                    onPressed: () => addGallery(),
                    child: Text(
                      "Add",
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
            )
          ),
        )
      ),
    );
  }

  /*Widget buildField(BuildContext context, int index){
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => chooseImage(context),
        child: SizedBox(
          width: 70,
          height: 70,
          child: Container(
            color: Colors.grey,
            child: Center(
              child: index == 0 ? Icon(Icons.add) :
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: FileImage(PastEvents.addedPictures[index-1]),
                      )
                    ),
                  )
                /*(PastEvents.addedPictures.length == 1) ?
                  Image.file(PastEvents.addedPictures[0]) :
                (PastEvents.addedPictures.length == 2) ?
                  Image.file(PastEvents.addedPictures[1]) :
                (PastEvents.addedPictures.length == 3) ?
                  Image.file(PastEvents.addedPictures[2], fit: BoxFit.cover) :
                  Icon(Icons.add)*/
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPictureFields(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width * .6,
      height: MediaQuery.of(context).size.width * .2,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          crossAxisSpacing: 10
        ),
        itemCount: 3,
        itemBuilder: (context, index) => buildField(context, index),
      ),
    );
  }*/
}