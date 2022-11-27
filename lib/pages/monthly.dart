import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/clean_calendar_event.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MonthlyData extends StatefulWidget {
  const MonthlyData({Key? key}) : super(key: key);

  @override
  State<MonthlyData> createState() => _MonthlyDataState();
}

class _MonthlyDataState extends State<MonthlyData> {
  final Map<DateTime, List<CleanCalendarEvent>> _events = {
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day): [
      CleanCalendarEvent('Event A',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day),
          description: 'An event',
          color: Colors.orange),
    ],
  };

  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      firstDayOfWeek: 1,
      dataSource: MeetingDataSource(_getDataSource()),
      todayHighlightColor: Colors.deepOrange,
      view: CalendarView.month,
      monthViewSettings: MonthViewSettings(showAgenda: true),
      cellBorderColor: Colors.transparent,
      selectionDecoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Colors.deepOrange, width: 2),
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        shape: BoxShape.rectangle,


      ),


    );
  }
}



List<Meeting> _getDataSource() {
  final List<Meeting> meetings = <Meeting>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
  DateTime(today.year, today.month, today.day, 9, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 2));
  meetings.add(Meeting(
      'Conference', startTime, endTime, const Color(0xFFFF602E), false),);
  return meetings;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
