import 'package:flutter/material.dart';
import 'package:projet_fin_etude/presentation/screens/login_page_screen.dart';
import 'package:projet_fin_etude/presentation/screens/home_screen.dart' ;
import 'package:projet_fin_etude/presentation/screens/signup_page.dart';
import 'package:projet_fin_etude/presentation/screens/welcome.dart';
import 'package:projet_fin_etude/presentation/screens/ForgotPasswordScreen.dart';
import 'package:projet_fin_etude/presentation/screens/first_screen.dart' ;
import 'package:projet_fin_etude/presentation/screens/appointment_screen.dart';
import 'package:projet_fin_etude/presentation/screens/doctor_profile.dart';


class AppRoutes {
  static const String login = '/login';
  static const String welcome = '/welcome';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String firstscreen = '/first_Screen';
  static const String appointment = '/appointment';
  static const String forgotPassword = '/forgotPassword';
   static const String DoctorProfile = '/DoctorProfile';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    var name = settings.name;
    switch (name) {
      case AppRoutes.login: 
        return MaterialPageRoute( builder: (_) => LoginScreen()); 
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case AppRoutes.welcome:
        return MaterialPageRoute(builder: (_) => Welcome());
      case AppRoutes.signup:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case AppRoutes.firstscreen :
        return MaterialPageRoute(
            builder: (_) => FirstScreen());
             case AppRoutes.appointment:
        return MaterialPageRoute(
            builder: (_) =>  AppointmentScreen()); 
             case AppRoutes.forgotPassword:
        return MaterialPageRoute(
            builder: (_) => ForgotPasswordScreen ());
            case AppRoutes.DoctorProfile:
       // return MaterialPageRoute( builder: (_) =>  DoctorProfile () ); 
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(child: Text('Page not found')),
                ));
    }
  }
}
