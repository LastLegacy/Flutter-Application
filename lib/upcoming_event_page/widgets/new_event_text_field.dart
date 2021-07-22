import 'package:flutter/material.dart';

class NewEventTextField extends StatelessWidget {

  final String label;
  final TextEditingController pController;

  NewEventTextField({
    this.label,
    this.pController,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: pController,
      validator: (value) {
        // TODO
      },
      keyboardType: TextInputType.multiline,
      maxLines: 1,
      cursorColor: Colors.redAccent,
      cursorHeight: 20,
      style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          decoration: TextDecoration.none
      ),
      decoration: InputDecoration(
        labelText: label,
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
    );
  }
}