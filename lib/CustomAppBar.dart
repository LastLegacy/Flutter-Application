import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget{
  final String title;
  final Widget myIcon;

  CustomAppBar(this.title, [this.myIcon]);

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
      leading: myIcon,
      centerTitle: true,
    );
  }
}