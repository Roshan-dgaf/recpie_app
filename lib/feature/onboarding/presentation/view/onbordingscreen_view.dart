import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/feature/onboarding/presentation/view_model/cubit/onboarding_cubit.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool _isDarkTheme = false;

  final List<Map<String, String>> onboardingData = [
    {
      'title': 'Discover New Recipes',
      'description':
          'Explore a variety of delicious recipes from around the world.',
      'image': 'assets/images/1.jpg', // Replace with your image path
    },
    {
      'title': 'Cook With Ease',
      'description': 'Get step-by-step instructions to make cooking fun.',
      'image': 'assets/images/2.png', // Replace with your image path
    },
    {
      'title': 'Share Your Creations',
      'description': 'Share your recipes and culinary creations with others.',
      'image': 'assets/images/3.png', // Replace with your image path
    },
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isDarkTheme ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: _isDarkTheme ? Colors.black : Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              _isDarkTheme ? Icons.light_mode : Icons.dark_mode,
              color: _isDarkTheme ? Colors.white : Colors.black,
            ),
            onPressed: () {
              setState(() {
                _isDarkTheme = !_isDarkTheme;
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              itemCount: onboardingData.length,
              itemBuilder: (context, index) => _buildOnboardingPage(
                onboardingData[index]['title']!,
                onboardingData[index]['description']!,
                onboardingData[index]['image']!,
              ),
            ),
          ),
          _buildBottomControls(),
        ],
      ),
    );
  }

  Widget _buildOnboardingPage(String title, String description, String image) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 300), // Image with food-related content
          const SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: _isDarkTheme ? Colors.white : Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: TextStyle(
              fontSize: 16,
              color: _isDarkTheme ? Colors.white70 : Colors.black54,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomControls() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {
              context.read<OnboardingCubit>().goToLogin(context);
            },
            child: Text(
              'Skip',
              style: TextStyle(
                fontSize: 16,
                color: _isDarkTheme ? Colors.white : Colors.black,
              ),
            ),
          ),
          Row(
            children: List.generate(
              onboardingData.length,
              (index) => Container(
                margin: const EdgeInsets.only(right: 8),
                height: 8,
                width: _currentPage == index ? 24 : 8,
                decoration: BoxDecoration(
                  color: _currentPage == index
                      ? (_isDarkTheme ? Colors.white : Colors.black)
                      : (_isDarkTheme ? Colors.white38 : Colors.black26),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              if (_currentPage == onboardingData.length - 1) {
                context.read<OnboardingCubit>().goToLogin(context);
              } else {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            },
            icon: Icon(
              _currentPage == onboardingData.length - 1
                  ? Icons.check
                  : Icons.arrow_forward,
              color: _isDarkTheme ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
