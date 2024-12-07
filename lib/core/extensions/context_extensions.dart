import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;

  double get screenHeight => MediaQuery.of(this).size.height;

  EdgeInsets get safeAreaPadding => MediaQuery.of(this).padding;

  ThemeData get theme => Theme.of(this);
}
