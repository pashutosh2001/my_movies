import 'package:flutter/material.dart';

import '../../styles/app_colors.dart';
import '../../styles/app_text_style.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final bool hasFocus;
  final String? hintText;
  final String? labelText;
  final TextStyle? hintTextStyle;
  final TextStyle? labelTextStyle;
  final String errorText;
  final Widget? suffixIcon;
  final Widget? preFixIcon;
  final double prefixIconMaxWidth;
  final bool isEnabled;
  final void Function(String)? onChanged;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Color? fillColor;
  final double? height;
  final int? maxLines;
  final int maxErrorLines;
  final bool isApiError;
  final bool alignLabelWithHint;

  const AppTextFormField({
    super.key,
    required this.textEditingController,
    required this.focusNode,
    required this.hasFocus,
    this.hintText,
    this.labelText,
    this.hintTextStyle,
    this.labelTextStyle,
    this.obscureText = false,
    this.suffixIcon,
    this.preFixIcon,
    this.prefixIconMaxWidth = 40,
    this.errorText = '',
    this.isEnabled = true,
    this.onChanged,
    this.keyboardType,
    this.fillColor = AppColors.white,
    this.height,
    this.maxLines,
    this.maxErrorLines = 2,
    this.isApiError = false,
    this.alignLabelWithHint = false,
  });

  @override
  Widget build(BuildContext context) {
    final isError = isApiError ? isApiError : errorText.isNotEmpty;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: height ?? 52,
          child: TextFormField(
            controller: textEditingController,
            focusNode: focusNode,
            onChanged: onChanged,
            maxLines: maxLines ?? 1,
            keyboardType: keyboardType ?? TextInputType.text,
            obscureText: obscureText,
            enabled: isEnabled,
            style: AppTextStyle.textSMregular.copyWith(
              color: AppColors.grey1D2939,
            ),
            cursorColor: AppColors.primary,
            cursorHeight: 18,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              hintText: hintText,
              hintStyle: hintTextStyle ??
                  AppTextStyle.textSMregular.copyWith(
                    color: AppColors.grey98A2B3,
                  ),
              labelText: labelText ?? hintText,
              labelStyle: hasFocus
                  ? labelTextStyle ??
                      AppTextStyle.textXSregular.copyWith(
                          color: isError
                              ? AppColors.errorRedF04438
                              : AppColors.primary)
                  : AppTextStyle.textSMregular.copyWith(
                      color: isError
                          ? AppColors.errorRedF04438
                          : AppColors.grey1D2939,
                    ),
              alignLabelWithHint: alignLabelWithHint,
              suffixIcon: suffixIcon,
              prefixIcon: preFixIcon,
              prefixIconConstraints:
                  BoxConstraints(maxHeight: 40, maxWidth: prefixIconMaxWidth),
              suffixIconConstraints:
                  const BoxConstraints(maxHeight: 24, maxWidth: 30),
              fillColor: fillColor,
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color:
                      isError ? AppColors.errorRedF04438 : AppColors.greyD0D5DD,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1,
                  color: AppColors.errorRedF04438,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color:
                      isError ? AppColors.errorRedF04438 : AppColors.greyD0D5DD,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: isError ? AppColors.errorRedF04438 : AppColors.primary,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
        if (errorText.isNotEmpty) ...[
          const SizedBox(height: 4),
          Text(
            errorText,
            maxLines: maxErrorLines,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.textSMregular.copyWith(
              color: AppColors.errorRedF04438,
            ),
          ),
        ],
      ],
    );
  }
}
