import 'package:flutter/material.dart';
import '../../data/models/movie.dart';
import '../../data/services/api.dart';
import '../widgets/containerImageCarousel.dart';
import '../widgets/rowTextIcon.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  final Api _api = Api();

  // États pour chaque section
  Movie? _latestMovie;
  List<Movie> _nowPlayingMovies = [];
  List<Movie> _trendingMovies = [];
  List<Movie> _topRatedMovies = [];
  List<Movie> _upcomingMovies = [];

  // États de chargement
  bool _isLoadingLatest = true;
  bool _isLoadingNowPlaying = true;
  bool _isLoadingTrending = true;
  bool _isLoadingTopRated = true;
  bool _isLoadingUpcoming = true;

  String? _error;

  @override
  void initState() {
    super.initState();
    _loadAllData();
  }

  // Charger toutes les données en parallèle
  Future<void> _loadAllData() async {
    await Future.wait([
      _loadLatestMovie(),
      _loadNowPlayingMovies(),
      _loadTrendingMovies(),
      _loadTopRatedMovies(),
      _loadUpcomingMovies(),
    ]);
  }

  Future<void> _loadLatestMovie() async {
    setState(() {
      _isLoadingLatest = true;
      _error = null;
    });

    try {
      final movie = await _api.getLatestMovie();
      setState(() {
        _latestMovie = movie;
        _isLoadingLatest = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoadingLatest = false;
      });
    }
  }

  Future<void> _loadNowPlayingMovies() async {
    setState(() => _isLoadingNowPlaying = true);

    try {
      final movies = await _api.getNowPlaying();
      setState(() {
        _nowPlayingMovies = movies;
        _isLoadingNowPlaying = false;
      });
    } catch (e) {
      setState(() => _isLoadingNowPlaying = false);
      print('Erreur NowPlaying: $e');
    }
  }

  Future<void> _loadTrendingMovies() async {
    setState(() => _isLoadingTrending = true);

    try {
      final movies = await _api.getMovie(); // Trending day
      setState(() {
        _trendingMovies = movies.take(10).toList(); // Top 10
        _isLoadingTrending = false;
      });
    } catch (e) {
      setState(() => _isLoadingTrending = false);
      print('Erreur Trending: $e');
    }
  }

  Future<void> _loadTopRatedMovies() async {
    setState(() => _isLoadingTopRated = true);

    try {
      final movies = await _api.gettoprated(); // Déjà limité à 8
      setState(() {
        _topRatedMovies = movies;
        _isLoadingTopRated = false;
      });
    } catch (e) {
      setState(() => _isLoadingTopRated = false);
      print('Erreur TopRated: $e');
    }
  }

  Future<void> _loadUpcomingMovies() async {
    setState(() => _isLoadingUpcoming = true);

    try {
      final movies = await _api.getUpcoming();
      setState(() {
        _upcomingMovies = movies;
        _isLoadingUpcoming = false;
      });
    } catch (e) {
      setState(() => _isLoadingUpcoming = false);
      print('Erreur Upcoming: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 100,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'CineHub',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 40,
              child: SearchBar(
                hintText: "Rechercher un film",
                leading: const Icon(Icons.search),
                elevation: const WidgetStatePropertyAll(2),
                onTap: () {
                  // TODO: Implémenter la recherche
                  print('Recherche clicked');
                },
              ),
            ),
          ],
        ),
      ),
      body: _isLoadingLatest && _latestMovie == null
          ? const Center(child: CircularProgressIndicator())
          : _error != null && _latestMovie == null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 60, color: Colors.red),
                  const SizedBox(height: 16),
                  Text('Erreur: $_error'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _loadAllData,
                    child: const Text('Réessayer'),
                  ),
                ],
              ),
            )
          : RefreshIndicator(
              onRefresh: _loadAllData,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(height: 110),

                    // Section du film mis en avant
                    _buildFeaturedMovie(),

                    const SizedBox(height: 20),

                    // Sections de films
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      child: Column(
                        children: [
                          // Au cinéma maintenant
                          const RowTextIcon(
                            text: "Au cinéma maintenant",
                            icon: Icons.arrow_forward_ios_sharp,
                          ),
                          ContainerImageCarousel(
                            movies: _nowPlayingMovies,
                            isLoading: _isLoadingNowPlaying,
                          ),

                          const SizedBox(height: 20),

                          // Top 10 du moment
                          const RowTextIcon(
                            text: "Top 10 du moment",
                            icon: Icons.arrow_forward_ios_sharp,
                          ),
                          ContainerImageCarousel(
                            movies: _trendingMovies,
                            isLoading: _isLoadingTrending,
                          ),

                          const SizedBox(height: 20),

                          // Les mieux notés
                          const RowTextIcon(
                            text: "Les mieux notés",
                            icon: Icons.arrow_forward_ios_sharp,
                          ),
                          ContainerImageCarousel(
                            movies: _topRatedMovies,
                            isLoading: _isLoadingTopRated,
                          ),

                          const SizedBox(height: 20),

                          // Prochains films
                          const RowTextIcon(
                            text: "Prochains films",
                            icon: Icons.arrow_forward_ios_sharp,
                          ),
                          ContainerImageCarousel(
                            movies: _upcomingMovies,
                            isLoading: _isLoadingUpcoming,
                          ),

                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  // Widget pour le film mis en avant
  Widget _buildFeaturedMovie() {
    if (_latestMovie == null) {
      return const SizedBox.shrink();
    }

    return Stack(
      children: [
        // Image de fond
        SizedBox(
          height: MediaQuery.of(context).size.height / 2,
          child: _latestMovie!.backdropPath != null
              ? Image.network(
                  'https://image.tmdb.org/t/p/w780${_latestMovie!.backdropPath}',
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[800],
                      child: const Center(
                        child: Icon(Icons.movie, size: 80, color: Colors.white),
                      ),
                    );
                  },
                )
              : Container(
                  color: Colors.grey[800],
                  child: const Center(
                    child: Icon(Icons.movie, size: 80, color: Colors.white),
                  ),
                ),
        ),

        // Gradient overlay
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.7),
                  Colors.black,
                ],
              ),
            ),
          ),
        ),

        // Informations du film
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Badge "Nouvelle sortie"
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "NOUVELLE SORTIE",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // Titre du film
                Text(
                  _latestMovie!.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                // Note et date
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 20),
                    const SizedBox(width: 4),
                    Text(
                      _latestMovie!.voteAverage.toStringAsFixed(1),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Icon(
                      Icons.calendar_today,
                      color: Colors.white70,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      _latestMovie!.releaseDate,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // Description
                Text(
                  _latestMovie!.overview ?? 'Pas de description disponible',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                ),

                const SizedBox(height: 16),

                // Bouton "Voir les détails"
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Navigation vers la page de détails
                      print('Voir les détails de ${_latestMovie!.title}');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Voir les détails',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
