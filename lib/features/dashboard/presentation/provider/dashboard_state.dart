class DashboardState {
  int currentBnbIndex;

  DashboardState({
    this.currentBnbIndex = 0,
  });

  DashboardState copWith({
    int? currentBnbIndex,
  }) {
    return DashboardState(
      currentBnbIndex: currentBnbIndex ?? this.currentBnbIndex,
    );
  }
}
