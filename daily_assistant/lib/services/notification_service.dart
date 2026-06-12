import 'package/flutter_local_notifications.dart';
import 'package/data/latest.dart' as tz;
import 'package/timezone.dart' as tz;

class NotificationService {
static final FlutterLocalNotificationsPlugin notifications =
FlutterLocalNotificationsPlugin();

static Future init() async {
tz.initializeTimeZones();

const AndroidInitializationSettings androidSettings =
    AndroidInitializationSettings('@mipmap/ic_launcher');

const InitializationSettings settings =
    InitializationSettings(
  android: androidSettings,
);

await notifications.initialize(settings);

}

static Future scheduleNotification() async {
final scheduledTime =
tz.TZDateTime.now(tz.local).add(const Duration(seconds: 10));

await notifications.zonedSchedule(
  1,
  'Test Reminder',
  'Scheduled notification works',
  scheduledTime,
  const NotificationDetails(
    android: AndroidNotificationDetails(
      'daily_assistant_channel',
      'Daily Assistant',
      channelDescription: 'Reminder Notifications',
      importance: Importance.max,
      priority: Priority.high,
    ),
  ),
  androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
);

}
}