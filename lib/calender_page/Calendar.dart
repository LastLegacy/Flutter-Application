import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2021, 1, 1),
      lastDay: DateTime.utc(2021,31,12),
      focusedDay: DateTime.now(),
      startingDayOfWeek: StartingDayOfWeek.monday,
      daysOfWeekStyle: DaysOfWeekStyle(decoration: BoxDecoration(
          color: Colors.redAccent
      ),),
      calendarStyle: CalendarStyle(
        markerDecoration: BoxDecoration(
          color: Colors.redAccent
        ),
        todayDecoration: BoxDecoration(color: Colors.redAccent,shape: BoxShape.circle),
        todayTextStyle: TextStyle(color: Colors.redAccent),
        outsideDecoration: BoxDecoration(
            color: Colors.redAccent
        ),
        rowDecoration: BoxDecoration(
            color: Colors.red
        ),
        defaultDecoration: BoxDecoration(
            color: Colors.redAccent
        ),

      ),
    );
  }
}
