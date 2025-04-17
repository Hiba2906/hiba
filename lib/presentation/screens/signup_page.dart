import 'package:flutter/material.dart';
import '../../../core/theme/styles.dart';
import '../../../core/theme/colors.dart';
import '../../../presentation/widgets/custom_text_field.dart';
//import 'package:projet_fin_etude/presentation/widgets/custom_text_field.dart';
import 'package:projet_fin_etude/app/routes/app_route.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          color: AppColors.backgroundPrimary,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             const SizedBox(height: 50),
              Image.asset(
               'assets/images/logo.png',
            width: 150,
            height: 150,
                  ),
                  const SizedBox(height: 50),
              
              CustomTextField(
                controller: _fullNameController,
                labelText: "Full Name",
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: _emailController,
                labelText: "Email Address",
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: _phoneController,
                labelText: "Phone Number",
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime(2000),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                    builder: (context, child) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: ColorScheme.light(
                            primary: AppColors
                                .primaryColor, // لون التاريخ المحدد + لون الزرار
                            onPrimary: AppColors
                                .backgroundPrimary, // لون النص فوق اللون المحدد
                            onSurface: AppColors
                                .textColor, // لون الأرقام في الوضع العادي
                          ),
                          textButtonTheme: TextButtonThemeData(
                            style: TextButton.styleFrom(
                              foregroundColor: AppColors
                                  .primaryColor, // لون أزرار OK و Cancel
                            ),
                          ),
                        ),
                        child: child!,
                      );
                    },
                  );

                  if (pickedDate != null) {
                    _birthDateController.text =
                        "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
                  }
                },
                child: AbsorbPointer(
                  child: CustomTextField(
                    controller: _birthDateController,
                    labelText: "Date of Birth",
                  ),
                ),
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: _passwordController,
                labelText: "Password",
                obscureText: _obscurePassword,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                    color: AppColors.primaryColor,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: _confirmPasswordController,
                labelText: "Confirm Password",
                obscureText: _obscureConfirmPassword,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureConfirmPassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: AppColors.primaryColor,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureConfirmPassword = !_obscureConfirmPassword;
                    });
                  },
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 299,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.firstscreen);
                  },
                  style: AppStyles.buttonStyle(AppColors.primaryColor),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(color: Colors.grey, thickness: 1),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: Text.rich(
                  TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(color: AppColors.textColor, fontSize: 16),
                    children: [
                      TextSpan(
                        text: "Login",
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
