import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:drugboxappv1/Views/slideBar.dart';
import 'package:drugboxappv1/grid_dashBoard.dart';
import 'package:drugboxappv1/widgets/provider_widget.dart';
import 'package:drugboxappv1/Services/auth_service.dart';
import 'medicineList.dart';
import 'my_medicine.dart';
import 'alarm_screen.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // int _currentIndex = 0;
  // final List<Widget> _children = [
  //   DashBoard(),
  //   SearchMedicine(),
  //   MyMedicine(),
  //   AlarmScreen(),

  // ];
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SlideBar(),
      // backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: Center(child: Text('Medicine | DrugBox')),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: Icon(Icons.undo),
            onPressed: () async {
              try {
                AuthService auth = Provider.of(context).auth;
                await auth.signOut();
                print("Signed Out!");
              } catch (e) {
                print (e);
              }
            },
          )
        ],
        shape: ShapeBorder.lerp(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ),
          ),
          null,
          0,
        ),
      ),

      

//home Screen Body Start.....
      body: 
      // _children[_currentIndex],
      DashBoard(),




      // bottomNavigationBar: BottomNavigationBar(
      //   onTap: onTabTapped,
      //   currentIndex: _currentIndex,
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: new Icon(Icons.home),
      //       label: ("Home"),
      //     ),
      //      BottomNavigationBarItem(
      //       icon: new Icon(Icons.search),
      //       label: ("Search Medicine"),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: new Image.asset(
      //         "assets/images/capsule.png",
      //         height: 20,
      //         width: 20,
      //       ),
      //       label: ("My Medicine"),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: new Icon(Icons.alarm),
      //       label: ("Medicine Alarm"),
      //     ),
      //   ],
      // ),



      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     await _auth.signOut();
      //     Navigator.pushReplacement(
      //         context, MaterialPageRoute(builder: (context) => LoginScreen()));
      //   },
      //   child: Icon(Icons.logout),
      // ),
    );
  }

  // void onTabTapped(int index) {
  //   setState(() {
  //     _currentIndex = index;
  //   });
  // }
}
