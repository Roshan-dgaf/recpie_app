import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> recipes = [
      {
        'title': 'Spaghetti Carbonara',
        'description':
            'A classic Italian pasta dish with creamy sauce and crispy bacon.',
        'image': 'assets/images/carbonara.jpg',
      },
      {
        'title': 'Grilled Chicken Salad',
        'description':
            'Healthy and delicious grilled chicken with fresh greens.',
        'image': 'assets/images/salad.jpg',
      },
      {
        'title': 'Chocolate Brownies',
        'description': 'Rich and fudgy chocolate brownies with a crispy top.',
        'image': 'assets/images/brownies.jpeg',
      },
    ];

    return Scaffold(
      appBar: AppBar(
          title: const Text('Get Delicious Recipes Here!',
              style: TextStyle(color: Colors.black)),
          backgroundColor: const Color.fromARGB(255, 255, 165, 0)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            final recipe = recipes[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.asset(
                      recipe['image']!,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          recipe['title']!,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurpleAccent,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          recipe['description']!,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurpleAccent,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              ' View Recipe',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
