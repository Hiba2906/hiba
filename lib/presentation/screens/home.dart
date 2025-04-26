import 'package:flutter/material.dart';
import 'package:projet_fin_etude/core/theme/colors.dart';
import '../../../core/theme/styles.dart';

class FirstScreen extends StatelessWidget {
  final String name;

  const FirstScreen({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Top icons (location + notification)
            Padding(
              
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
               
                  IconButton(
                    icon: const Icon(Icons.notifications, size: 40, color: AppColors.primaryColor),
                    onPressed: () => Navigator.pushNamed(context, "/Notification_Page"),
                  ),
                  // const Icon(Icons.location_on, size: 30, color: AppColors.primaryColor),
                ],
              ),
            ),

            // 🔹 Welcome text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const Icon(Icons.person, color: AppColors.primaryColor),
                  const SizedBox(width: 20),
                  Text(
                    "Welcome to our app, $name.",
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // 🔹 Two colored boxes side by side
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildSquareButton(
                    context,
                    color: AppColors.secondColor,
                    icon: Icons.calendar_month,
                    label: "Appointments",
                    onTap: () => Navigator.pushNamed(context, "/state"),
                  ),
                  _buildSquareButton(
                    context,
                    color: AppColors.primaryColor,
                    icon: Icons.settings,
                    label: "Settings",
                    onTap: () => Navigator.pushNamed(context, "/settings_Page"),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // 🔹 Centered image or content container
            Expanded(
              child: Container(
                width: double.infinity,
                height: 70,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: AppColors.backgroundSecondary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Image.asset(
                    "assets/images/logo.png",
                    fit: BoxFit.contain,
                    width: 200,
                  ),
                ),
              ),
            ),
                 SizedBox(height: 40),
            // 🔹 Bottom button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SizedBox(
                width: 700,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/appointment_monthly");
                  },
                  style: AppStyles.buttonStyle(AppColors.primaryColor),
                  child: const Text(
                    " NEW APPOINTMENT",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      letterSpacing: 1.1,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: const CustomBottomNavBar(currentIndex: 0),
    );
  }

  Widget _buildSquareButton(BuildContext context,
      {required Color color, required IconData icon, required String label, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
       width: MediaQuery.of(context).size.width * 0.42,
        height: 100,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 30),
            const SizedBox(height: 10),
            Text(
              label,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
