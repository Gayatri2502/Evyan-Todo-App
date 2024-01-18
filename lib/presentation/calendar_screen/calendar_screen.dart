// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:todo_app/presentation/calendar_screen/model/calendar_model.dart';
//
// import 'controller/event_controller.dart';
//
// class CalendarScreen extends GetWidget<EventController> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text("TODO Calendar"),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Get.dialog(
//             AlertDialog(
//               scrollable: true,
//               title: const Text(
//                 'Scheduled Event Name: ',
//                 style: TextStyle(fontSize: 15),
//               ),
//               content: Padding(
//                 padding: const EdgeInsets.all(6),
//                 child: TextField(
//                   controller: controller.eventController,
//                 ),
//               ),
//               actions: [
//                 ElevatedButton(
//                   onPressed: () {
//                     controller.events.addAll({
//                       controller.selectedDay!: [
//                         EventModel(title: controller.eventController.text)
//                       ]
//                     });
//                     Get.back;
//                     controller.selectedEvent.value =
//                         controller.getEventForDay(controller.selectedDay!);
//                   },
//                   // onPressed: () {
//                   //   controller.events.addAll({
//                   //     controller.selectedDay.value: [
//                   //       EventModel(title: controller.eventController.text)
//                   //     ]
//                   //   });
//                   //   Get.back();
//                   //   controller.selectedEvent.value =
//                   //       controller.getEventForDay(controller.selectedDay.value);
//                   // },
//                   child: const Text('Add'),
//                 ),
//               ],
//             ),
//           );
//         },
//         child: const Icon(Icons.add),
//       ),
//       body: SizedBox(
//         height: MediaQuery.of(context).size.height,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             const SizedBox(
//               height: 50,
//             ),
//             const Text(
//               'Schedule your Appointment :',
//             ),
//             Text(
//               controller.selectedDay.toString().split(' ')[0],
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: TableCalendar(
//                 rowHeight: 60,
//                 eventLoader: controller.getEventForDay,
//                 daysOfWeekHeight: 25,
//                 selectedDayPredicate: (day) => isSameDay(day, controller.today),
//                 availableGestures: AvailableGestures.all,
//                 firstDay: DateTime.utc(2010, 10, 16),
//                 lastDay: DateTime.utc(2030, 3, 14),
//                 focusedDay: controller.today,
//                 onDaySelected: (day, focusday) {
//                   day = controller.today;
//                   focusday = controller.selectedDay!;
//                   controller.onDaySelected(day, focusday);
//                 },
//                 calendarStyle: CalendarStyle(
//                   selectedDecoration: BoxDecoration(
//                     color: Colors.blue, // Set the color for the selected day
//                     shape:
//                         BoxShape.circle, // You can change the shape if needed
//                   ),
//                   todayDecoration: BoxDecoration(
//                     color: Colors
//                         .green, // Set the color for the focused day (today)
//                     shape: BoxShape.circle,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             Expanded(
//               child: Obx(
//                 () => ListView.builder(
//                   itemCount: controller.selectedEvent.length,
//                   itemBuilder: (context, i) {
//                     final eventName = controller.selectedEvent[i];
//
//                     return Container(
//                       margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//                       decoration: BoxDecoration(
//                         border: Border.all(),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: ListTile(
//                         onTap: () => print(" "),
//                         title: Text(
//                           "Scheduled Event: \t\t\t\t\t\t${eventName.title}",
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_app/core/app_export.dart';
import 'package:todo_app/presentation/calendar_screen/model/calendar_model.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen();

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _today = DateTime.now();
  DateTime? _selectedDay;
  Map<DateTime, List<EventModel>> events = {};
  ValueNotifier<List<EventModel>> selectedEvent = ValueNotifier([]);
  TextEditingController eventController = new TextEditingController();

  Time _time = Time(hour: 11, minute: 30, second: 20);
  bool iosStyle = true;

  void onTimeChanged(Time newTime) {
    setState(() {
      _time = newTime;
    });
  }

  List<EventModel> getEventForDay(DateTime day) {
    return events[day] ?? [];
  }

  @override
  void initState() {
    super.initState();
    _selectedDay = _today;
    selectedEvent = ValueNotifier(getEventForDay(_selectedDay!));
    eventController.clear();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onDaySelected(DateTime selectedDay, DateTime today) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _today = today;
        _selectedDay = selectedDay;
        selectedEvent.value = getEventForDay(_selectedDay!);
      });
    }
  }

  // void _onDateSelected (DateTime day, DateTime selectedDay) {
  //   setState(() {
  //     _today = day;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          "Calendar ",
          style: TextStyle(color: Colors.white),
        ),
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.white,
            )),
      ),

      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              // const Text(
              //   'Schedule your Calendar :',
              //   style: TextStyle(color: Colors.black, fontSize: 16.5),
              // ),
              SizedBox(
                height: 15,
              ),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.all(Radius.circular(1))),
                height: 30,
                width: 150,
                padding: EdgeInsets.all(8),
                child: Text(
                  _today.toString().split(' ')[0],
                ),
              ),
              // SizedBox(
              //   height: 20,
              // ),
              // ElevatedButton(onPressed: () {}, child: Text('Calendar')),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TableCalendar(
                  rowHeight: 60,
                  eventLoader: getEventForDay,
                  daysOfWeekHeight: 25,
                  selectedDayPredicate: (day) => isSameDay(day, _today),
                  availableGestures: AvailableGestures.all,
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: _today,
                  onDaySelected: _onDaySelected,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Select your time:',
                style: TextStyle(color: Colors.black, fontSize: 16.5),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    showPicker(
                      context: context,
                      value: _time,
                      sunrise: TimeOfDay(hour: 6, minute: 0), // optional
                      sunset: TimeOfDay(hour: 18, minute: 0), // optional
                      duskSpanInMinutes: 120, // optional
                      onChange: onTimeChanged,
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  height: 50,
                  width: 350,
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Text(
                        "Open time picker: ",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      Spacer(),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12),
                            borderRadius: BorderRadius.all(Radius.circular(1))),
                        height: 30,
                        width: 150,
                        padding: EdgeInsets.all(8),
                        child: Text("${_time}",
                            style: TextStyle(
                                color: Colors.indigo.shade900, fontSize: 13)),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 45),

              ElevatedButton(
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(75, 35)),
                      maximumSize:
                          MaterialStateProperty.all(Size.fromHeight(100.0)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        // Adjust the value of BorderRadius.circular to control the button's corner radius
                      ))),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            scrollable: true,
                            title: const Text(
                              'Do you want to schedule on this date & Time :',
                              style: TextStyle(fontSize: 15),
                            ),
                            content: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black12),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              height: 60,
                              width: 350,
                              padding: EdgeInsets.all(8),
                              child: Column(
                                children: [
                                  Text(
                                      "Date:\t\t  ${_today.toString().split(' ')[0]}},\nTime:\t\t ${_time}"),
                                ],
                              ),
                            ),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    events.addAll({
                                      _selectedDay!: [
                                        EventModel(
                                            date: _selectedDay!, time: _time)
                                      ]
                                    });
                                    Navigator.of(context).pop();
                                    Get.offNamed(AppRoutes.taskFormScreen);
                                    // events.addAll({
                                    //   _selectedDay!: [
                                    //     EventModel(title: eventController.text, description: )
                                    //   ]
                                    // });
                                    // selectedEvent.value =
                                    //     getEventForDay(_selectedDay!);
                                  },
                                  child: Text(
                                    'Add',
                                    style: TextStyle(color: Colors.white),
                                  ))
                            ],
                          );
                        });
                  },
                  child: Text("save", style: TextStyle(color: Colors.white))),
              // Expanded(
              //   child: ValueListenableBuilder<List<EventModel>>(
              //       valueListenable: selectedEvent,
              //       builder: (context, value, _) {
              //         return ListView.builder(
              //             itemCount: value.length,
              //             itemBuilder: (context, i) {
              //               final eventName = value[i];
              //
              //               return Container(
              //                 margin: EdgeInsets.symmetric(
              //                     horizontal: 12, vertical: 4),
              //                 decoration: BoxDecoration(
              //                     border: Border.all(),
              //                     borderRadius: BorderRadius.circular(12)),
              //                 child: ListTile(
              //                   onTap: () => print(" "),
              //                   title: Text(
              //                       "TODO TASK : \t\t\t\t\t\t${eventName.title}"),
              //                 ),
              //               );
              //             });
              //       }),
              // )
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
