import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_movies/features/home/data/models/movies_model.dart';
import '../../features/dashboard/presentation/views/dashboard_screen.dart';
import '../../features/home/presentation/views/home_screen.dart';
import '../../features/home/presentation/views/image_view.dart';
import '../../features/home/presentation/views/movie_detail_screen.dart';
import '../../features/splash/presentation/views/splash_screen.dart';

class AppRoutes {
  static Route? generateRoute(RouteSettings settings) {
    print('''
    
    current screen is => ${settings.name}
    
    ''');
    switch (settings.name) {
      case SplashScreen.route:
        return navigatePushToScreen(const SplashScreen());
      case DashboardScreen.route:
        return navigatePushToScreen(const DashboardScreen());
      case HomeScreen.route:
        return navigatePushToScreen(const HomeScreen());
      case MovieDetailScreen.route:
        return navigatePushToScreen(MovieDetailScreen(
          movie: settings.arguments as MoviesModel,
        ));
      case ImageView.route:
        return navigatePushToScreen(ImageView(
          posterURL: settings.arguments as String,
        ));
      default:
        return navigatePushToScreen(const SplashScreen());
    }
  }
}

PageRoute navigatePushToScreen(Widget screen) {
  if (Platform.isIOS) {
    return CupertinoPageRoute(builder: (context) => screen);
  } else {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: myTransitionBuilder,
      transitionDuration: const Duration(milliseconds: 300),
      barrierColor: Colors.black12.withOpacity(0.7),
    );
  }
}

Widget myTransitionBuilder(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  const begin = Offset(1.0, 0.0);
  const end = Offset.zero;
  final tween = Tween(begin: begin, end: end);
  final Animation<Offset> offsetAnimation = animation.drive(tween);

  return SlideTransition(
    position: offsetAnimation,
    child: child,
  );
}
