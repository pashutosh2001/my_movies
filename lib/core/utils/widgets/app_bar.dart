import 'package:flutter/material.dart';

import '../../styles/app_colors.dart';
import '../../styles/app_text_style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final List<Widget>? actions;
  final bool centerTitle;
  final bool showLeading;
  final Widget? leading;
  final PreferredSizeWidget? bottom;

  const CustomAppBar({
    super.key,
    required this.title,
    this.backgroundColor = Colors.white,
    this.actions,
    this.centerTitle = true,
    this.showLeading = true,
    this.leading,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: AppTextStyle.textMDmedium.copyWith(
          color: AppColors.grey344054,
        ),
      ),
      backgroundColor: backgroundColor,
      surfaceTintColor: backgroundColor,
      actions: actions,
      centerTitle: centerTitle,
      leading: showLeading
          ? leading ??
              const BackButton(
                style: ButtonStyle(
                  iconSize: WidgetStatePropertyAll(20),
                  iconColor: WidgetStatePropertyAll(AppColors.grey5D667B),
                ),
              )
          : null,
      elevation: 10,
      bottom: bottom,
      shadowColor: AppColors.greyEAECF0.withOpacity(0.36),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0.0));
}
