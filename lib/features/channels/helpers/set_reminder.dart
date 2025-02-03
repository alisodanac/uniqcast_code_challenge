
import 'package:uniqcast_code_challenge/core/reminders/notifications_service.dart';

class SetReminder {
  static void set({
    required String title,
    required String time,
    required DateTime programDateTime,
  }) {
    NotificationService.scheduleNotification(
      title: "Reminder for $title",
      body: "Your program $title has started",
      scheduledTime: programDateTime,
    );
  }
}
