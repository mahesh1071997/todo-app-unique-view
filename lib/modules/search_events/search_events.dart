import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'package:todo_tasks_with_alert/model/event_data_source.dart';
import 'package:todo_tasks_with_alert/modules/search_events/search_controller.dart';

import 'package:todo_tasks_with_alert/shared/styles/styles.dart';

class SearchEvents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController1>(
        init: SearchController1(),
        builder: (searchController) {
          return Scaffold(
              appBar: AppBar(
                leading: Icon(Icons.menu_open_outlined),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Get.isDarkMode ? Icons.add : Icons.add,
                      size: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      //TODO: search screen
                      // Get.to(() => SearchEvents());
                      //NotificationApi.shownotification();
                    },
                    icon: Icon(
                      Get.isDarkMode ? Icons.search : Icons.search,
                      size: 30,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  )
                ],
                // actions: [
                //   _dropdown_menu_item(),
                // ],
              ),
              body: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SfCalendar(
                    showDatePickerButton: true,
                    allowedViews: const [
                      CalendarView.day,
                      CalendarView.week,
                      // CalendarView.workWeek,
                      CalendarView.month,
                      CalendarView.schedule,
                      CalendarView.timelineDay,
                      CalendarView.timelineWorkWeek,
                    ],
                    dataSource: EventDataSource(searchController.all_event),
                    cellBorderColor: Colors.white,
                    view: CalendarView.month,
                    firstDayOfWeek: 1,
                    initialSelectedDate: DateTime.now(),
                    initialDisplayDate: DateTime.now(),
                    selectionDecoration: BoxDecoration(
                        shape: BoxShape.circle,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.purple, width: 1)),
                    headerStyle: CalendarHeaderStyle(),
                    showTodayButton: true,
                    monthViewSettings: MonthViewSettings(
                        showAgenda: true,
                        showTrailingAndLeadingDates: false,
                        dayFormat: 'EEE',
                        monthCellStyle: MonthCellStyle(
                          todayBackgroundColor: Colors.indigoAccent[300],
                        ),
                        //NOTE to show events title not dot
                        appointmentDisplayMode:
                            MonthAppointmentDisplayMode.indicator),
                    onTap: (CalendarTapDetails calendarTapDetails) {
                      print(calendarTapDetails.date.toString());
                    },
                    onViewChanged: (viewChangedDetails) {
                      //  print(viewChangedDetails.visibleDates);
                      searchController.getallevents(
                          firstVisibleDate:
                              viewChangedDetails.visibleDates.first,
                          lastVisibleDate:
                              viewChangedDetails.visibleDates.last);
                      // print(viewChangedDetails.visibleDates.first.toString() +
                      //     " " +
                      //     viewChangedDetails.visibleDates.last.toString());
                    }),
              ));
        });
  }
}
