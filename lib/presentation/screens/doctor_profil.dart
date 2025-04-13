import 'package:flutter/material.dart';
import 'package:projet_fin_etude/core/theme/colors.dart';
import 'package:provider/provider.dart';

import '../../../data/models/user.dart';
import '../../../core/theme/styles.dart';
import '../../../core/theme/colors.dart';
import 'package:projet_fin_etude/presentation/widgets/CustomBottomNavBar.dart';

class DoctorProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        
        foregroundColor: AppColors.primaryColor,
      ),
bottomNavigationBar: const CustomBottomNavBar(currentIndex: 2),
    );
  }
}
