import 'package:drugboxappv1/Views/alarm_screen.dart';
import 'package:drugboxappv1/Views/medicineList.dart';
import 'package:drugboxappv1/Views/search_medicine_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:drugboxappv1/Views/my_medicine.dart';
import 'package:google_fonts/google_fonts.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  Material myItems(IconData icon, String heading, int color, Function onTap) {
    return Material(
      color: Colors.white70,
      elevation: 14.0,
      shadowColor: Color(0x80400DEB),
      borderRadius: BorderRadius.circular(24.0),
      child: InkWell(
        splashColor: Colors.deepPurple,
        borderRadius: BorderRadius.circular(24.0),
        onTap: onTap,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Material(
                      color: new Color(color),
                      borderRadius: BorderRadius.circular(24.0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Icon(
                          icon,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      ),
                    ),

                    //Text
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        heading,
                        style: TextStyle(
                          color: new Color(color),
                          fontSize: 19.0,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  String greetingMessage() {
    var timeNow = DateTime.now().hour;

    if ((timeNow <= 12) && (timeNow >= 4)) {
      return 'Good Morning!';
    } else if ((timeNow > 12) && (timeNow <= 15)) {
      return 'Good Noon!';
    } else if ((timeNow > 15) && (timeNow <= 17)) {
      return 'Good Afternoon!';
    } else if ((timeNow > 17) && (timeNow < 20)) {
      return 'Good Evening!';
    } else {
      return 'Good Night!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StaggeredGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 20.0,
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        children: [
          Container(
            child: Center(
              child: Text(
                greetingMessage(),
                style: TextStyle(fontSize: 28, letterSpacing: 3.0),
              ),
            ),
          ),
          myItems(Icons.search, "Search Medicine", 0xFF0E8366, () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SearchMedicine()));
          }),
          Builder(builder: (BuildContext con) {
            return myItems(Icons.local_hospital, "My Medicine", 0xFF115097, () {
              // var firebaseUser = 0;
              // var firebaseUser = FirebaseAuth.instance;

              // if (firebaseUser.currentUser != null) {
              //   return 
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyMedicine()));
              // } else {
              //   Scaffold.of(con).showSnackBar(
              //       SnackBar(content: Text("Please login first"),
              //       duration: Duration(seconds: 3),));
               
              // }
            });
          }),

          Builder(builder: (BuildContext con) {
            return 
            myItems(Icons.alarm, "Medicine Alarm", 0xFF308DB8, () {
              // var firebaseUser = 0;
              // var firebaseUser = FirebaseAuth.instance;

              // if (firebaseUser.currentUser != null) {
              //   return 
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AlarmScreen()));
              // } else {
              //   Scaffold.of(con).showSnackBar(
              //       SnackBar(content: Text("Please login first"),
              //       duration: Duration(seconds: 3),));
               
              // }
            });
          }),



          // myItems(Icons.alarm, "Medicine Alarm", 0xFF308DB8, () {
          //   Navigator.push(context,
          //       MaterialPageRoute(builder: (context) => AlarmScreen()));
          // }),
          myItems(Icons.calculate, "Calculator", 0xFF79AD17, () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyMedicine()));
          }),
          myItems(Icons.notifications, "Notification", 0xFF252397, () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyMedicine()));
          }),
        ],
        staggeredTiles: [
          StaggeredTile.extent(2, 100.0),
          StaggeredTile.extent(1, 130.0),
          StaggeredTile.extent(1, 130.0),
          StaggeredTile.extent(1, 130.0),
          StaggeredTile.extent(1, 130.0),
          StaggeredTile.extent(1, 150.0),
        ],
      ),
    );
  }
}
