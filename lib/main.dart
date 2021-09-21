import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drugboxappv1/Services/auth_service.dart';
// import 'package:drugboxappv1/Views/alarm_screen.dart';
import 'package:drugboxappv1/Views/navigation_view.dart';
import 'package:drugboxappv1/Views/sign_up_View.dart';
import 'package:drugboxappv1/widgets/provider_widget.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'Services/custom_colors.dart';
import 'package:drugboxappv1/Views/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:drugboxappv1/Views/home_screen.dart';
import 'Views/firstView.dart';


// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

// var initializationSettingsAndroid =
//     AndroidInitializationSettings('flutter_icon');

// var initializationSettingsIOS = IOSInitializationSettings(
//     requestAlertPermission: true,
//     requestBadgePermission: true,
//     requestSoundPermission: true,
//     onDidReceiveLocalNotification:
//         (int id, String title, String body, String payload) async {});
// var initializationSettings = InitializationSettings(
//     initializationSettingsAndroid, initializationSettingsIOS);
// await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//     onSelectNotification: (String payload) async {
//   if (payload != null) {
//     debugPrint('notification payload: ' + payload);
//   }
// });

//   await Firebase.initializeApp();
//   runApp(MyApp());
// }
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      auth: AuthService(),
      // db: FirebaseFirestore.instance,
      // colors: colors,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "DrugBox | Medicine Reminder",
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: SplashScreen(),
        routes: <String, WidgetBuilder>{
          "/signUp": (BuildContext context) =>  SignUpView(authFormType: AuthFormType.signUp),
          '/signIn': (BuildContext context) => SignUpView(authFormType: AuthFormType.signIn),
          '/anonymousSignIn': (BuildContext context) => SignUpView(authFormType: AuthFormType.anonymous),
          "/home": (BuildContext context) => HomeController(),
          "/home1": (BuildContext context) => HomeScreen(),

        },
      ),
    );
  }
}

class HomeController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService auth = Provider.of(context).auth;
    return StreamBuilder<String>(
      stream: auth.authStateChanges,
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final bool signedIn = snapshot.hasData;
          return signedIn ? HomeScreen() : FirstView();
        }
        return Container();
      },
    );
  }
}

// class InitializerWidget extends StatefulWidget {
//   @override
//   _InitializerWidgetState createState() => _InitializerWidgetState();
// }

// class _InitializerWidgetState extends State<InitializerWidget> {
//   FirebaseAuth _auth;

//   User _user;

//   bool isLoading = true;

//   @override
//   void initState() {
//     //
//     super.initState();
//     _auth = FirebaseAuth.instance;
//     _user = _auth.currentUser;
//     isLoading = false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return isLoading
//         ? Scaffold(
//             body: Center(
//               child: CircularProgressIndicator(),
//             ),
//           )
//         : _user == null
//             ? LoginScreen()
//             : HomeScreen();
//   }
// }
