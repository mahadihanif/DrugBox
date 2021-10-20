import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:drugboxappv1/Services/auth_service.dart';
import 'package:drugboxappv1/Views/sign_up_View.dart';
import 'package:drugboxappv1/widgets/provider_widget.dart';
import 'package:drugboxappv1/Views/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:drugboxappv1/Views/home_screen.dart';
import 'Views/firstView.dart';



Future<void> main() async {
  AwesomeNotifications().initialize(
    'resource://drawable/flutter_icon',
    [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic Notifications',
        defaultColor: Colors.teal,
        importance: NotificationImportance.High,
        channelShowBadge: true,
      ),
      NotificationChannel(
        channelKey: 'scheduled_channel',
        channelName: 'Scheduled Notifications',
        defaultColor: Colors.teal,  
        locked: true,
        importance: NotificationImportance.High,
        playSound: true,
        vibrationPattern: lowVibrationPattern,
        soundSource: 'resource://raw/res_a_long_cold_sting.wav'
      ),
    ],
  );
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

