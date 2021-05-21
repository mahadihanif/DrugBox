import 'package:flutter/material.dart';

class AddAlarm extends StatefulWidget {
  @override
  _AddAlarmState createState() => _AddAlarmState();
}

class _AddAlarmState extends State<AddAlarm> {
  String frequencyChoose;
  List frequency = [
    "Once a day",
    "Twice a day",
    "Thrice a day",
  ];

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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Frequency",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      DropdownButton(
                        hint: Text("Once a day"),
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
                  Divider(color: Colors.black,),


                  Text(
                    "Here will be the time function",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
                  ),


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
                  
                  Divider(color: Colors.black,),


                  Text(
                    "Here will be the time function",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
                  ),
                  Row(
                    children: [
                      Radio(value: null, groupValue: null, onChanged: null),
                      Text("Everyday")
                    ],
                  ),
                  Row(
                    children: [
                      Radio(value: null, groupValue: null, onChanged: null),
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
        onPressed: (){},),
    );
  }
}
