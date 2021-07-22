import 'package:flutter/material.dart';

import 'side_drawer/side_drawer.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget{
  final String title;

  CustomAppBar(this.title);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context){
    return AppBar(
      title: Text(
          this.title,
          style: TextStyle(
              fontFamily: 'Raleway',
              color: Colors.white,
              fontSize: 25
          ),
        ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
    );
  }
}