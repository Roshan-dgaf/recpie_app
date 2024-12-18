import 'package:flutter/material.dart';

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({super.key});

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
              'Savor Every Moment',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'Enjoy the process of cooking with our step-by-step guidance.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Go back to Onboarding 1
                  },
                  child: const Text('Back'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login'); // Navigate to Login Screen
                  },
                  child: const Text('Next'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
