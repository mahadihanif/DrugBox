import 'package:drugboxappv1/Views/add_new_alarm.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class AlarmScreen extends StatefulWidget {
  @override
  _AlarmScreenState createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0.0,
      ),
      body: Container(
        color: Color(0xFFF6F8FC),
        child: Column(
          children: [
            Flexible(flex: 2, child: TopContainer()),
            SizedBox(
              height: 10,
            ),
            Flexible(
              flex: 8,
              child: BottomContainer(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 4,
       
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          Navigator.push(
              context,
              PageTransition(
                  child: AddAlarm(), type: PageTransitionType.fade));
        },
      ),
    );
  }
}

class TopContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.elliptical(50, 27),
          bottomRight: Radius.elliptical(50, 27),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Colors.grey[400],
            offset: Offset(0, 3.5),
          )
        ],
        color: Colors.deepPurple,
      ),
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              bottom: 10,
            ),
            child: Column(
              children: [
                Text(
                  "Medicine",
                  style: TextStyle(
                    fontFamily: "Angel",
                    fontSize: 32,
                    color: Colors.white,
                    letterSpacing: 1.5,
                  ),
                ),
                Text(
                  "Alarm",
                  style:GoogleFonts.lato(textStyle:TextStyle(
                    fontFamily: "Angel",
                    fontSize: 32,
                    color: Colors.white,
                    letterSpacing: 1.5,
                  ),)
                ),
              ],
            ),
          ),
          Divider(
            color: Color(0xFF939B96),
          ),
          Padding(
            padding: EdgeInsets.only(top: 12.0),
            child: Center(
              child: Text(
                "Number of Medicine Reminder",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.elliptical(50, 27),
          topRight: Radius.elliptical(50, 27),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Colors.grey[400],
            offset: Offset(0, 3.5),
          )
        ],
        color: Colors.deepPurple[50],
      ),
    );
  }
}
