import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_movies/core/utils/common_exports.dart';
import 'package:my_movies/features/dashboard/presentation/provider/dashboard_state.dart';

class DashboardNotifierProvider extends StateNotifier<DashboardState> {
  DashboardNotifierProvider() : super(DashboardState()) {
    pageController = PageController(initialPage: 0);
  }

  late PageController pageController;

  changeBnbIndex(int index) {
    state = state.copWith(currentBnbIndex: index);
    pageController.jumpToPage(index);
  }
}
