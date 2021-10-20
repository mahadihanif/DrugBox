import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:drugboxappv1/Services/utilities.dart';


Future<void> createPlantFoodNotification() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: createUniqueId(),
      channelKey: 'basic_channel',
      title:
          '${Emojis.medical_pill + Emojis.time_alarm_clock} Medicine Reminder!!!',
      body: 'Time to take your medicine.',
      notificationLayout: NotificationLayout.BigText,
    ),
  );
}


// Future<void> createWaterReminderNotification(
//     NotificationWeekAndTime notificationSchedule) async {
//   await AwesomeNotifications().createNotification(
//     content: NotificationContent(
//       id: createUniqueId(),
//       channelKey: 'scheduled_channel',
//       title: '${Emojis.medical_pill + Emojis.time_alarm_clock} Medicine Reminder!!!',
//       body: 'Time to take your medicine.',
//       notificationLayout: NotificationLayout.Default,
//     ),
//     actionButtons: [
//       NotificationActionButton(
//         key: 'MARK_DONE',
//         label: 'Mark Done',
//       ),
//     ],
//     schedule: NotificationCalendar(
//       weekday: notificationSchedule.dayOfTheWeek,
//       hour: notificationSchedule.timeOfDay.hour,
//       minute: notificationSchedule.timeOfDay.minute,
//       second: 0,
//       millisecond: 0,
//       repeats: true,
//     ),
    
//   );
// }

// Future<void> cancelScheduledNotifications() async {
//   await AwesomeNotifications().cancelAllSchedules();
// }