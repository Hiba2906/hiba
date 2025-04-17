import 'package:flutter/material.dart';
import 'package:projet_fin_etude/core/theme/colors.dart';
class Notification_Page extends StatelessWidget {
  const Notification_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundSecondary,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color:AppColors.primaryColor ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Row(
              children: const [
                Icon(Icons.notifications, color: AppColors.primaryColor, size: 30),
                SizedBox(width: 10),
                Text(
                  'Notification',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: ListView(
          children: const [
            NotificationSection(
              title: 'today',
              time: '11:27 pm',
              message: 'The doctor is absent from work.',
            ),
            Divider(height: 30),
            NotificationSection(
              title: 'yesterday',
              time: '11:27 pm',
              message: 'Your appointment is approaching.',
            ),
            Divider(height: 30),
            NotificationSection(
              title: 'last week',
              time: '11:27 pm',
              message: 'The doctor is on vacation.\nDoctor [اسم الطبيب] is available.',
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationSection extends StatelessWidget {
  final String title;
  final String time;
  final String message;

  const NotificationSection({
    super.key,
    required this.title,
    required this.time,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.blue,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.notifications_none, color:AppColors.primaryColor, size: 30),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    time,
                    style: const TextStyle(color: AppColors.strokeColor, fontSize: 12),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    message,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.4,
                      color: AppColors.textColor,
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
