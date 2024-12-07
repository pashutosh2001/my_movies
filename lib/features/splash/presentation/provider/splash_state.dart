class SplashState<T> {
  String? version;
  double logoWidth;

  SplashState({
    this.version,
    this.logoWidth = 0,
  });

  SplashState copyWith({
    String? version,
    double? logoWidth,
  }) {
    return SplashState(
      version: version ?? this.version,
      logoWidth: logoWidth ?? this.logoWidth,
    );
  }
}
