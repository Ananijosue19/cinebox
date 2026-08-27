import 'package:flutter/material.dart';

class Categorie extends StatelessWidget {
  const Categorie({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      "Action",
      "Comédie",
      "Drame",
      "Animation",
      "Crime",
      "Documentaire",
      "Fantastique",
      "Histoire",
      "Horreur",
      "Musical",
      "Romance",
      "Science-fiction",
      "Thriller",
    ];
    
    final List<IconData> icons = [
      Icons.local_fire_department,
      Icons.emoji_emotions,
      Icons.theater_comedy,
      Icons.animation,
      Icons.gavel,
      Icons.menu_book,
      Icons.auto_fix_high,
      Icons.history_edu,
      Icons.scuba_diving, // Alternative pour Horreur
      Icons.music_note,
      Icons.favorite,
      Icons.rocket_launch,
      Icons.psychology,
    ];

    final List<List<Color>> gradients = [
      [Colors.orange, Colors.deepOrange],
      [Colors.yellow.shade700, Colors.orange],
      [Colors.blue, Colors.indigo],
      [Colors.pink, Colors.purple],
      [Colors.red.shade900, Colors.black87],
      [Colors.green, Colors.teal],
      [Colors.purple, Colors.deepPurple],
      [Colors.brown, Colors.black54],
      [Colors.blueGrey, Colors.black],
      [Colors.cyan, Colors.blue],
      [Colors.red, Colors.pink],
      [Colors.deepPurple, Colors.blueAccent],
      [Colors.grey.shade800, Colors.black],
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Catégories",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            Text(
              "Explorez par genre",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.6,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                // TODO: Filtrer par catégorie
              },
              borderRadius: BorderRadius.circular(20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: gradients[index % gradients.length],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: gradients[index % gradients.length][0].withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Positioned(
                      right: -10,
                      bottom: -10,
                      child: Icon(
                        icons[index % icons.length],
                        size: 80,
                        color: Colors.white.withOpacity(0.2),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            icons[index % icons.length],
                            color: Colors.white,
                            size: 28,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            categories[index],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
