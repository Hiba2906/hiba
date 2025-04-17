import 'package:flutter/material.dart';
import 'package:projet_fin_etude/core/theme/colors.dart';
import '../../../core/theme/styles.dart';
import 'package:projet_fin_etude/presentation/widgets/CustomBottomNavBar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.location_on,
                      color: AppColors.primaryColor, size: 50),
                  onPressed: () {
                    Navigator.pushNamed(context, "/location");
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.notifications,
                      color: AppColors.primaryColor, size: 50),
                  onPressed: () {
                    Navigator.pushNamed(context, "/Notification_Page");
                  },
                ),
              ],
            ),
            const SizedBox(height: 20), // مساحة تع AppBar مستقبلاً

            // Main container
            Expanded(
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.8,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1),
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                decoration: const BoxDecoration(
                  color: AppColors.backgroundSecondary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // 🟦 my appointment at the top
                    const Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'my appointment',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // 📅 Date Container
                    Container(
                      width: 324,
                      height: 108,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.backgroundPrimary,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'date : ',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textColor,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // 🕒 Countdown Timer Text
                    const Text(
                      'Countdown Timer',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textColor,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // ⏳ Countdown Container (bigger one)
                    Container(
                      width: 324,
                      height: 111,
                      decoration: BoxDecoration(
                        color: AppColors.backgroundPrimary,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      //FONCTION TO COUNTDOWN
                      child: const Text(
                        '10',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textColor,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 50,
                    ),
                    // 🟢 New Appointment Button
                    SizedBox(
                      width: 345,
                      height: 58,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/appointment_monthly");
                        },
                        style: AppStyles.buttonStyle(AppColors.primaryColor),
                        child: const Text(
                          "NEW APPOINTMENT",
                          style: TextStyle(
                            color: AppColors.backgroundPrimary,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
       bottomNavigationBar: const CustomBottomNavBar(currentIndex: 0),
    );
  }
}
