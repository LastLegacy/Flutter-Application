import 'package:eventapp/style_constants.dart';
import 'package:flutter/material.dart';

import '/custom_app_bar.dart';
import '../../entities/Friend.dart';

class Friendllist extends StatefulWidget{

  static List<Friend> friends = [];

  @override
  _FriendllistState createState() => _FriendllistState();
}

class _FriendllistState extends State<Friendllist> {

  bool isTapped = false;

  final _formKey = GlobalKey<FormState>();

  final controllerName = TextEditingController();
  final controllerPhonenumber = TextEditingController();
  final controllerDetails = TextEditingController();

  Future<void> contactDialog(BuildContext context){
    return showDialog(
        context: context,
        builder: (BuildContext context){
          return buildContactDialog(context);
        }
    );
  }

  void addContact(){

    final isValid = _formKey.currentState.validate();
    if (!isValid){
      return;
    }else{
      setState(() {
        Friendllist.friends.add(
          Friend(
            name: controllerName.text,
            phonenumber: controllerPhonenumber.text,
            details: controllerDetails.text
          )
        );
      });
    }

    controllerName.clear();
    controllerPhonenumber.clear();
    controllerDetails.clear();

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: CustomAppBar("Friends"),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Contacts",
                  style: TextStyle(
                    fontFamily: "Raleway",
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(width: 180),
                InkWell(
                  onTap: () => contactDialog(context),
                  borderRadius: BorderRadius.circular(20),
                  splashColor: Colors.black,
                  onHighlightChanged: (isTapped) =>   //when taped, change state
                      setState(() => this.isTapped = isTapped),
                  child: isTapped ?
                    Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 40,
                    ) :
                    Icon(
                      Icons.add_circle,
                      color: Colors.white,
                      size: 40,
                    )
                )
              ],
            ),
            SizedBox(height: 10,),
            Divider(color: Colors.white,),
            Friendllist.friends.isEmpty ?
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Center(
                  child: Text(
                    "No contacts yet",
                    style: TextStyle(
                      fontFamily: "Raleway",
                      fontSize: 20,
                      color: Colors.white,
                      //fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ) :
              ListView.separated(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                separatorBuilder: (context, index) => Divider(color: Colors.white,),
                itemCount: Friendllist.friends.length,
                itemBuilder: (context, index) {
                  var contact = Friendllist.friends[index];
                  return buildcontactTile(context: context,
                    name: contact.name,
                    phonenumber: contact.phonenumber,
                  );
                },
              )
          ],
        )
      ),
    );
  }

  Widget buildcontactTile({
    @required BuildContext context,
    @required String name,
    @required String phonenumber,
    String details
    }){
    return ListTile(
      title: Text(
        name,
        style: TextStyle(
          color: Colors.white,
          fontFamily: "Raleway",
          fontSize: 22
        ),
      ),
      subtitle: Text(
        phonenumber,
        style: TextStyle(
          color: Colors.white,
          //fontFamily: "Raleway",
        ),
      ),
      leading: CircleAvatar(
        backgroundColor: Colors.grey,
        foregroundColor: Colors.white,
        child: Text(
          name[0],
          style: TextStyle(
            fontFamily: "Raleway",
            fontWeight: FontWeight.bold,
            fontSize: 22
          ),
        ),
      ),
      onTap: () {},

    );
  }

  Widget buildContactDialog(BuildContext context){
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      content: Form(
        key: _formKey,
        child: SizedBox(
          width: 300,
          height: 350,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "New Contact",
                  style: kAlertDialogTextStyle
                ),
                SizedBox(height: 10,),
                Divider(color: Colors.black,),
                SizedBox(height: 10,),
                buildContactTextField(context, "Name",controllerName),
                SizedBox(height: 10,),
                buildContactTextField(context, "Phonenumber",controllerPhonenumber),
                SizedBox(height: 10,),
                buildContactTextField(context, "Details",controllerDetails),
                SizedBox(height: 10,),
                Divider(color: Colors.black,),
                SizedBox(height: 10,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: Size(120, 40),
                    primary: Colors.black
                  ),
                  onPressed: () => addContact(),
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
          ),
        ),
      ),
    );
  }

  Widget buildContactTextField(
      BuildContext context,
      String label,
      TextEditingController pController
    ){
    return TextFormField(
      controller: pController,
      decoration: InputDecoration(
        labelText: label,
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
          return "$label required";
        }
        return null;
      },
    );
  }
}