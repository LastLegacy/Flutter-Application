
import 'package:eventapp/style_constants.dart';

import 'calender_page/Calendar.dart';
import 'custom_app_bar.dart';
import 'past_event_page/past_events_page.dart';
import 'side_drawer/side_drawer.dart';
import 'upcoming_event_page/upcoming_events.dart';
import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  final String title = "Event Organizer";

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int selectedIndex = 0;

  final List<Widget> pages = [
    UpcomingEvents(),
    PastEvents(),
    Calendar()
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: SideDrawer(),
        appBar: CustomAppBar(widget.title),
        bottomNavigationBar: buildBottomNavigationBar(),
        body: this.pages[selectedIndex]

    );
  }

  Widget buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        gradient: kGradient2,
      ),
      child: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        unselectedItemColor: Colors.white.withOpacity(.5),
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Upcoming Events"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event_available),
            label: "Past Events"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: "Calender"
          ),
        ],
      ),
    );
  }
}