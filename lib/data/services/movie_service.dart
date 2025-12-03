import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../constants/api_constants.dart';
import '../models/movie.dart';

class MovieService {
  late final Dio _dio;

  MovieService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 3),
        queryParameters: {
          'api_key': ApiConstants.apiKey,
          'language': 'fr-FR', // Pour avoir les résultats en français
        },
      ),
    );

    // Ajouter un logger pour voir les requêtes (en développement)
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
      ),
    );
  }

  // Récupérer les films populaires
  Future<List<Movie>> getPopularMovies({int page = 1}) async {
    try {
      final response = await _dio.get(
        ApiConstants.popularMovies,
        queryParameters: {'page': page},
      );

      final List results = response.data['results'];
      return results.map((json) => Movie.fromJson(json)).toList();
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Récupérer les meilleurs films
  Future<List<Movie>> getTopRatedMovies({int page = 1}) async {
    try {
      final response = await _dio.get(
        ApiConstants.topRatedMovies,
        queryParameters: {'page': page},
      );

      final List results = response.data['results'];
      return results.map((json) => Movie.fromJson(json)).toList();
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Rechercher des films
  Future<List<Movie>> searchMovies(String query, {int page = 1}) async {
    try {
      final response = await _dio.get(
        ApiConstants.searchMovie,
        queryParameters: {'query': query, 'page': page},
      );

      final List results = response.data['results'];
      return results.map((json) => Movie.fromJson(json)).toList();
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Récupérer les détails d'un film
  Future<Movie> getMovieDetails(int movieId) async {
    try {
      final response = await _dio.get('${ApiConstants.movieDetails}$movieId');
      return Movie.fromJson(response.data);
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
        return 'Délai de réception dépassé';
      case DioExceptionType.badResponse:
        return 'Erreur serveur: ${error.response?.statusCode}';
      case DioExceptionType.cancel:
        return 'Requête annulée';
      default:
        return 'Erreur de connexion';
    }
  }
}
