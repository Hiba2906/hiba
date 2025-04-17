import 'package:flutter/material.dart';
import 'package:projet_fin_etude/core/theme/colors.dart';
import 'package:projet_fin_etude/presentation/widgets/CustomBottomNavBar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.primaryColor,
        title: const Text(
          "SETTING PAGE",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 3),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Image.asset(
            'assets/images/logo.png',
            width: 150,
            height: 150,
          ),
          const SizedBox(height: 20),

          /// نستخدم Expanded باش ياخذ كل المساحة المتبقية
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.backgroundSecondary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSettingTile(
                    icon: Icons.person,
                    label: "edit profil",
                    onTap: () {
                      Navigator.pushNamed(context, "/edit_profile");
                    },
                  ),
                  const Divider(thickness: 1, height: 30),
                  _buildSettingTile(
                    icon: Icons.contact_mail,
                    label: "contact us",
                    onTap: () {
                      Navigator.pushNamed(context, "/contact_us");
                    },
                  ),
                  const Divider(thickness: 1, height: 30),
                  _buildSettingTile(
                    icon: Icons.logout,
                    label: "log out",
                    onTap: () {
                      // log out logic
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingTile({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: AppColors.primaryColor, size: 28),
          const SizedBox(width: 20),
          Text(
            label,
            style: const TextStyle(
              fontSize: 18,
              color: AppColors.textColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
