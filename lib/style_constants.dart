import 'package:flutter/material.dart';

const kAlertDialogTextStyle = const TextStyle(
  fontFamily: "Raleway",
  fontWeight: FontWeight.bold,
  fontSize: 22
);

const kLoginTextStyle = const TextStyle(
  fontFamily: "Montserrat",
  fontWeight: FontWeight.bold,
  fontSize: 40,
  color: Colors.white
);

const kLoginFieldTextStyle = const TextStyle(
    fontFamily: "Montserrat",
    fontWeight: FontWeight.bold,
    fontSize: 15,
    color: Colors.white
);

const kLoginButtonTextStyle = const TextStyle(
    fontFamily: "Montserrat",
    fontSize: 22,
    color: Colors.black
);

const kSnackBarTextStyle = const TextStyle(
    fontFamily: "Montserrat",
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white
);

const kGradient1 = const LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  stops: [0.1,1.0],
  colors: [
    Colors.indigoAccent,
    Colors.redAccent
  ]
);

const kGradient2 = const LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    stops: [0.1,1.0],
    colors: [
      Colors.indigoAccent,
      Colors.redAccent
    ]
);