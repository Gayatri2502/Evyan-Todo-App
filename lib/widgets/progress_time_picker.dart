import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:progressive_time_picker/progressive_time_picker.dart';

class ProgressTimePickerWidget extends StatefulWidget {
  ProgressTimePickerWidget({Key? key}) : super(key: key);

  @override
  _ProgressTimePickerWidgetState createState() =>
      _ProgressTimePickerWidgetState();
}

class _ProgressTimePickerWidgetState extends State<ProgressTimePickerWidget> {
  ClockTimeFormat _clockTimeFormat = ClockTimeFormat.twentyFourHours;
  ClockIncrementTimeFormat _clockIncrementTimeFormat =
      ClockIncrementTimeFormat.fiveMin;

  PickedTime _inBedTime = PickedTime(h: 0, m: 0);
  PickedTime _outBedTime = PickedTime(h: 8, m: 0);
  PickedTime _intervalBedTime = PickedTime(h: 0, m: 0);

  PickedTime _disabledInitTime = PickedTime(h: 12, m: 0);
  PickedTime _disabledEndTime = PickedTime(h: 20, m: 0);

  double _sleepGoal = 8.0;
  bool _isSleepGoal = false;

  bool? validRange = true;

  @override
  void initState() {
    super.initState();
    _isSleepGoal = (_sleepGoal >= 8.0) ? true : false;
    _intervalBedTime = formatIntervalTime(
      init: _inBedTime,
      end: _outBedTime,
      clockTimeFormat: _clockTimeFormat,
      clockIncrementTimeFormat: _clockIncrementTimeFormat,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('working hours'),
      ),
      // backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TimePicker(
                initTime: _inBedTime,
                endTime: _outBedTime,
                disabledRange: DisabledRange(
                  initTime: _disabledInitTime,
                  endTime: _disabledEndTime,
                  disabledRangeColor: Colors.grey,
                  errorColor: Colors.red,
                ),
                height: 400.0,
                width: 400.0,
                onSelectionChange: _updateLabels,
                onSelectionEnd: (start, end, isDisableRange) => print(
                    'onSelectionEnd => init : ${start.h}:${start.m}, end : ${end.h}:${end.m}, isDisableRange: $isDisableRange'),
                primarySectors: _clockTimeFormat.value,
                secondarySectors: _clockTimeFormat.value * 2,
                decoration: TimePickerDecoration(
                  baseColor: Color(0xFF1F2633),
                  pickerBaseCirclePadding: 15.0,
                  sweepDecoration: TimePickerSweepDecoration(
                    pickerStrokeWidth: 30.0,
                    pickerColor:
                        _isSleepGoal ? Color(0xFF3CDAF7) : Colors.indigo,
                    showConnector: true,
                  ),
                  initHandlerDecoration: TimePickerHandlerDecoration(
                    color: Color(0xFF141925),
                    shape: BoxShape.circle,
                    radius: 12.0,
                    icon: Icon(
                      Icons.power_settings_new_outlined,
                      size: 20.0,
                      color: Color(0xFF3CDAF7),
                    ),
                  ),
                  endHandlerDecoration: TimePickerHandlerDecoration(
                    color: Color(0xFF141925),
                    shape: BoxShape.circle,
                    radius: 12.0,
                    icon: Icon(
                      Icons.notifications_active_outlined,
                      size: 20.0,
                      color: Color(0xFF3CDAF7),
                    ),
                  ),
                  primarySectorsDecoration: TimePickerSectorDecoration(
                    color: Colors.indigo,
                    width: 1.0,
                    size: 4.0,
                    radiusPadding: 25.0,
                  ),
                  secondarySectorsDecoration: TimePickerSectorDecoration(
                    color: Color(0xFF3CDAF7),
                    width: 1.0,
                    size: 2.0,
                    radiusPadding: 25.0,
                  ),
                  clockNumberDecoration: TimePickerClockNumberDecoration(
                    defaultTextColor: Colors.indigo,
                    defaultFontSize: 12.0,
                    scaleFactor: 2.0,
                    showNumberIndicators: true,
                    clockTimeFormat: _clockTimeFormat,
                    clockIncrementTimeFormat: _clockIncrementTimeFormat,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(62.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${intl.NumberFormat('00').format(_intervalBedTime.h)}Hr ${intl.NumberFormat('00').format(_intervalBedTime.m)}Min',
                        style: TextStyle(
                          fontSize: 14.0,
                          color:
                              _isSleepGoal ? Color(0xFF3CDAF7) : Colors.indigo,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 300.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xFF1F2633),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    _isSleepGoal
                        ? "Above Sleep Goal (>=8) 😇"
                        : 'below Sleep Goal (<=8) 😴',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _timeWidget(
                    'BedTime',
                    _inBedTime,
                    Icon(
                      Icons.power_settings_new_outlined,
                      size: 25.0,
                      color: Color(0xFF3CDAF7),
                    ),
                  ),
                  _timeWidget(
                    'WakeUp',
                    _outBedTime,
                    Icon(
                      Icons.notifications_active_outlined,
                      size: 25.0,
                      color: Color(0xFF3CDAF7),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                height: 40,
                width: 300,
                padding: EdgeInsets.all(8),
                child: Text(
                  validRange == true
                      ? "Working hours ${intl.NumberFormat('00').format(_disabledInitTime.h)}:${intl.NumberFormat('00').format(_disabledInitTime.m)} to ${intl.NumberFormat('00').format(_disabledEndTime.h)}:${intl.NumberFormat('00').format(_disabledEndTime.m)}"
                      : "Please schedule according working time!",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: validRange == true ? Colors.indigo : Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _timeWidget(String title, PickedTime time, Icon icon) {
    return Container(
      width: 150.0,
      decoration: BoxDecoration(
        color: Color(0xFF1F2633),
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Text(
              '${intl.NumberFormat('00').format(time.h)}:${intl.NumberFormat('00').format(time.m)}',
              style: TextStyle(
                color: Color(0xFF3CDAF7),
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            Text(
              '$title',
              style: TextStyle(
                color: Color(0xFF3CDAF7),
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            icon,
          ],
        ),
      ),
    );
  }

  void _updateLabels(PickedTime init, PickedTime end, bool? isDisableRange) {
    _inBedTime = init;
    _outBedTime = end;
    _intervalBedTime = formatIntervalTime(
      init: _inBedTime,
      end: _outBedTime,
      clockTimeFormat: _clockTimeFormat,
      clockIncrementTimeFormat: _clockIncrementTimeFormat,
    );
    _isSleepGoal = validateSleepGoal(
      inTime: init,
      outTime: end,
      sleepGoal: _sleepGoal,
      clockTimeFormat: _clockTimeFormat,
      clockIncrementTimeFormat: _clockIncrementTimeFormat,
    );
    setState(() {
      validRange = isDisableRange;
    });
  }
}
