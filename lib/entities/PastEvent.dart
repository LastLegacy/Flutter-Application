import 'dart:io';

import 'package:flutter/cupertino.dart';

class PastEvent{
  final String name;
  List<File> pictures = [];
  final Widget gallery;

  PastEvent({this.name, this.gallery});

}