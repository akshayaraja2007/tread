import 'package:flutter/material.dart';
import 'services/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daily Assistant',
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> scheduleTestNotification() async {
    final time = DateTime.now().add(const Duration(seconds: 10));

    await NotificationService.scheduleNotification(
      id: 1,
      title: 'Test Reminder',
      body: 'Notification is working',
      scheduledTime: time,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Assistant'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: scheduleTestNotification,
          child: const Text('Test Notification'),
        ),
      ),
    );
  }
}