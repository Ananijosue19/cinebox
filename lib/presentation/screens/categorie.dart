import 'package:flutter/material.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';

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
    final List<IconData> emojie = [
      Icons.emoji_emotions_outlined,
      Icons.emoji_events,
      Icons.emoji_food_beverage,
      Icons.emoji_nature,
      Icons.emoji_objects,
      Icons.emoji_people,
      Icons.emoji_symbols,
      Icons.emoji_transportation,
      Icons.airplanemode_active,
      Icons.emoji_objects,
      Icons.emoji_people,
      Icons.emoji_symbols,
      Icons.emoji_transportation,
    ];
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Categorie",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            Text("Explorez par genre", style: TextStyle(fontSize: 12)),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: GridView.builder(
          itemCount: 13,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.5,
          ),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("${categories[index]}"), Icon(emojie[index])],
              ),
            );
          },
        ),
      ),
    );
  }
}
