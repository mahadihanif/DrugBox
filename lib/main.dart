import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'Helpers/Headers.dart';
import 'Services/ManageData.dart';
import 'package:drugboxappv1/Views/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:drugboxappv1/Views/home_screen.dart';
import 'package:drugboxappv1/Views/login_screen.dart';
import 'package:provider/provider.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var initializationSettingsAndroid =
      AndroidInitializationSettings(
        'flutter_icon');
        
  var initializationSettingsIOS = IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification:
          (int id, String title, String body, String payload) async {});
  var initializationSettings = InitializationSettings(
       initializationSettingsAndroid, initializationSettingsIOS);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
  });

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
        // ChangeNotifierProvider.value(value: MultipleNotifire()),
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
              // LoginScreen()
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
