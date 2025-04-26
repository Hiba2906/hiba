import 'package:flutter/material.dart';
import 'package:projet_fin_etude/core/theme/colors.dart';
import 'package:projet_fin_etude/core/theme/styles.dart';
import 'package:projet_fin_etude/presentation/widgets/CustomBottomNavBar.dart';


class DoctorProfile extends StatelessWidget {
  const DoctorProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.primaryColor,
        title: const Text(
          "Doctor Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 2),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // صورة الدكتور
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage("assets/images/doctor.png"), // غيّر الصورة حسب الحاجة
            ),
            const SizedBox(height: 20),
            // الاسم
            const Text(
              "Dr. Sarah Amari",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.textColor,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              "General Practitioner",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),

            // معلومات
            _buildInfoTile("Email", "dr.sarah@meditime.com"),
            _buildInfoTile("Phone", "+213 661 23 45 67"),
            _buildInfoTile("Clinic Address", "23 rue des Frères, Alger"),
            _buildInfoTile("Working Hours", "Sunday - Thursday\n08:00 AM - 04:00 PM"),

            const SizedBox(height: 30),

            // زر التواصل
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.message,color:  AppColors.backgroundPrimary,),
               onPressed: () {
                          Navigator.pushNamed(context, "/contact_us");
                        },
                style: AppStyles.buttonStyle(AppColors.primaryColor),
                label: const Text(
                  "Contact us",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.backgroundPrimary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTile(String title, String value) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.backgroundSecondary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.info_outline, color: AppColors.primaryColor),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.textColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//bottomNavigationBar: const CustomBottomNavBar(currentIndex: 2),