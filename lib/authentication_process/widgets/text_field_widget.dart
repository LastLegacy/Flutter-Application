import 'package:flutter/material.dart';

import '../../style_constants.dart';

class LoginTextField extends StatelessWidget{

  final TextEditingController controller;
  final String title;

  LoginTextField({this.controller, this.title});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.white,
      controller: this.controller,
      style: kLoginFieldTextStyle,
      decoration: InputDecoration(
        labelText: this.title,
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
      ),
    );
  }
}