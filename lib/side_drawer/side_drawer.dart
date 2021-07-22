import '../authentication_process/authentication_services/authenticaton_service.dart';

import 'friend_function/Friendlist.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:provider/provider.dart';

class SideDrawer extends StatefulWidget{

  static File imageFile;

  @override
  _SideDrawerState createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {

  final ImagePicker picker = ImagePicker();

  Future openGallery(BuildContext context) async {   // async-task --> undefined time
    final pickedPicture = await picker.getImage(source: ImageSource.gallery);
    this.setState(() {
      SideDrawer.imageFile = File(pickedPicture.path);
    });
  }

  @override
  Widget build(BuildContext context){
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.2,0.9],
              colors: [
                Colors.indigoAccent,
                Colors.redAccent
              ]
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: ListView(
            padding: EdgeInsets.fromLTRB(20, 50, 20, 40),
            children: [
              Row(
                children: [
                  buildProfileCircle(context,),
                  VerticalDivider(width: 20,),
                  buildProfileName(context, "Christopher", "Bastin")
                ],
              ),
              SizedBox(height: 20,),
              Divider(color: Colors.white,),
              SizedBox(height: 10,),
              buildSection(
                icon: Icons.people,
                title: "Contacts",
                clicked: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Friendllist(),
                ))
              ),
              SizedBox(height: 10,),
              buildSection(
                icon: Icons.settings,
                title: "Settings"),
                //clicked: () {}
              SizedBox(height: 10,),
              buildSection(
                icon: Icons.logout,
                title: "Sign out",
                context: context,
                clicked: () {
                  context.read<AuthenticationService>().signOut();
                }
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSection({
    BuildContext context,
    @required IconData icon,
    @required String title,
    VoidCallback clicked,
  }){

    return ListTile(
      leading: Icon(icon, color: Colors.white, size: 30),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: "Raleway",
          color: Colors.white,
          fontSize: 22
        ),
      ),
      onTap: clicked,
    );
  }

  Widget buildProfileCircle(BuildContext context){
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => openGallery(context),
        borderRadius: BorderRadius.circular(360),
        splashColor: Colors.grey,
        child: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.grey,
          backgroundImage: SideDrawer.imageFile != null ?
            FileImage(SideDrawer.imageFile) :
            AssetImage("assets/benutzer.png"),
        ),
      ),
    );
  }

  Widget buildProfileName(BuildContext context, String firstname, String lastname){
    return Text(
      firstname+"\n"+lastname,
      style: TextStyle(
          fontFamily: "Raleway",
          color: Colors.white,
          fontSize: 22
      ),
    );
  }
}