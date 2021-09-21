import 'package:rxdart/rxdart.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';

class NotificationApi {
  static final _notifications = FlutterLocalNotificationsPlugin();
  static final onNOtifications = BehaviorSubject<String>();

  static Future _notificationDetails() async {
    return NotificationDetails(
      android: AndroidNotificationDetails(
        "channel id",
        "channel name",
        "channel description",
        importance: Importance.max,
      ),
      iOS: IOSNotificationDetails(),
    );
  }

  // static Future init({bool initScheduled = false}) async {
  //   final android = AndroidInitializationSettings("@mipmap/ic_launcher");
  //   // final ios = IOSInitializationSettings();
  //   final settings = InitializationSettings(android: android);
  //   await _notifications.initialize(
  //     settings,
  //     onSelectNotification: (payload) async {
  //       onNOtifications.add(payload);
  //     },
  //   );
  //   if (initScheduled) {
  //     tz.initializeTimeZones();
  //     final locationName = await FutureNativeTimezone.getLocalTimezone(
  //     tz.setLocalLocation(tz.getLocation(locationName));  
  //     )
  //   }
  // }

  static Future showNotification({
    int id = 0,
    String title,
    String body,
    String payload,
  }) async =>
      _notifications.show(
        id,
        title,
        body,
        await _notificationDetails(),
        payload: payload,
      );

  // static Future showScheduleNotification({
  //   int id = 0,
  //   String title,
  //   String body,
  //   String payload,
  //   required DateTime scheduleDate,
  // }) async =>
  //     _notifications.zonedSchedule(
  //       id,
  //       title,
  //       body,
  //       _scheduleDaily(Time(8, 30, 0)),
  //       await _notificationDetails(),
  //       payload: payload,
  //       androidAllowWhileIdle: true,
  //       uiLocalNotificationDateInterpretation:
  //           UILocalNotificationDateInterpretation.absoluteTime,
  //       matchDateTimeComponents: DateTimeComponents.time,
  //     );

  static tz.TZDateTime _scheduleDaily(Time time) {
    final now = tz.TZDateTime.now(tz.local);
  }
}
