class ApiConstants {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmOTUxMWY1OTUzMGY0ZmI3YmQyYzNhMGFhM2FhZDQyNCIsIm5iZiI6MTY5OTE4NjMzMi40MzkwMDAxLCJzdWIiOiI2NTQ3ODY5Y2Q1NWMzZDAwYzViZWQ0NjgiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.v2qFFFL-kaRiE676T2Eb8ErS2Nd5U2-QdJ-J5rezZeU';
  static const String imageBaseUrl = 'https://image.tmdb.org/t/p/w500';

  // Endpoints
  static const String popularMovies = '/movie/popular';
  static const String topRatedMovies = '/movie/top_rated';
  static const String upcomingMovies = '/movie/upcoming';
  static const String movieDetails = '/movie/'; // + {movie_id}
  static const String searchMovie = '/search/movie';
}
