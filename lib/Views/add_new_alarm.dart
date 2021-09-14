import 'dart:ffi';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:multi_select_flutter/bottom_sheet/multi_select_bottom_sheet_field.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:provider/provider.dart';
import '../main.dart';

class MedicineSchedule {
  int id;
  String name;

  MedicineSchedule({this.id, this.name});
}

class AddAlarm extends StatefulWidget {
  AddAlarm({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _AddAlarmState createState() => _AddAlarmState();
}

class _AddAlarmState extends State<AddAlarm> {
  String frequencyChoose = "Once a day";
  // String dateGroupValue;
  

  TimeOfDay _time1 = TimeOfDay.now();
  TimeOfDay _time2 = TimeOfDay.now();
  TimeOfDay _time3 = TimeOfDay.now();
  DateTime _date = DateTime.now();

  static List<MedicineSchedule> _days = [
    MedicineSchedule(id: 1, name: "Saturday"),
    MedicineSchedule(id: 2, name: "Sunday"),
    MedicineSchedule(id: 3, name: "Monday"),
    MedicineSchedule(id: 4, name: "Tuesday"),
    MedicineSchedule(id: 5, name: "Wednesday"),
    MedicineSchedule(id: 6, name: "Thursday"),
    MedicineSchedule(id: 7, name: "Friday"),
  ];

  final _items = _days
      .map((item) => MultiSelectItem<MedicineSchedule>(item, item.name))
      .toList();
  List<MedicineSchedule> _selectedItems2 = [];
  List<MedicineSchedule> _selectedItems3 = [];
  final _multiSelectKey = GlobalKey<FormFieldState>();
  // ignore: non_constant_identifier_names
  String HintText = "Select a day";

  List frequency = [
    "Once a day",
    "Twice a day",
    "Thrice a day",
  ];

  @override
  void initState() {
    super.initState();
    // Provider.of<NotificationService>(context, listen: false).initialize();
    super.initState();
    // _time1 = TimeOfDay.now();
    // _time2 = TimeOfDay.now();
    // _time3 = TimeOfDay.now();
  }

  Future<Void> selectDate(BuildContext context) async {
    DateTime datePicker = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(2021),
        lastDate: DateTime(2030));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        iconTheme: IconThemeData(
          color: Color(0xFFFFFFFF),
        ),
        centerTitle: true,
        title: Text(
          "Add New Reminder",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        elevation: 0.0,
      ),

      body: Container(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.deepPurple.shade200,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListTile(
              title: Text(
                "Medicine Name",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
              ),
              subtitle: TextFormField(
                maxLength: 12,

                style: TextStyle(
                  fontSize: 16,
                ),
                // controller: nameController,
                autofocus: true,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  hintText: "eg: Napa",
                  border: UnderlineInputBorder(),
                ),
              ),
            ),
          ),
          // SizedBox(
          //   height: 15,
          // ),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.deepPurple.shade200,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Reminder time",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Frequency",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      DropdownButton(
                        // hint: Text("Select frequency"),
                        dropdownColor: Colors.deepPurple.shade200,
                        value: frequencyChoose,
                        onChanged: (newValue) {
                          setState(() {
                            frequencyChoose = newValue;
                          });
                        },
                        items: frequency.map((valueItem) {
                          return DropdownMenuItem(
                              value: valueItem, child: Text(valueItem));
                        }).toList(),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  frequencyRow(context, frequencyChoose),
                ],
              ),
            ),
          ),

          Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.deepPurple.shade200,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Schedule",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  MultiSelectBottomSheetField<MedicineSchedule>(
                    initialChildSize: 0.7,
                    maxChildSize: 0.95,
                    listType: MultiSelectListType.CHIP,
                    checkColor: Colors.pink,
                    selectedColor: Colors.pink,
                    selectedItemsTextStyle: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                    unselectedColor: Colors.greenAccent[200],
                    buttonIcon: Icon(
                      Icons.add,
                      color: Colors.pinkAccent,
                    ),
                    searchHintStyle: TextStyle(
                      fontSize: 20,
                    ),
                    searchable: false,
                    buttonText: Text(
                      '$HintText',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                    ),
                    title: Text(
                      "Days",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.pink,
                      ),
                    ),
                    items: _items,
                    onConfirm: (values) {
                      setState(() {
                        _selectedItems2 = values;
                      });
                      // print('selected : ${_selectedItems2}');

                      _selectedItems2
                          .forEach((item) => print("${item.id} ${item.name}"));
                      /*senduserdata(
                    'partnerreligion', '${_selectedItems2.toString()}');*/
                    },
                    chipDisplay: MultiSelectChipDisplay(
                      textStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                      onTap: (value) {
                        setState(() {
                          _selectedItems2.remove(value);
                        });

                        // print('removed: ${_selectedItems2.toString()}');
                      },
                    ),
                  ),
                  _selectedItems2 == null || _selectedItems2.isEmpty
                      ? MultiSelectChipDisplay(
                          onTap: (item) {
                            setState(() {
                              _selectedItems3.remove(item);
                              // print('removed below: ${_selectedItems3.toString()}');
                            });
                            _multiSelectKey.currentState.validate();
                          },
                        )
                      : MultiSelectChipDisplay(),
                ],
              ),
            ),
          ),
        ]),
      )),
      floatingActionButton: FloatingActionButton(
        elevation: 4,
        // backgroundColor: Colors.black,
        child: Icon(Icons.add),
        onPressed: () {
          scheduleAlarm();
        },
      ),
    );
  }

  Widget frequencyRow(BuildContext context, String choose) {
    if (choose == "Once a day") {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              pickTime1();
            },
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(Icons.timer_rounded),
                ),
                Text(
                  "${_time1.hour}:${_time1.minute}",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              child: DropdownButton(
                hint: Text("Select frequency"),
                dropdownColor: Colors.deepPurple.shade200,
                value: frequencyChoose,
                onChanged: (newValue) {
                  setState(() {
                    // frequencyChoose = newValue;
                  });
                },
                items: frequency.map((valueItem) {
                  return DropdownMenuItem(
                      value: valueItem, child: Text(valueItem));
                }).toList(),
              ),
            ),
          )
        ],
      );
    } else if (choose == "Thrice a day") {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              pickTime1();
            },
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(Icons.timer_rounded),
                ),
                Text(
                  "${_time1.hour}:${_time1.minute}",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              pickTime2();
            },
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(Icons.timer_rounded),
                ),
                Text(
                  "${_time2.hour}:${_time2.minute}",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              pickTime3();
            },
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(Icons.timer_rounded),
                ),
                Text(
                  "${_time3.hour}:${_time3.minute}",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
                ),
              ],
            ),
          ),
        ],
      );
    } else {
      return Column(
        children: [
          InkWell(
            onTap: () {
              pickTime1();
            },
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(Icons.timer_rounded),
                ),
                Text(
                  "${_time1.hour}:${_time1.minute}",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              pickTime2();
            },
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(Icons.timer_rounded),
                ),
                Text(
                  "${_time2.hour}:${_time2.minute}",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
                ),
              ],
            ),
          ),
        ],
      );
    }
  }

  ///////////////////////*****/ time takeing method *****///////////////

  pickTime1() async {
    TimeOfDay time = await showTimePicker(
        context: context,
        initialTime: _time1,
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData(
                primaryColor: Color(0xFFC41A3B),
                accentColor: Color(0xFFC41A3B),

                ),
            child: MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(alwaysUse24HourFormat:false),
                child: child),
          );
        });

    if (time != null)
      setState(() {
        _time1 = time;
      });
  }

  pickTime2() async {
    TimeOfDay time = await showTimePicker(
        context: context,
        initialTime: _time2,
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData(
                // primaryColor: Colors.purpleAccent,
                // accentColor: Colors.amber,

                ),
            child: MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(alwaysUse24HourFormat: false),
                child: child),
          );
        });

    if (time != null)
      setState(() {
        _time2 = time;
      });
  }

  pickTime3() async {
    TimeOfDay time = await showTimePicker(
        context: context,
        initialTime: _time3,
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData(
                // primaryColor: Colors.purpleAccent,
                // accentColor: Colors.amber,

                ),
            child: MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(alwaysUse24HourFormat: false),
                child: child),
          );
        });

    if (time != null)
      setState(() {
        _time3 = time;
      });
  }

  void scheduleAlarm() async {
    var scheduledNotificationDateTime =
        DateTime.now().add(Duration(seconds: 5));
    var vibrationPattern = Int64List(4);
    vibrationPattern[0] = 0;
    vibrationPattern[1] = 1000;
    vibrationPattern[2] = 5000;
    vibrationPattern[3] = 2000;

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'alarm_notif',
      'alarm_notif',
      'Channel for Alarm notification',
      icon: 'flutter_icon',
      playSound: true,
      sound: RawResourceAndroidNotificationSound('a_long_cold_sting'),
      largeIcon: DrawableResourceAndroidBitmap('flutter_icon'),
    );

    var iOSPlatformChannelSpecifics = IOSNotificationDetails(
        sound: 'a_long_cold_sting.wav',
        presentAlert: true,
        presentBadge: true,
        presentSound: true);
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.schedule(
        0,
        'Office',
        'Good morning! Time for office.',
        scheduledNotificationDateTime,
        platformChannelSpecifics);
  }
}
