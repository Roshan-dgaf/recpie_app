import 'package:flutter/material.dart';
import 'package:recpie_app/app_utils.dart';
import 'package:recpie_app/widgets/input_field_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    void handleLogin() {
      String email = emailController.text;
      String password = passwordController.text;

      if (email.isEmpty || password.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Email and Password are required!"),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      // Navigate to the Dashboard screen
      Navigator.pushNamed(context, '/dashboard');
    }

    return Scaffold(
      backgroundColor: colorPrimary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Header Text
              const Text(
                "Login",
                style: TextStyle(
                  color: colorWhite,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              // Email Input Field
              Inputfield(
                controller: emailController,
                icon: Icons.email,
                hintText: "Enter your email",
              ),
              const SizedBox(height: 20),

              // Password Input Field
              Inputfield(
                controller: passwordController,
                icon: Icons.lock,
                hintText: "Enter your password",
                obscureText: true,
              ),
              const SizedBox(height: 30),

              // Login Button
              ElevatedButton(
                onPressed: handleLogin,
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorGreen,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  elevation: 5,
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: colorWhite,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Alternative Login (Google/Facebook)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.g_mobiledata,
                        color: colorWhite, size: 30),
                    onPressed: () {
                      // Add Google login functionality
                    },
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    icon:
                        const Icon(Icons.facebook, color: colorWhite, size: 30),
                    onPressed: () {
                      // Add Facebook login functionality
                    },
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // "Don't have an account?" Text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      color: colorWhite,
                      fontSize: 14,
                      fontFamily: "Montserrat",
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                        color: colorGreen,
                        fontSize: 14,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
