import 'package:flutter/material.dart';
import 'package:projet_fin_etude/core/theme/colors.dart';
import '../../../core/theme/styles.dart';
import 'package:projet_fin_etude/presentation/widgets/CustomBottomNavBar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  // مواعيد وهمية كمثال
  final List<Map<String, dynamic>> appointments = const [
    {'date': '2025-04-22', 'countdown': 10},
    {'date': '2025-04-23', 'countdown': 7},
    {'date': '2025-04-24', 'countdown': 4},
    {'date': '2025-04-24', 'countdown': 1},
    {'date': '2025-04-24', 'countdown': 1},

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      body: SafeArea(
        child: Column(
          children: [
           
            // أيقونات الموقع والتنبيهات
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(Icons.notifications,
                        color: AppColors.primaryColor, size: 40),
                    onPressed: () {
                      Navigator.pushNamed(context, "/Notification_Page");
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // ✅ محتوى المواعيد
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
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
                    const Text(
                      'My Appointments',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textColor,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // 🗂 قائمة المواعيد
                    Expanded(
                      child: ListView.builder(
                        itemCount: appointments.length,
                        itemBuilder: (context, index) {
                          final appointment = appointments[index];
                          return Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: AppColors.backgroundPrimary,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 6,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                              
Text(
  'Date: ${appointment['date']}',
  style: const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.textColor,
  ),
),
const SizedBox(height: 10),

// 🔄 سطر countdown مع الأيقونة
Row(
  children: [
    const Icon(Icons.hourglass_empty, color: AppColors.secondColor),
    const SizedBox(width: 8),
    Text(
      '${appointment['countdown']}',
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.secondColor,
      ),
    ),
  ],
),

const SizedBox(height: 10),

// 👥 عدد المنتظرين وعدد المسجلين تحت الـ countdown
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: const [
    Row(
      children: [
        Icon(Icons.people, color: AppColors.textColor),
        SizedBox(width: 5),
        Text(
          "5 waiting",
          style: TextStyle(
            fontSize: 14,
            color: AppColors.textColor,
          ),
        ),
      ],
    ),
    SizedBox(height: 5),
    Row(
      children: [
        Icon(Icons.check_circle, color: AppColors.textColor),
        SizedBox(width: 5),
        Text(
          "12 registered",
          style: TextStyle(
            fontSize: 14,
            color: AppColors.textColor,
          ),
        ),
      ],
    ),
  ],
),

const SizedBox(height: 10),

// 👨‍⚕️ زر الذهاب لملف الطبيب
IconButton(
  icon: const Icon(
    Icons.medical_information,
    color: AppColors.primaryColor,
    size: 40,
  ),
  onPressed: () {
    Navigator.pushNamed(context, "/DoctorProfile");
  },
),
                             ]

                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 10),

                    // ➕ زر موعد جديد
                    SizedBox(
                      width: double.infinity,
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
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
     // bottomNavigationBar: const CustomBottomNavBar(currentIndex: 0),
    );
  }
}
