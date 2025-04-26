import 'package:flutter/material.dart';
import 'package:projet_fin_etude/core/theme/colors.dart';
import 'package:projet_fin_etude/core/theme/styles.dart';
import 'package:projet_fin_etude/presentation/widgets/custom_text_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Reset Password"),
        centerTitle: true,
        foregroundColor: AppColors.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 60),
            Text(
              "Enter your email and we’ll send you a link to reset your password.",
              style: TextStyle(color: AppColors.textColor, fontSize: 18),
            ),
            const SizedBox(height: 40),
            CustomTextField(
              controller: _emailController,
              labelText: "Email Address",
            ),
            const SizedBox(height: 50),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/reset");
                  // Handle reset logic
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Reset link sent to your email."),
                    ),
                  );
                },
                style: AppStyles.buttonStyle(AppColors.primaryColor),
                child: const Text(
                  "Send Reset Link",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
