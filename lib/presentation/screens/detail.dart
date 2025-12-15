import 'package:flutter/material.dart';

import '../../data/models/movie.dart';

class Detail extends StatelessWidget {
  final Movie movie;
  const Detail({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 2,
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w342${movie.posterPath}',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.black,
                          ),
                        ),
                        Icon(Icons.favorite_border, color: Colors.black),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
