import 'package:flutter/material.dart';

class ContainerImageCarousel extends StatelessWidget {
  const ContainerImageCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          final itemWidth = MediaQuery.sizeOf(context).width / 2.5;

          return SizedBox(
            width: itemWidth,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 10,
              ), // espace propre entre les cartes
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image + Placeholder
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          height: 220,
                          width: itemWidth,
                          color: Colors.grey.shade300,
                          child: const Placeholder(),
                        ),
                      ),
                      Positioned(
                        top: 2,
                        right: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color: Colors.black38,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.star, color: Colors.yellow, size: 12),
                              const SizedBox(width: 2),
                              Text("4.5", style: TextStyle(fontSize: 12)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8), // petit espace propre

                  const Text(
                    "Titre du film",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
