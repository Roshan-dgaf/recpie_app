import 'package:flutter/material.dart';
import 'package:recpie_app/Screen/onboarding_screen1.dart';
import 'Screen/onboarding_screen2.dart';
import 'Screen/login_screen.dart';
import 'Screen/registration_screen.dart';
import 'Screen/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/onboarding1',  // Start with onboarding screen
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
