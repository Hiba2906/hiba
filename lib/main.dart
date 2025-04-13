import 'package:flutter/material.dart';

import 'app/routes/app_route.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.welcome, // أول شاشة عند التشغيل
      onGenerateRoute: AppRoutes.generateRoute, // إدارة التنقل بين الشاشات
    );
  }
}
