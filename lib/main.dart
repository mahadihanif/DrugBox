
import 'Helpers/Headers.dart';
import 'Services/ManageData.dart';
import 'package:drugboxappv1/Views/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:drugboxappv1/Views/home_screen.dart';
import 'package:drugboxappv1/Views/login_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Headers()),
        ChangeNotifierProvider.value(value: ManageData()),
      ],
      child: MaterialApp(
          title: 'DrugBox',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.deepPurple,
            primaryColor: Colors.purpleAccent,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home:
              // Column(
              //   children: [
              //     SplashScreen(),
              //     // InitializerWidget(),

              //   ],
              // ) 
              
              SplashScreen()
          // SearchMedicine()
          // HomeScreen()
          // InitializerWidget()
          ),
    );
  }
}

class InitializerWidget extends StatefulWidget {
  @override
  _InitializerWidgetState createState() => _InitializerWidgetState();
}

class _InitializerWidgetState extends State<InitializerWidget> {
  FirebaseAuth _auth;

  User _user;

  bool isLoading = true;

  @override
  void initState() {
    //
    super.initState();
    _auth = FirebaseAuth.instance;
    _user = _auth.currentUser;
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : _user == null
            ? LoginScreen()
            : HomeScreen();
  }
}
