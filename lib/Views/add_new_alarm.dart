import 'dart:ffi';

import 'package:flutter/material.dart';

class AddAlarm extends StatefulWidget {
  @override
  _AddAlarmState createState() => _AddAlarmState();
}

class _AddAlarmState extends State<AddAlarm> {
  String frequencyChoose = "Once a day";
  String dateGroupValue = "";
  TimeOfDay _time1;
  TimeOfDay _time2;
  TimeOfDay _time3;
  DateTime _date = DateTime.now();
  List frequency = [
    "Once a day",
    "Twice a day",
    "Thrice a day",
  ];

  @override
  void initState() {
    super.initState();
    _time1 = TimeOfDay.now();
    _time2 = TimeOfDay.now();
    _time3 = TimeOfDay.now();
  }

  Future<Void> selectDate(BuildContext context) async {
    DateTime datePicker = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(2020),
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
                  Text(
                    "Here will be the time function",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
                  ),
                  Row(
                    children: [
                      Radio(
                          value: "everyday",
                          groupValue: dateGroupValue,
                          onChanged: (val) {
                            dateGroupValue = val;
                            setState(() {});
                          }),
                      Text("Everyday")
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                          value: "customDay",
                          groupValue: dateGroupValue,
                          onChanged: (val) {
                            dateGroupValue = val;
                            setState(() {});
                          }),
                      Text("Weekly Specific day")
                    ],
                  )
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
        onPressed: () {},
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
}
