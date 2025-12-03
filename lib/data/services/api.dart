import 'package:dio/dio.dart';
import '../models/movie.dart';

class Api {
  static const String _baseUrl = 'https://api.themoviedb.org/3';
  static const String _bearerToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmOTUxMWY1OTUzMGY0ZmI3YmQyYzNhMGFhM2FhZDQyNCIsIm5iZiI6MTY5OTE4NjMzMi40MzkwMDAxLCJzdWIiOiI2NTQ3ODY5Y2Q1NWMzZDAwYzViZWQ0NjgiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.v2qFFFL-kaRiE676T2Eb8ErS2Nd5U2-QdJ-J5rezZeU';

  late final Dio _dio;

  // Endpoints centralisés
  static const _endpoints = {
    'trendingDay': '/trending/movie/day',
    'topRated': '/movie/top_rated',
    'recommendations': '/movie/152/recommendations',
    'trendingWeek': '/trending/movie/week',
    'tvOnTheAir': '/tv/on_the_air',
    'nowPlaying': '/movie/now_playing', // ✅ Pour les dernières sorties
    'upcoming': '/movie/upcoming', // ✅ Pour les prochains films
  };

  Api() {
    _dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Authorization':
              'Bearer $_bearerToken', // ✅ Bearer token dans les headers
          'Content-Type': 'application/json',
        },
      ),
    );

    // Logger pour déboguer (optionnel)
    _dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: false,
        responseBody: true,
        error: true,
      ),
    );
  }

  // Méthode générique pour les listes de films
  Future<List<Movie>> _fetchMovies(
    String endpoint, {
    int? limit,
    Map<String, dynamic>? extraParams,
  }) async {
    try {
      final response = await _dio.get(endpoint, queryParameters: extraParams);

      final List results = response.data['results'] ?? [];
      final movies = results.map((json) => Movie.fromJson(json)).toList();

      return limit != null ? movies.take(limit).toList() : movies;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Films tendance du jour
  Future<List<Movie>> getMovie() => _fetchMovies(_endpoints['trendingDay']!);

  // Top films notés (limité à 8)
  Future<List<Movie>> gettoprated() =>
      _fetchMovies(_endpoints['topRated']!, limit: 8);

  // Films recommandés
  Future<List<Movie>> getrecommendating() =>
      _fetchMovies(_endpoints['recommendations']!);

  // Films tendance de la semaine
  Future<List<Movie>> gettopweek() => _fetchMovies(_endpoints['trendingWeek']!);

  // Séries TV en cours de diffusion
  Future<List<Movie>> getLast() => _fetchMovies(
    _endpoints['tvOnTheAir']!,
    extraParams: {'language': 'fr-FR', 'page': 1},
  );

  // ✅ Films au cinéma maintenant (now playing)
  Future<List<Movie>> getNowPlaying() =>
      _fetchMovies(_endpoints['nowPlaying']!);

  // ✅ Prochains films à venir
  Future<List<Movie>> getUpcoming() => _fetchMovies(_endpoints['upcoming']!);

  // ✅ Récupérer LE dernier film sorti (le plus récent)
  Future<Movie?> getLatestMovie() async {
    try {
      final movies = await getNowPlaying();

      if (movies.isEmpty) return null;

      // Trier par date de sortie décroissante
      movies.sort((a, b) => b.releaseDate.compareTo(a.releaseDate));

      return movies.first;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Gestion des erreurs
  String _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return 'Délai de connexion dépassé';
      case DioExceptionType.sendTimeout:
        return "Délai d'envoi dépassé";
      case DioExceptionType.receiveTimeout:
        return 'Le serveur met trop de temps à répondre';
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        return 'Erreur serveur: $statusCode';
      case DioExceptionType.cancel:
        return 'Requête annulée';
      case DioExceptionType.connectionError:
        return 'Pas de connexion internet';
      default:
        return 'Une erreur est survenue: ${error.message}';
    }
  }
}
