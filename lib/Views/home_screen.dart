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
  int _currentTab = 0;
  final List<Widget> _screens = [
    DashBoard(),
    SearchMedicine(),
    MyMedicine(),
    AlarmScreen(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  final _auth = FirebaseAuth.instance;
  Widget currentScreen = DashBoard();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//home Screen Body Start.....
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left tab
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = DashBoard();
                        _currentTab = 0;
                      });
                    },
                    child: Column(                      
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.dashboard,
                          color: _currentTab == 0 ? Colors.green : Colors.grey,
                        ),
                        Text(
                          'Dashboard',
                          style: TextStyle(color: _currentTab == 0 ? Colors.green : Colors.grey,),
                  
                        )
                      ],
                    ),
                    
                  ),


                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = SearchMedicine();
                        _currentTab = 1;
                      });
                    },
                    child: Column(                      
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search,
                          color: _currentTab == 1 ? Colors.green : Colors.grey,
                        ),
                        Text(
                          'Search',
                          style: TextStyle(color: _currentTab == 1 ? Colors.green : Colors.grey,),
                  
                        )
                      ],
                    ),
                    
                  ),
                ],
              ),


              // Right Tab
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = MyMedicine();
                        _currentTab = 2;
                      });
                    },
                    child: Column(                      
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.medication,
                          color: _currentTab == 2 ? Colors.green : Colors.grey,
                        ),
                        Text(
                          'My Medicine',
                          style: TextStyle(color: _currentTab == 2 ? Colors.green : Colors.grey,),
                  
                        )
                      ],
                    ),
                    
                  ),


                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = AlarmScreen();
                        _currentTab = 3;
                      });
                    },
                    child: Column(                      
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.alarm,
                          color: _currentTab == 3 ? Colors.green : Colors.grey,
                        ),
                        Text(
                          'Alarm',
                          style: TextStyle(color: _currentTab == 3 ? Colors.green : Colors.grey,),
                  
                        )
                      ],
                    ),
                    
                  ),
                ],
              )
            ],
          ),
        ),
      ),

      //body: _screens[_currentTab],

      // bottomNavigationBar: BottomNavigationBar(
      //   // backgroundColor: Colors.grey,
      //   // fixedColor: Colors.amber,
      //   onTap: onTabTapped,
      //   currentIndex: _currentTab,
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: new Icon(Icons.home),
      //       label: ("Home"),
      //     ),
      //     BottomNavigationBarItem(
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
    );
  }

  // void onTabTapped(int index) {
  //   setState(() {
  //     _currentTab = index;
  //   });
  // }
}
