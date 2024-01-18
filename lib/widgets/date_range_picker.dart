import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/app_export.dart';

import 'custom_icon_button.dart';

class LongTermTask extends StatefulWidget {
  const LongTermTask({Key? key}) : super(key: key);

  @override
  State<LongTermTask> createState() => _LongTermTaskState();
}

// class _LongTermTaskState extends State<LongTermTask> {
//   DateTime? startDate;
//   DateTime? endDate;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.indigo.shade900,
//         leading: IconButton(
//           onPressed: () {},
//           icon: Icon(
//             Icons.arrow_back_ios_rounded,
//             color: Colors.white70,
//           ),
//         ),
//         title: const Text(
//           "Long Term Task",
//           style: TextStyle(color: Colors.white70),
//         ),
//         centerTitle: true,
//       ),
//       body: Container(
//         height: double.infinity,
//         child: Padding(
//           padding: const EdgeInsets.only(left: 18, bottom: 16),
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 GestureDetector(
//                   onTap: () {
//                     showCustomDateRangePicker(
//                       context,
//                       dismissible: true,
//                       minimumDate:
//                           DateTime.now().subtract(const Duration(days: 30)),
//                       maximumDate: DateTime.now().add(const Duration(days: 30)),
//                       endDate: endDate,
//                       startDate: startDate,
//                       backgroundColor: Colors.white,
//                       primaryColor: Colors.green,
//                       onApplyClick: (start, end) {
//                         setState(() {
//                           endDate = end;
//                           startDate = start;
//                         });
//                       },
//                       onCancelClick: () {
//                         setState(() {
//                           endDate = null;
//                           startDate = null;
//                         });
//                       },
//                     );
//                   },
//                   child: Container(
//                     padding: EdgeInsets.all(15),
//                     width: 280,
//                     height: 60,
//                     color: Colors.indigo.shade100,
//                     child: Row(
//                       children: [
//                         Text(
//                           'Choose a date Range',
//                           style: TextStyle(
//                               fontWeight: FontWeight.w500,
//                               fontSize: 20,
//                               color: Colors.black),
//                         ),
//                         SizedBox(
//                           width: 25,
//                         ),
//                         const Icon(Icons.calendar_month_rounded,
//                             color: Colors.black, size: 35),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Text(
//                   'From ${startDate != null ? DateFormat("dd, MMM").format(startDate!) : '-'} \t to \t ${endDate != null ? DateFormat("dd, MMM").format(endDate!) : '-'}',
//                   style: const TextStyle(
//                     fontWeight: FontWeight.w400,
//                     fontSize: 18,
//                     color: Colors.black,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       // floatingActionButton: FloatingActionButton(
//       //   onPressed: () {
//       //     showCustomDateRangePicker(
//       //       context,
//       //       dismissible: true,
//       //       minimumDate: DateTime.now().subtract(const Duration(days: 30)),
//       //       maximumDate: DateTime.now().add(const Duration(days: 30)),
//       //       endDate: endDate,
//       //       startDate: startDate,
//       //       backgroundColor: Colors.white,
//       //       primaryColor: Colors.green,
//       //       onApplyClick: (start, end) {
//       //         setState(() {
//       //           endDate = end;
//       //           startDate = start;
//       //         });
//       //       },
//       //       onCancelClick: () {
//       //         setState(() {
//       //           endDate = null;
//       //           startDate = null;
//       //         });
//       //       },
//       //     );
//       //   },
//       //   tooltip: 'choose date Range',
//       //   child: const Icon(Icons.calendar_today_outlined, color: Colors.white),
//       // ),
//     );
//   }
// }

class _LongTermTaskState extends State<LongTermTask> {
  DateTime? startDate;
  DateTime? endDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, bottom: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              showCustomDateRangePicker(
                context,
                dismissible: true,
                minimumDate: DateTime.now().subtract(const Duration(days: 30)),
                maximumDate: DateTime.now().add(const Duration(days: 30)),
                endDate: endDate,
                startDate: startDate,
                backgroundColor: Colors.white,
                primaryColor: Colors.green,
                onApplyClick: (start, end) {
                  setState(() {
                    endDate = end;
                    startDate = start;
                  });
                },
                onCancelClick: () {
                  setState(() {
                    endDate = null;
                    startDate = null;
                  });
                },
              );
            },
            child: Container(
              padding: EdgeInsets.all(8),
              width: 200,
              height: 50,
              color: Colors.blue.shade100,
              child: Row(
                children: [
                  Text(
                    'Choose a date Range',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Colors.black),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  CustomIconButton(
                      onTap: () {
                        // Get.toNamed(
                        //   AppRoutes.calendarScreen,
                        // );
                      },
                      height: 20.v,
                      width: 20.h,
                      decoration: IconButtonStyleHelper.fillGray,
                      child:
                          CustomImageView(imagePath: ImageConstant.imgCalendar))
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'From ${startDate != null ? DateFormat("dd, MMM").format(startDate!) : '-'} \t to \t ${endDate != null ? DateFormat("dd, MMM").format(endDate!) : '-'}',
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 13,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
