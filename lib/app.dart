import 'package:flutter/material.dart';
import 'package:recpie_app/Screen/dashboard_screen.dart';
import 'package:recpie_app/Screen/login_screen.dart';
import 'package:recpie_app/Screen/onboarding_screen1.dart';
import 'package:recpie_app/Screen/onboarding_screen2.dart';
import 'package:recpie_app/Screen/registration_screen.dart';
import 'package:recpie_app/core/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
      initialRoute: '/onboarding1', // Start with onboarding screen
      routes: {
        '/onboarding1': (context) => const OnboardingScreen1(),
        '/onboarding2': (context) => const OnboardingScreen2(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegistrationScreen(),
        '/dashboard': (context) => const DashboardScreen(),
      },
    );
  }
}
