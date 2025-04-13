import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 10, // Replace with the actual number of notifications
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notification ${index + 1}'),
            subtitle: Text('This is the detail of notification ${index + 1}.'),
            onTap: () {
              // Handle notification tap
            },
          );
        },
      ),
    );
  }
}