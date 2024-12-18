import 'package:flutter/material.dart';

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/p.jpg', // Change this to your image path
                height: 300,
                width: 300,
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'Welcome to Our App',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              "Explore delicious recipes that make cooking easier and more fun!",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/onboarding2');
              },
              child: const Text('Let\'s Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}
