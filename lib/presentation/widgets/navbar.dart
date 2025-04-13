import 'package:flutter/material.dart';
import 'package:projet_fin_etude/core/theme/colors.dart';

class CustomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomNavBar(
      {Key? key, required this.currentIndex, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      items: [
        _buildNavItem("home.png", "home", 0),
        _buildNavItem("doctor.png", "doctor profile", 1),
        _buildNavItem("check-mark.png", "appointment", 2),
        _buildNavItem("user(1).png", "profile", 3),
      ],
    );
  }

  BottomNavigationBarItem _buildNavItem(
      String iconName, String label, int index) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        "assets/$iconName",
        width: 24,
        height: 24,
        color: currentIndex == index
            ? AppColors.primaryColor
            : AppColors.textColor, // لون مميز للأيقونة النشطة
      ),
      label: label,
    );
  }
}
