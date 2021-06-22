import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'CustomAppBar.dart';
import 'package:image_picker/image_picker.dart';


class MemoriesGallery extends StatefulWidget{

  static List<String> staticimages = [
    "assets/kochen.JPG",
    "assets/rwthAachen.jpg",
    "assets/cologne.jpg",
  ];

  @override
  _MemoriesGalleryState createState() => _MemoriesGalleryState();
}

class _MemoriesGalleryState extends State<MemoriesGallery> {

  final Shader linearGradient = LinearGradient(
    colors: <Color>[Colors.indigoAccent, Colors.redAccent],
  ).createShader(new Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));


  List<File> _dynamicImages = [];

  File imageFile;
  final ImagePicker picker = ImagePicker();

  Future openGallery(BuildContext context) async {   // async-task --> undefined time
    final pickedPicture = await picker.getImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = File(pickedPicture.path);
      _dynamicImages.add(imageFile);
    });
    Navigator.pop(context);
  }

  Future openCamera(BuildContext context) async {
    final pickedPicture = await picker.getImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = File(pickedPicture.path);
      _dynamicImages.add(imageFile);
    });
    Navigator.pop(context);
  }

  Future<void> photoDialog(BuildContext context){
    return showDialog(
      context: context,
      builder: (BuildContext context){
        return buildAlertDialog(context);
      }
    );
  }


  Widget buildAlertDialog(BuildContext context){
    return AlertDialog(
      title: Text(
        "Take Photo or \n Choose from Camera Roll",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: "Raleway",
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      content: Row(
        children: [
          ElevatedButton(
            onPressed: () {
              openGallery(context);
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              minimumSize: Size(100, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text(
              "Camera Roll",
              style: TextStyle(
                fontFamily: "Raleway",
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(8)),
          ElevatedButton(
            onPressed: () {
              openCamera(context);
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              minimumSize: Size(100, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text(
              "Take Photo",
              style: TextStyle(
                fontFamily: "Raleway",
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }


  Widget buildExpandImage(File pImage){
    return Container(
      child: Image.file(
        pImage,
        fit: BoxFit.cover,
      ),
    );
  }



  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: CustomAppBar(""),
      body: Column(
        children: <Widget>[
          Hero(
          tag: "album",
            child: Container(
              //alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(20,15,20,20),
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
                ]
              ),
              child: GridView.count(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.all(10),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 4/3,
                children: _dynamicImages.map((image) => Card(
                  child: Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context, MaterialPageRoute(builder: (context) => buildExpandImage(image)),
                          );
                        },
                        child: Image.file(
                          image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  elevation: 6,
                  color: Colors.transparent,
                )).toList()
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: ButtonTheme(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              minWidth: 400,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  photoDialog(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  elevation: 6,
                  minimumSize: Size(400, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  "Add Photo",
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
        ],
      )
    );
  }
}

/*
* !!!MemoriesGallery.staticimages.map((e) => Card(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(e),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                  elevation: 6,
                  color: Colors.transparent,
  !!              )).toList()
* */