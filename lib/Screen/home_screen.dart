import 'package:flutter/material.dart';
import 'package:recpie_app/Screen/recpie_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Get Delicious Recipes Here!', // Changed to something catchy
          style: TextStyle(
              fontWeight: FontWeight.bold), // Optional: Bold title for emphasis
        ),
        centerTitle: true,
        backgroundColor: Colors.orange,
        elevation: 0,
        // Remove the leading button (back button) if present
        leading: Container(), // This removes the button in the AppBar
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar (using decoration handled by InputDecorationTheme)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Search for recipes...',
                  prefixIcon: Icon(Icons.search, color: Colors.orange),
                  filled: true,
                  fillColor: Color.fromARGB(
                      255, 255, 255, 255), // Set background color of text field
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    borderSide: BorderSide.none, // No border
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                ),
                onChanged: (query) {
                  // Handle the search query here
                },
              ),
            ),

            // Section Title
            const Text(
              "Featured Recipes",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),

            // Recipe Cards with Dark Grey Descriptions
            RecipeCard(
              title: 'Spaghetti Bolognese',
              imageUrl: 'assets/spaghetti.jpg',
              description:
                  'A classic Italian pasta dish with rich and flavorful sauce.',
              descriptionColor:
                  Colors.grey[700], // Set description text color to dark grey
              buttonLabel: 'See Recipe',
              onPressed: () {
                // Navigate to recipe details page or perform some action
              },
            ),
            const SizedBox(height: 16),
            RecipeCard(
              title: 'Chicken Curry',
              imageUrl: 'assets/chickencurry.jpg',
              description:
                  'A spicy and aromatic chicken curry with a creamy texture.',
              descriptionColor: const Color.fromARGB(
                  255, 44, 44, 44), // Set description text color to dark grey
              buttonLabel: 'See Recipe',
              onPressed: () {
                // Navigate to recipe details page or perform some action
              },
            ),
            const SizedBox(height: 16),
            RecipeCard(
              title: 'Apple Pie',
              imageUrl: 'assets/applepie.jpg',
              description:
                  'A sweet dessert made with spiced apple filling in a flaky crust.',
              descriptionColor:
                  Colors.grey[700], // Set description text color to dark grey
              buttonLabel: 'See Recipe',
              onPressed: () {
                // Navigate to recipe details page or perform some action
              },
            ),
            // Add more recipes as needed
          ],
        ),
      ),
    );
  }
}
