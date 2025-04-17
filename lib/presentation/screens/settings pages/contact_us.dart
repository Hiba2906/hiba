import 'package:flutter/material.dart';
import 'package:projet_fin_etude/core/theme/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  // 🧩 معلومات الاتصال (قابلة للتغيير)
  final String phone = "+213 555 55 55 55";
  final String email = "contact@meditime.com";
  final String instagram = "@meditime_clinic";
  final String whatsapp = "+213 666 66 66 66";

  @override
   Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.primaryColor,
        title: const Text(
          "contact us",
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
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                
                children: [
                  const Text(
                    "Contact Information",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                    ),),
                  const SizedBox(height: 50),
                   _buildContactItem(
              icon: Icons.phone,
              label: phone,
              onTap: () {},
            ),
            const SizedBox(height: 20),

            _buildContactItem(
              icon: Icons.email,
              label: email,
              onTap: () {},
            ),
            const SizedBox(height: 20),

            _buildContactItem(
              icon: FontAwesomeIcons.instagram,
              label: instagram,
              onTap: () {},
            ),
            const SizedBox(height: 20),

            _buildContactItem(
              icon: FontAwesomeIcons.whatsapp,
              label: whatsapp,
              onTap: () {},
            ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

Widget _buildContactItem({
    required IconData icon,
    required String label,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: AppColors.primaryColor, size: 26),
          const SizedBox(width: 12),
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.textColor,
            ),
          ),
        ],
      ),
    );
  }
  
  }

