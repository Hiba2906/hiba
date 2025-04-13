import 'package:flutter/material.dart';
import 'package:projet_fin_etude/core/theme/colors.dart';
import '../../../core/theme/styles.dart';
import 'package:projet_fin_etude/presentation/widgets/CustomBottomNavBar.dart';


class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      body: SafeArea(
        child: Column(
          children: [ 
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.location_on, color: AppColors.primaryColor, size: 50),
                  onPressed: () {
                    Navigator.pushNamed(context, "/location");
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.notifications, color: AppColors.primaryColor , size: 50),
                  onPressed: () {
                     Navigator.pushNamed(context, "/notification");
                  },
                ),
              ],
            ), 
             SizedBox(height: 60,),
            Row(
                       children: [
        const SizedBox(width: 20), // مساحة تع AppBar مستقبلاً
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage("assets/images/user.png",), // يمكن استبدالها بـ AssetImage إذا كانت الصورة محلية
        ),
        const SizedBox(height: 20),
        Text(
          '    welcome to our APP (name)!',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
                    ),
            const SizedBox(height: 20), // مساحة تع AppBar مستقبلاً

            // Main container
            Expanded(
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.8,
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
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
                    SizedBox(height: 100,),
                    const Align(
                      alignment: Alignment.topCenter,
                      
                      child: Text(
                        'You have not booked an appointment yet ',
                         textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textColor,
                          
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    
                  
                      SizedBox( height: 100,),
                    // 🟢 New Appointment Button
                    SizedBox(
                      width: 345,
                      height: 58,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/appointment");
                        },
                        style: AppStyles.buttonStyle(AppColors.primaryColor),
                        child: const Text(
                          "book now",
                          style: TextStyle(
                            color: AppColors.backgroundPrimary,
                            fontSize: 30,
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
