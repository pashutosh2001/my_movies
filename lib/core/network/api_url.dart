class ApiUrl {
  ApiUrl._();
  static String get _baseUrl => "https://api.sampleapis.com";

  /// API endpoint for user login
  static String get movies => '$_baseUrl/movies/animation/';
}
