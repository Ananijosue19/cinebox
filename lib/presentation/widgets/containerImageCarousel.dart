import 'package:cinebox/presentation/screens/detail.dart';
import 'package:flutter/material.dart';
import '../../data/models/movie.dart';

class ContainerImageCarousel extends StatelessWidget {
  final List<Movie> movies;
  final bool isLoading;

  const ContainerImageCarousel({
    super.key,
    required this.movies,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const SizedBox(
        height: 200,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    if (movies.isEmpty) {
      return const SizedBox(
        height: 200,
        child: Center(child: Text('Aucun film disponible')),
      );
    }

    return SizedBox(
      height: 240,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Container(
            width: 140,
            margin: const EdgeInsets.only(right: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image du film
                Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Detail(movie: movie),
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: movie.posterPath != null
                            ? Image.network(
                                'https://image.tmdb.org/t/p/w342${movie.posterPath}',
                                height: 180,
                                width: 140,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    height: 180,
                                    width: 140,
                                    color: Colors.grey[800],
                                    child: const Icon(
                                      Icons.movie,
                                      size: 50,
                                      color: Colors.white,
                                    ),
                                  );
                                },
                              )
                            : Container(
                                height: 180,
                                width: 140,
                                color: Colors.grey[800],
                                child: const Icon(
                                  Icons.movie,
                                  size: 50,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),
                    // Note
                    Positioned(
                      top: 2,
                      right: 5,
                      child: Container(
                        padding: EdgeInsetsGeometry.symmetric(horizontal: 6),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 14,
                            ),
                            const SizedBox(width: 2),
                            Text(
                              movie.voteAverage.toStringAsFixed(1),
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                // Titre du film
                Text(
                  movie.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
