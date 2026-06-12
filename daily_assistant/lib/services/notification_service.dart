import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
static final FlutterLocalNotificationsPlugin notifications =
FlutterLocalNotificationsPlugin();

static Future<void> init() async {
const AndroidInitializationSettings androidSettings =
AndroidInitializationSettings('@mipmap/ic_launcher');

```
const InitializationSettings settings =
    InitializationSettings(android: androidSettings);

await notifications.initialize(settings);
```

}

static Future<void> showInstantNotification() async {
await notifications.show(
1,
'Test Reminder',
'Instant notification test',
const NotificationDetails(
android: AndroidNotificationDetails(
'daily_assistant_channel',
'Daily Assistant',
channelDescription: 'Reminder Notifications',
importance: Importance.max,
priority: Priority.high,
),
),
);
}
}
