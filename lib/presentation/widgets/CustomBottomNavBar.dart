import 'package:flutter/material.dart';
import '../../../core/theme/colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  void _navigateTo(int index, BuildContext context) {
    switch (index) {
      case 0:
        if (ModalRoute.of(context)?.settings.name != '/home') {
          Navigator.pushReplacementNamed(context, '/home');
        }
        break;
      case 1:
        if (ModalRoute.of(context)?.settings.name != '/appointment') {
          Navigator.pushReplacementNamed(context, '/appointment');
        }
        break;
      case 2:
        if (ModalRoute.of(context)?.settings.name != '/doctor-profile') {
          Navigator.pushReplacementNamed(context, '/doctor-profile');
        }
        break;
      case 3:
        if (ModalRoute.of(context)?.settings.name != '/settings') {
          Navigator.pushReplacementNamed(context, '/settings');
        }
        break;
    }
  }

  BottomNavigationBarItem _buildNavItem({
    required IconData icon,
    required String label,
    required bool isActive,
  }) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: isActive ? AppColors.primaryColor : AppColors.textColor,
        size: 26,
      ),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => _navigateTo(index, context),
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.textColor,
      backgroundColor: AppColors.backgroundSecondary,
      type: BottomNavigationBarType.fixed,
      items: [
        _buildNavItem(
          icon: Icons.home,
          label: 'Home',
          isActive: currentIndex == 0,
        ),
        _buildNavItem(
          icon: Icons.calendar_today,
          label: 'Appointments',
          isActive: currentIndex == 1,
        ),
        _buildNavItem(
          icon: Icons.person,
          label: 'Doctor',
          isActive: currentIndex == 2,
        ),
        _buildNavItem(
          icon: Icons.settings,
          label: 'Settings',
          isActive: currentIndex == 3,
        ),
      ],
    );
  }
}
