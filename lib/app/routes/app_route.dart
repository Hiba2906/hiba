import 'package:flutter/material.dart';
import 'package:projet_fin_etude/presentation/screens/login_page_screen.dart';
import 'package:projet_fin_etude/presentation/screens/state_appointment.dart';
import 'package:projet_fin_etude/presentation/screens/settings%20pages/contact_us.dart';
import 'package:projet_fin_etude/presentation/screens/settings%20pages/edit_profile.dart';
import 'package:projet_fin_etude/presentation/screens/settings%20pages/settings.dart';
import 'package:projet_fin_etude/presentation/screens/signup_page.dart';
import 'package:projet_fin_etude/presentation/screens/welcome.dart';
import 'package:projet_fin_etude/presentation/screens/ForgotPasswordScreen.dart';
import 'package:projet_fin_etude/presentation/screens/home.dart';
import 'package:projet_fin_etude/presentation/screens/appointment_monthly.dart';
import 'package:projet_fin_etude/presentation/screens/appointment_weekly.dart';
import 'package:projet_fin_etude/presentation/screens/doctor_profil.dart';
import 'package:projet_fin_etude/presentation/screens/notifications.dart';
import 'package:projet_fin_etude/presentation/screens/ResetPasswordScreen.dart';









class AppRoutes {
  static const String login = '/login';
  static const String welcome = '/welcome';
  static const String signup = '/signup';
  static const String state= '/state';
  static const String home = '/home';
  static const String forgotPassword = '/forgotPassword';
  static const String Doctor_Profile = '/DoctorProfile';
  static const String appointment_weekly = '/appointment_weekly';
  static const String appointment_monthly = '/appointment_monthly';
  static const String NotificationPage = '/Notification_Page';
    static const String settings = '/settings_Page';
    static const String editprofil = '/edit_profile';
    static const String contact = '/contact_us';
    static const String reset = '/reset';
 
 




  static Route<dynamic> generateRoute(RouteSettings settings) {
    var name = settings.name;
    switch (name) {
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case AppRoutes.state:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case AppRoutes.welcome:
        return MaterialPageRoute(builder: (_) => Welcome());
      case AppRoutes.signup:
        return MaterialPageRoute(builder: (_) => SignUpScreen());

      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => FirstScreen(name: 'hiba',));

      case AppRoutes.appointment_monthly:
        return MaterialPageRoute(builder: (_) => AppointmentMonthly());

      case AppRoutes.forgotPassword:
        return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());

         case AppRoutes.NotificationPage:
        return MaterialPageRoute(builder: (_) => Notification_Page());

      case AppRoutes.appointment_weekly:
        return MaterialPageRoute(builder: (_) => AppointmentWeekly());

        case AppRoutes.Doctor_Profile:
        return MaterialPageRoute(builder: (_) => DoctorProfile ());

         case AppRoutes.settings:
        return MaterialPageRoute(builder: (_) => SettingsPage());

         case AppRoutes.editprofil:
        return MaterialPageRoute(builder: (_) => EditProfilePage());

        case AppRoutes.contact:
        return MaterialPageRoute(builder: (_) => ContactUsPage());

        case AppRoutes.reset:
        return MaterialPageRoute(builder: (_) =>ResetPasswordScreen());


        
        
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(child: Text('Page not found')),
                ));
    }
  }
}
