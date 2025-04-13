import 'package:flutter/material.dart';
import 'package:projet_fin_etude/core/theme/colors.dart';
import 'package:projet_fin_etude/core/theme/styles.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: AppColors.backgroundPrimary,
          child: Column(
            children: [
              const SizedBox(height: 150),
              Text(
                "Welcome to MEDITIME!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 36,
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Let's make healthcare simpler,\none appointment at a time!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.textColor,
                  ),
                ),
              ),
              const Spacer(),
              // تحديد ارتفاع الـ Container هنا 50% من الشاشة
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.backgroundSecondary,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                height: MediaQuery.of(context).size.height * 0.5, // 50% من ارتفاع الشاشة
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/login");
                      },
                      style: AppStyles.buttonStyle(AppColors.primaryColor),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: AppColors.backgroundPrimary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/signup");
                      },
                      style: AppStyles.buttonStyle(AppColors.backgroundSecondary),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
